# 06 — Verification

"Exactly the same" needs a test, not an opinion. This is how a screen is proven.

## Layer 1 — Golden tests (the primary gate)

One golden per screen, rendered at the artboard's exact reference size.

```dart
testWidgets('Client_Home matches artboard', (tester) async {
  await tester.binding.setSurfaceSize(const Size(390, 844));
  await tester.pumpWidget(harness(const HomeScreen()));
  await precacheIcons(tester);
  await tester.pumpAndSettle();
  await expectLater(
    find.byType(HomeScreen),
    matchesGoldenFile('goldens/client_home.png'),
  );
});
```

The harness must pin everything that could vary between machines:

```dart
Widget harness(Widget child) => MediaQuery(
      data: const MediaQueryData(
        size: Size(390, 844),
        devicePixelRatio: 1.0,          // 1:1 with design px
        textScaler: TextScaler.noScaling,
        padding: EdgeInsets.zero,        // artboards have no safe-area inset
      ),
      child: MaterialApp(
        theme: AxTheme.light,
        debugShowCheckedModeBanner: false,
        home: child,
      ),
    );
```

### Three things that will break goldens if you skip them

1. **Bundle Manrope.** A network-fetched font renders as Roboto on first frame
   and Manrope later — non-deterministic. Load the bundled font in
   `flutter_test_config.dart` via `loadAppFonts()`.
2. **Precache SVGs.** `SvgPicture` decodes async. Without a precache pass, icons
   render blank in the golden.
3. **Run goldens on one platform in CI.** Font rasterisation differs between
   Windows/macOS/Linux. Pick Linux in CI and treat local goldens as advisory.

Golden diffs are reviewed as images, not accepted blindly. `--update-goldens`
without looking at the diff defeats the entire mechanism.

## Layer 2 — Side-by-side comparison

Goldens prove the app has not *changed*. They do not prove it matches the
*design*. For that, compare against the artboard directly.

`tool/design/compare.dart` builds a two-up HTML page: the artboard rendered in a
390-wide iframe next to the Flutter golden PNG at the same width, with an opacity
slider to flip between them.

```bash
dart run tool/design/compare.dart Client_Home
# writes build/compare/Client_Home.html
```

Do this once per screen when first built, and again whenever the artboard
changes. Misalignments over ~2 px are bugs; the design's half-pixel font sizes
mean sub-pixel differences are expected and fine.

## Layer 3 — Responsive checks (automated)

Every screen gets these, driven from a shared table so adding a screen adds the
checks automatically:

```dart
for (final size in [Size(320, 640), Size(390, 844), Size(430, 932)]) {
  testWidgets('$name has no overflow at $size', (tester) async {
    await tester.binding.setSurfaceSize(size);
    await tester.pumpWidget(harness(screen));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
```

Flutter reports overflow as an exception in tests, so `takeException()` catches
the yellow-and-black stripes automatically. Add the same loop at
`textScaler: TextScaler.linear(1.3)`.

Business screens use `[Size(900, 700), Size(1160, 760), Size(1440, 900)]`.

## Layer 4 — Token lint

A test that greps the source for literals that should be tokens:

```dart
test('no raw colours outside design/tokens', () {
  final offenders = Directory('lib')
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'))
      .where((f) => !f.path.contains('design/tokens'))
      .where((f) => RegExp(r'Color\(0x').hasMatch(f.readAsStringSync()));
  expect(offenders, isEmpty, reason: 'Use AxColors');
});
```

Extend the same pattern to `fontSize:` outside `ax_type.dart`. This is crude and
it works — it catches the one failure mode (a hardcoded value creeping in during
a rushed screen) that quietly destroys design-system consistency.

## Layer 5 — Manual checklist per screen

Automation cannot see these. Walk the artboard once, top to bottom:

- [ ] Every string present, character for character, including `·` `→` `…` `×`
- [ ] Heading font is Manrope, body font is the system font — check by eye,
      they are easy to mix up in a hurry
- [ ] Uppercase eyebrows have visible letter-spacing (the `em → px` conversion
      is the most commonly botched step — see Rule 8)
- [ ] Icon stroke weights match: active nav icons are heavier than inactive
- [ ] No shadows anywhere
- [ ] Borders are `#ECE7DC`, not Flutter's default divider grey
- [ ] Gradient direction runs top-left to bottom-right

## CI

```yaml
- flutter analyze --fatal-infos
- flutter test                       # includes goldens, responsive, token lint
```

Goldens run only on Linux. A PR that changes a golden must include the new PNG
and a note saying why it changed.

## What "done" means

A screen is done when: its golden passes, its responsive matrix passes, the
token lint passes, and someone has looked at the layer-2 comparison and signed
off. Not before.

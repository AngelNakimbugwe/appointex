# 03 — The CSS → Flutter Rulebook

This is the most important doc in the set. It is what lets the build be both
**pixel-exact** and **responsive from day one**, which otherwise conflict.

## The governing principle

> **Visual constants are exact. Container dimensions are flexible.**

| Exact — copy the literal, always | Flexible — derive from the parent |
|---|---|
| Colours, gradients | Root artboard `width` / `height` |
| Font size, weight, letter-spacing, line-height | Any full-width child's `width` |
| Border radius, border width | Fixed heights on text-bearing containers |
| Padding, margin, `gap` | `overflow: hidden` on scrollable regions |
| Icon size and stroke width | Column widths that were percentages of 390/1160 |
| Element sizes that are *intrinsically* fixed — a 56 px avatar, a 20 px icon, a 64 px nav bar | |

An avatar is 56 px because an avatar is 56 px. A card is 350 px wide only because
the artboard is 390 px wide — that one becomes `double.infinity`.

---

## Rule 1 — The root container

```html
<div style="width:390px; height:844px; background:#FFFFFF;
            display:flex; flex-direction:column; overflow:hidden;">
```

`390×844` is the iPhone 14 viewport, `1160×760` is a desktop window. Neither is a
design constraint. Translate to:

```dart
Scaffold(
  backgroundColor: AxColors.surface,
  body: SafeArea(child: Column(...)),
)
```

Drop `width`, drop `height`, drop `overflow: hidden`. Add `SafeArea` — the
artboards have no notch or home-indicator inset, so that space must come out of
the flexible region, never out of a fixed one.

## Rule 2 — flex-direction and gap

| CSS | Flutter |
|---|---|
| `display:flex; flex-direction:column` | `Column` |
| `display:flex` (default row) | `Row` |
| `gap: 12px` | `Column(spacing: 12)` / `Row(spacing: 12)` |
| `align-items: center` | `crossAxisAlignment: CrossAxisAlignment.center` |
| `justify-content: space-between` | `mainAxisAlignment: MainAxisAlignment.spaceBetween` |

`spacing:` on `Row`/`Column` landed in Flutter 3.27 and is an exact match for
CSS `gap`. Use it. Do **not** emulate gap with `SizedBox` between children or
with per-child `margin` — both drift the moment a child is conditional.

The design's `gap` values are load-bearing and irregular (`22`, `18`, `13`, `11`).
Copy them literally.

## Rule 3 — flex-shrink / flex

| CSS | Flutter | Meaning |
|---|---|---|
| `flex-shrink: 0` | plain child in a `Column` | Sized by its content. Header, nav bar. |
| `flex: 1` | `Expanded` | Takes the remaining space. |
| `flex: 1` + `overflow: hidden` | `Expanded(child: SingleChildScrollView(...))` | **This is the scrollable body.** |

Every mobile screen follows the same skeleton, visible in the markup as
`flex-shrink:0` header → `flex:1` body → `flex-shrink:0` nav:

```dart
Column(
  children: [
    const _Header(),                                   // flex-shrink: 0
    Expanded(                                          // flex: 1
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(spacing: 22, children: [...]),
      ),
    ),
    const AxBottomNav(),                               // flex-shrink: 0
  ],
)
```

The artboard has `overflow: hidden` because a static frame cannot scroll — content
is simply cut off at 844 px. **In the app that region must scroll.** This is the
one place where matching the artboard literally would be wrong, and it is why
"responsive from day one" was the right call.

## Rule 4 — Fixed heights

| Height | Verdict |
|---|---|
| `height: 64px` on the nav bar | **Keep.** Structural. |
| `height: 112px` on a carousel card | **Keep.** Intrinsic to the card. |
| `width/height: 56px` on an avatar | **Keep.** |
| `height: 844px` on the root | **Drop.** |
| `height` on anything wrapping only text | **Drop**, use padding instead. |

The test: *would a designer change this number if the phone got wider?* If no,
keep it. If yes, it is a proxy for the viewport and must go.

## Rule 5 — Widths

| CSS | Flutter |
|---|---|
| `width: 220px` (biz sidebar) | `SizedBox(width: 220, ...)` — keep |
| `width: 300px` (carousel card in a 390 frame) | Keep — it is a peek-card, intentional |
| Any element spanning the content column | `double.infinity` / let it stretch |
| `flex: 1` siblings in a row | `Expanded` each |

`min-width: 0` on a flex child (needed in CSS to let text ellipsize) has no
Flutter equivalent — `Expanded` already does this. Where the CSS relies on
`overflow: hidden` to clip a long name, use
`Text(..., maxLines: 1, overflow: TextOverflow.ellipsis)`.

## Rule 6 — CSS Grid

Only Home and a few category sections use grid:

```css
display:grid; grid-template-columns: repeat(3, minmax(0,1fr)); gap:10px;
```

Do **not** use `GridView` — it scrolls, and it is a sliver, which fights the
surrounding `Column`. Use:

```dart
GridView.count(
  crossAxisCount: 3,
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  ...
)
```

only if the cells are genuinely uniform-height. Otherwise — and this is usually
the better answer here, because the "Spa & massage" label wraps to two lines while
the others do not — build it from `Row`s of `Expanded` children so cells size to
the tallest item in each row:

```dart
Column(spacing: 10, children: [
  Row(spacing: 10, children: [ Expanded(child: hair), Expanded(child: makeup), Expanded(child: nails) ]),
  Row(spacing: 10, children: [ Expanded(child: spa),  Expanded(child: photo),  Expanded(child: event) ]),
]);
```

`IntrinsicHeight` around each `Row` makes the tiles equal height, matching how
CSS grid rows behave.

## Rule 7 — Horizontal scrollers

```css
display:flex; gap:12px; overflow:hidden;
```
with a wide first child and a clipped second child is the artboard's way of
drawing a **carousel**. The 40 px sliver at the edge is the next card peeking.

```dart
SizedBox(
  height: 112,
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    separatorBuilder: (_, __) => const SizedBox(width: 12),
    itemBuilder: ...,
  ),
)
```

Note the padding moves **onto the ListView**, not the parent — otherwise cards
clip at the screen edge instead of scrolling past it. Where the parent already
has `padding: 0 20px`, hoist that padding into the scroller for that section only.

## Rule 8 — Text

- CSS `font-size` is in CSS px; Flutter `fontSize` is in logical pixels. At
  `devicePixelRatio` aside, these are the same unit. Copy the number.
- CSS `line-height: 1.6` → Flutter `height: 1.6`. Same semantics.
- CSS `letter-spacing: 0.06em` → Flutter `letterSpacing: fontSize * 0.06`.
  **This is the one unit conversion in the whole port. Getting it wrong is the
  most likely cause of an uppercase eyebrow looking subtly wrong.**
- `text-transform: uppercase` has no Flutter equivalent — uppercase the string in
  the fixture, or call `.toUpperCase()` at the call site.
- `&hellip;` `&middot;` `&rarr;` `&times;` `&ndash;` in the markup are `…` `·` `→`
  `×` `–`. Use the real characters in Dart.

## Rule 9 — Gradients

```css
background: linear-gradient(135deg, #6B3F3A, #A66A5D);
```

CSS angles run clockwise from "to top". `135deg` therefore points to the
bottom-right:

```dart
const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF6B3F3A), Color(0xFFA66A5D)],
)
```

`120deg` (the urgent banner) is not a corner-to-corner diagonal. Approximate with
`begin: Alignment(-1.0, -0.6), end: Alignment(1.0, 0.6)` — or accept
`topLeft → bottomRight`, since at that element's aspect ratio the difference is
under a pixel. Note the decision in the screen spec either way.

## Rule 10 — Absolutely positioned decoration

```css
position:absolute; width:140px; height:140px; border-radius:50%;
background:#FFB5A7; opacity:0.15; right:-50px; top:-40px;
```

That is a decorative blob bleeding outside the card. In Flutter:

```dart
ClipRRect(
  borderRadius: BorderRadius.circular(16),
  child: Stack(
    clipBehavior: Clip.hardEdge,
    children: [
      Positioned(right: -50, top: -40, child: Container(width: 140, height: 140,
        decoration: BoxDecoration(shape: BoxShape.circle,
          color: AxColors.salmon.withValues(alpha: 0.15)))),
      ...content,
    ],
  ),
)
```

The `ClipRRect` is essential — `Stack` does not clip overflow by default, and the
CSS relies on the parent's `overflow: hidden`.

Use `.withValues(alpha:)`, not the deprecated `.withOpacity()`.

## Rule 11 — Borders

`border: 1px solid #ECE7DC` → `Border.all(color: AxColors.border, width: 1)`.

`border-top: 3px solid #FFB5A7` on the business stat tiles (a coloured top
accent) → `Border(top: BorderSide(color: AxColors.salmon, width: 3), ...)` with
the other three sides at `AxColors.border`. Combined with `borderRadius`, Flutter
requires all sides to be uniform **unless** you drop `borderRadius` or paint the
accent as a separate child. Here, paint it as a child: a 3 px `Container` at the
top of a `ClipRRect`-ed card. Otherwise Flutter throws at runtime.

## Rule 12 — Breakpoints

| Form factor | Reference | Must also work at |
|---|---|---|
| Client mobile | 390×844 | 320×640 (smallest supported), 430×932 |
| Business | 1160×760 | 900 (sidebar stays, content compresses), 1440 (content pane grows, max-width the tables at 1160) |

Below 900 px the business dashboard is out of scope — show a
"Use a larger screen" panel rather than attempting a mobile dashboard the design
does not specify.

## Rule 13 — Text scaling

Every screen must survive `textScaler: TextScaler.linear(1.3)` without overflow.
This is why fixed heights on text containers are banned. Where a genuinely fixed
box must hold scaling text (the 64 px bottom nav), clamp instead:

```dart
MediaQuery.withClampedTextScaling(maxScaleFactor: 1.2, child: AxBottomNav())
```

Clamping in one known place is honest. Letting the whole app ignore the user's
accessibility setting is not.

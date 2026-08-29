# 00 — Build Strategy

## The goal, stated precisely

Reproduce all 21 Appointex artboards in Flutter so that a screenshot of the app
at the design's reference width is **indistinguishable** from the artboard —
while the same code still lays out correctly on a 320 px phone, a 430 px phone,
and (for business screens) a 1440 px browser window.

Two properties that pull against each other:

- **Exact** — every colour, radius, font size, gap and icon path matches the design.
- **Responsive** — no fixed heights, no clipped content, text scales with the OS.

The resolution is a hard split: **visual constants are exact and hardcoded;
container dimensions are flexible.** Section 03 is the rulebook for which is which.

## Why the design is unusually portable

The artboards contain **zero raster images**. Everything is inline CSS
(flex, grid, gradients, borders) and hand-drawn inline SVG. Concretely:

- 21 artboards, 2 form factors (390×844 mobile, 1160×760 desktop)
- 58 distinct hex colours, ~25 font sizes, 17 radii — all literals in the markup
- 186 SVG instances collapsing to **44 distinct icons / 60 assets**
- Exactly one webfont: **Manrope** (weights 500/600/700/800), applied via `.head`
- Body font is the system UI stack

So the port is mechanical rather than interpretive. There is no "what did the
designer mean" step. That is the whole reason this plan can promise exactness.

## Phases

Each phase ends in a state where `flutter run` works and the app is demoable.

### Phase 0 — Foundation (no screens yet)
1. `pubspec.yaml`: add `flutter_svg`, `go_router`, `flutter_riverpod`, `intl`;
   declare `assets/icons/` and bundle the four Manrope weights (see 02).
2. Extract the icons: `node tool/design/icons.mjs` (see 05). Done.
3. Write `lib/design/tokens/` — colours, typography, spacing, radii (see 01).
4. Write `lib/design/theme.dart` — the `ThemeData` both apps share.
5. Write `lib/app/router.dart` with all 21 routes pointing at placeholder screens.
6. Replace the stock counter `main.dart`.

**Exit:** app boots, every route reachable, tokens compile, icons render.

### Phase 1 — Shared component library
Build the widgets in [04-COMPONENT-INVENTORY.md](04-COMPONENT-INVENTORY.md)
that appear on 3+ screens: `AxScaffold`, `AxBottomNav`, `AxSidebar`, `AxCard`,
`AxProviderRow`, `AxChip`, `AxPrimaryButton`, `AxField`, `AxStatTile`,
`AxSectionHeader`, `AxVerifiedBadge`, `AxAdBadge`, `AxDataTable`, `AxToggle`.

Each gets a widgetbook-style gallery entry and a golden test at the design width.

**Exit:** the gallery route renders every component, goldens pass.

### Phase 2 — Client app, 12 screens
Build in flow order, because later screens reuse earlier components:

`Onboarding → Register → Home → Urgent → Search → Provider → Book →
EventBundle → Checkout → Confirmation → MyBookings → Chat`

`Home` is the heaviest (21 icons, 4 distinct sections) and is deliberately third,
so the carousel/category-grid/provider-row components it establishes are
available to `Search`, `Urgent` and `Provider`.

**Exit:** all 12 goldens pass at 390×844; manual pass at 320 and 430 wide.

### Phase 3 — Business dashboard, 8 screens
`Onboarding → Dashboard → Calendar → Clients → Earnings → Services →
FeaturedSpots → Settings`

These share one persistent chrome (220 px sidebar + content pane), so
`AxSidebar` + `BizShell` is built once and every screen becomes a body widget.
Five of the eight are table-driven — `AxDataTable` carries `Clients`,
`Earnings`, `Services` and parts of `FeaturedSpots`.

**Exit:** all 8 goldens pass at 1160×760; content pane reflows to 900–1600 px.

### Phase 4 — Motion, states, polish
Nothing in the artboards is animated — they are static frames. This phase adds
what a static design cannot express: press states, loading skeletons, empty
states, error states, page transitions, keyboard handling on forms.
Each is specified per-screen under **Interactions & states** in the spec.

## Working rule for every screen

1. Open the artboard: `.design-src/<Screen>.dc.html`. Read it top to bottom.
2. Open the spec: `docs/specs/<row>/<n>-<screen>.md`.
3. Build the widget in `lib/features/<feature>/presentation/<screen>_screen.dart`.
4. **Never inline a hex colour or a font size.** If a value is not yet a token,
   add it to the token file first, then use it. A raw `Color(0xFF...)` outside
   `lib/design/tokens/` fails review.
5. Run the golden test. Diff until it passes at the reference width.
6. Resize-check at 320 / 430 (mobile) or 900 / 1440 (business).
7. Tick the box in [PROGRESS.md](PROGRESS.md).

## Definition of done, per screen

- [ ] Golden test passes at the design's reference size
- [ ] No overflow at 320×640 (mobile) / 900×600 (business)
- [ ] No overflow at `textScaleFactor: 1.3`
- [ ] Zero literal colours/sizes outside the token files
- [ ] Every string in the artboard appears (placeholder copy is real copy here —
      the artboards are written in final product voice, e.g. "Where to today?")
- [ ] All icons come from `AxIcons` / `AxDuoIcons` / `AxArt`, not Material
      approximations, and nothing two-tone is tinted
- [ ] `flutter analyze` clean

## What this plan deliberately does not do

- **No backend.** Screens are driven by hardcoded model instances in
  `lib/features/<f>/data/fixtures.dart`, matching the artboard copy exactly.
  Swapping in a real repository later touches no widget code.
- **No dark mode.** The artboards define one light palette. Adding a dark theme
  means inventing 58 colours that the designer never specified.
- **No i18n pass.** Copy is baked in per the artboards; currency is UGX.

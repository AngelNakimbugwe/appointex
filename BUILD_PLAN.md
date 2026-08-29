# Appointex — Build Plan for the Implementing Agent

You are building a Flutter app that must render **exactly** like a set of design
artboards, while still being responsive. This file is the entry point. Read it
fully before writing any code, then work phase by phase, screen by screen,
verifying as you go — this repo has no CI to catch you later.

## The one rule above all others

> **Never invent a value.** Every colour, font size, radius, spacing, gap, and
> string of copy in this app must trace back to a literal in
> [`.design-src/*.dc.html`](.design-src/). If you can't point to the line it
> came from, don't write it — go look it up instead.

The source design (`appointex-app-pages.html`, a Claude Design canvas of 21
artboards) has already been extracted for you into [`.design-src/`](.design-src/)
— one plain HTML file per screen, inline-styled, zero raster images. Every value
you need is a literal in that markup. This is what makes "pixel-exact and
responsive" achievable instead of a contradiction: there is no interpretation
step, only translation.

## What "done" looks like

A screenshot of the running app, at the artboard's reference width (390px for
client screens, 1160px for business screens), is visually indistinguishable
from the artboard — **and** the same screen has zero overflow at 320px and at
`textScaler` 1.3x, and zero overflow on business screens down to 900px.

## Read these first, in order

All of the analysis is already done. Do not re-derive it — read it.

| # | Doc | Answers |
|---|---|---|
| 1 | [`docs/00-STRATEGY.md`](docs/00-STRATEGY.md) | Why this design is portable, the phase plan, definition of done |
| 2 | [`docs/01-DESIGN-TOKENS.md`](docs/01-DESIGN-TOKENS.md) | Every colour/type/radius/spacing value, with its Dart token name |
| 3 | [`docs/02-ARCHITECTURE.md`](docs/02-ARCHITECTURE.md) | Folder layout, routing, state management, naming |
| 4 | [`docs/03-RESPONSIVE-RULES.md`](docs/03-RESPONSIVE-RULES.md) | **The CSS→Flutter rulebook.** What's exact vs. flexible, rule by rule |
| 5 | [`docs/04-COMPONENT-INVENTORY.md`](docs/04-COMPONENT-INVENTORY.md) | Every shared widget, extracted from the repeated markup, with its CSS source |
| 6 | [`docs/05-ICON-CATALOG.md`](docs/05-ICON-CATALOG.md) | The 60 extracted icon assets and how to call them |
| 7 | [`docs/06-VERIFICATION.md`](docs/06-VERIFICATION.md) | Goldens, responsive checks, token lint — how a screen gets proven done |
| 8 | [`docs/specs/`](docs/specs/) | One spec per screen — the per-screen source of truth, generated from the artboard |
| 9 | [`docs/PROGRESS.md`](docs/PROGRESS.md) | The live tracker. Tick boxes here as you go; don't keep your own. |

If anything in this file conflicts with one of those docs, the doc wins — this
file is a summary and a work order, not a second source of truth.

## Non-negotiable constraints

- **No raw literals outside `lib/design/tokens/`.** Every `Color(0xFF...)`,
  bare `fontSize:`, or `BorderRadius.circular(n)` in a screen or widget file is
  a defect. Use `AxColors.*`, `AxType.*`, `AxRadius.*`, `AxSpace.*`.
- **No shadows.** The design has none — zero `box-shadow` anywhere in the
  markup. Set `elevation: 0` and `shadowColor: Colors.transparent` globally in
  the theme, and avoid `Card`, `AppBar`, `NavigationBar`, `DataTable`, `Switch`,
  `ListTile`, `Divider` — see the anti-pattern table at the bottom of
  [`docs/04-COMPONENT-INVENTORY.md`](docs/04-COMPONENT-INVENTORY.md). Each
  brings Material defaults (elevation, fixed heights, ripples) that fight this
  design.
- **Bundle Manrope**, don't fetch it. Four weights (500/600/700/800) as local
  `.ttf` under `assets/fonts/`, declared in `pubspec.yaml`. A network font makes
  goldens non-deterministic and the app is worse for a real user besides.
- **`Row`/`Column(spacing:)` for CSS `gap`**, not manual `SizedBox` spacers —
  they drift the moment a child becomes conditional.
- **The artboard's `overflow: hidden` body must become a scrolling
  `Expanded > SingleChildScrollView`** in the app. This is the one place where
  copying the artboard literally would be wrong — a static frame can't scroll,
  the app must. See Rule 3 in `03-RESPONSIVE-RULES.md`.
- **Fixtures carry the artboard's exact copy.** "Where to today?", "Grace
  Nabbosa Braids", "4.9 · from UGX 25,000" — verbatim, not paraphrased. Live in
  `features/<f>/data/fixtures.dart`.
- **Special characters are real characters.** `&hellip;` → `…`, `&middot;` →
  `·`, `&rarr;` → `→`, not the HTML entity.

## Execution order

### Phase 0 — Foundation
Nothing else starts until this compiles and boots.

1. `pubspec.yaml` — add `flutter_svg`, `go_router`, `flutter_riverpod`, `intl`;
   declare `assets/icons/` and the four bundled Manrope weights.
2. Source the four Manrope `.ttf` files (Google Fonts, OFL-licensed) into
   `assets/fonts/`.
3. `lib/design/tokens/` — `ax_colors.dart`, `ax_gradients.dart`, `ax_type.dart`,
   `ax_radius.dart`, `ax_space.dart`, transcribed from
   `docs/01-DESIGN-TOKENS.md`.
4. `lib/design/theme.dart` — one `ThemeData`, `elevation: 0` everywhere.
5. `lib/design/icons/ax_icon.dart` — `AxIcon` / `AxDuoIcon` / `AxArt` wrapping
   `SvgPicture.asset` per `docs/05-ICON-CATALOG.md`. (`ax_icons.dart` is already
   generated at `lib/design/icons/ax_icons.dart`.)
6. `lib/app/router.dart` — all 21 routes from `docs/02-ARCHITECTURE.md`,
   pointing at placeholder screens.
7. `lib/main.dart` — replace the stock counter app with `MaterialApp.router`.
8. Golden test harness — `flutter_test_config.dart` loading bundled fonts, per
   `docs/06-VERIFICATION.md` Layer 1.
9. Token-lint test per `docs/06-VERIFICATION.md` Layer 4.

**Verify before moving on:** `flutter pub get`, `flutter analyze --fatal-infos`,
`flutter test` all pass; `flutter run` boots to `/onboarding` with no red
screen.

### Phase 1 — Shared component library
Build every Tier 1 widget in `docs/04-COMPONENT-INVENTORY.md`
(`AxMobileHeader`, `AxBottomNav`, `AxSidebar`, `AxAvatar`, `AxVerifiedBadge`,
`AxRating`, `AxProviderRow`, `AxCard`, `AxChip`, `AxField`, `AxPrimaryButton`)
before touching a screen. Add a component gallery route (`lib/dev/gallery.dart`,
debug-only) so each one is visible in isolation. Tier 2 widgets
(`AxStatTile`, `AxDataTable`, `AxToggle`, `AxPill`, `AxTierCard`, `AxPlanCard`)
can wait for Phase 3 — they're business-only.

**Verify:** gallery route renders every Tier 1 widget correctly at its spec'd
sizes; each has a golden.

### Phase 2 — Client app, 12 screens, in this order
`Onboarding → Register → Home → Urgent → Search → Provider → Book →
EventBundle → Checkout → Confirmation → MyBookings → Chat`

This order is deliberate: `Home` is third and is the heaviest screen (21 icons,
carousel, category grid, provider rows) — building it early means `Search`,
`Urgent` and `Provider` inherit working components instead of duplicating them.

Per screen, follow the loop below. Specs are at
`docs/specs/client/01-onboarding.md` through `12-chat.md`.

### Phase 3 — Business dashboard, 8 screens, in this order
`Onboarding → Dashboard → Calendar → Clients → Earnings → Services →
FeaturedSpots → Settings`

Build `BizShell` (sidebar + content pane) once, before `Dashboard`. Five of the
eight screens are table-driven — `AxDataTable` (Tier 2) carries `Clients`,
`Earnings`, `Services`, and part of `FeaturedSpots`. Specs are at
`docs/specs/business/01-onboarding.md` through `08-settings.md`.

### Phase 4 — Motion, states, polish
The artboards are static frames; this phase adds what they can't show: press
states, loading skeletons, empty states, error states, page transitions,
keyboard handling on `Register`, `Chat`, `Biz_Onboarding`. Per-screen detail is
in each spec's "Interactions & states" section.

## The loop for every single screen

1. Open the artboard: `.design-src/<Screen>.dc.html`. Read it top to bottom —
   it's plain, inline-styled HTML, entirely readable.
2. Open the spec: `docs/specs/<row>/<n>-<screen>.md`. It tells you which
   components apply and flags anything screen-specific the artboard doesn't
   cover.
3. Build the screen in
   `lib/features/<feature>/presentation/<screen>_screen.dart`, composing
   `Ax*` widgets — do not re-derive a component that already exists.
4. Add fixtures with the artboard's exact copy to
   `lib/features/<feature>/data/fixtures.dart`.
5. Write the golden test at the artboard's reference size
   (`docs/06-VERIFICATION.md` Layer 1).
6. Run `dart run tool/design/compare.dart <Screen>` (Layer 2) and actually look
   at the diff — don't `--update-goldens` blind.
7. Add the responsive test matrix (Layer 3): 320/390/430 for client screens,
   900/1160/1440 for business, each also at `textScaler` 1.3x.
8. Walk the manual checklist in `docs/06-VERIFICATION.md` Layer 5.
9. Tick every box for that screen in [`docs/PROGRESS.md`](docs/PROGRESS.md).

Do not mark a screen done on golden-pass alone — the manual checklist exists
because letter-spacing, stroke-weight, and font-family mistakes pass a golden
diff if the reference golden itself was captured wrong.

## Known gaps — decide, don't block

The artboards don't cover everything the app needs. Don't stall on these;
apply the documented interim call and move on, noting it in the relevant
screen's spec:

| Gap | Interim call |
|---|---|
| No Profile screen, but bottom nav has a Profile tab | Route it to a placeholder; flag in `PROGRESS.md` |
| No filled-input state (artboards only show empty fields, `#9A9A9A` placeholder) | Entered text is `#3A3A3A`; note it as a deliberate extension |
| No dark mode | Explicitly out of scope — see `00-STRATEGY.md` |
| No chat inbox/thread list, only one open conversation | Build a minimal list; not pixel-sourced, use existing tokens only |
| No error/empty/loading states | Phase 4, per-screen, using existing tokens only |
| Business dashboard below 900px | Show a "use a larger screen" panel, not a squeezed layout |

## What not to do

- Don't touch `.design-src/` — it's the frozen source of truth. If you think
  it's wrong, say so; don't edit around it.
- Don't add a backend, i18n pass, or dark theme — out of scope, see
  `00-STRATEGY.md`.
- Don't reorder the business sidebar or the client bottom-nav tabs — the order
  is part of the design.
- Don't approximate an icon with a Material icon — every icon ships as an
  extracted asset under `assets/icons/`. See `docs/05-ICON-CATALOG.md`.

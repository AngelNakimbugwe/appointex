# Appointex

A two-sided booking marketplace for beauty & wellness services, built with Flutter. Clients discover and book providers (braids, hair, makeup, nails, spa, photography); businesses manage their calendar, clients, services and earnings from a desktop-style dashboard.

The UI is a pixel-exact, responsive implementation of 21 design artboards (12 client screens at 390×844, 8 business screens at 1160×760, plus the canvas root). Every colour, font size, radius and string traces back to a literal in the extracted design source under `.design-src/`.

## Features

**Client app (mobile)** — onboarding, registration, home with carousel and category grid, urgent (same-day) booking, search, provider profiles, service booking, event bundling, checkout, confirmation, bookings management and in-app chat.

**Business dashboard (desktop/web)** — onboarding, analytics dashboard, calendar, client directory, earnings, services, featured spots and settings.

## Tech stack

| Concern | Choice |
|---|---|
| Framework | Flutter (Dart SDK ^3.13.0) |
| Routing | `go_router` |
| State management | `flutter_riverpod` |
| Icons | `flutter_svg` with extracted SVG assets (no Material icon approximations) |
| Typography | Manrope 500/600/700/800, bundled locally |
| Formatting | `intl` |

## Project structure

```
lib/
  app/            # MaterialApp entry, router, route constants
  design/         # Design system: tokens, theme, icons, shared Ax* widgets
    tokens/       # AxColors, AxType, AxRadius, AxSpace, AxGradients
    widgets/      # AxButton, AxCard, AxField, AxDataTable, ...
  features/       # Feature-first screen code (presentation + data fixtures)
  dev/            # Debug-only component gallery
docs/             # Design implementation docs and per-screen specs
tool/design/      # Node scripts: extract artboards, icons, specs
.design-src/      # Frozen artboard source (read-only, source of truth)
assets/           # Bundled fonts and SVG icons
```

Full conventions: [`docs/02-ARCHITECTURE.md`](docs/02-ARCHITECTURE.md).

## Getting started

Prerequisites: [Flutter SDK](https://docs.flutter.dev/get-started/install) and, for the design pipeline scripts, Node.js.

```bash
flutter pub get
flutter run                # runs on the connected device/emulator
```

Useful targets:

```bash
flutter run -d chrome       # web
flutter run -d windows      # desktop
```

The app boots to `/onboarding`. The debug component gallery lives at `/dev/gallery` (debug builds only).

## Design system

- **No raw literals** — screens use `AxColors`, `AxType`, `AxRadius`, `AxSpace` tokens only; a token-lint test enforces this.
- **No shadows/elevation** — the design is flat; the global theme sets `elevation: 0`.
- **Bundled Manrope** — no network fonts, so golden tests stay deterministic.
- **SVG assets** — 60 icons extracted from the artboards (see [`docs/05-ICON-CATALOG.md`](docs/05-ICON-CATALOG.md)).

Token reference: [`docs/01-DESIGN-TOKENS.md`](docs/01-DESIGN-TOKENS.md) · Component inventory: [`docs/04-COMPONENT-INVENTORY.md`](docs/04-COMPONENT-INVENTORY.md)

## Testing

```bash
flutter test                          # unit, widget and golden tests
flutter test --update-goldens         # re-capture goldens (review the diff!)
flutter analyze --fatal-infos         # strict static analysis
```

A screen is considered done when its golden matches the artboard at the reference width, it has zero overflow at 320px and `textScaler` 1.3× (client) / 900px (business), and its manual checklist passes — see [`docs/06-VERIFICATION.md`](docs/06-VERIFICATION.md).

## Design pipeline

The design source is treated as code. From the canvas artifact:

```bash
node tool/design/extract.mjs    # artifact HTML -> .design-src/
node tool/design/icons.mjs      # .design-src/ -> assets/icons/ + ax_icons.dart
node tool/design/specgen.mjs     # .design-src/ -> docs/specs/** (generated sections)
```

`.design-src/` is frozen — never edited; if it looks wrong, raise it rather than work around it.

## Documentation

| Doc | Contents |
|---|---|
| [`BUILD_PLAN.md`](BUILD_PLAN.md) | Build order and the ground rules for implementation |
| [`docs/00-STRATEGY.md`](docs/00-STRATEGY.md) | Why the design is portable; phase plan |
| [`docs/03-RESPONSIVE-RULES.md`](docs/03-RESPONSIVE-RULES.md) | The CSS → Flutter translation rulebook |
| [`docs/specs/`](docs/specs/) | One spec per screen — the per-screen source of truth |
| [`docs/PROGRESS.md`](docs/PROGRESS.md) | Live build tracker |

## Status

Phase 0 (foundation: tokens, theme, routing, test harness) is complete. The component library and screens are under construction — current state is tracked in [`docs/PROGRESS.md`](docs/PROGRESS.md).

Out of scope for now: backend integration, i18n and dark mode (see [`docs/00-STRATEGY.md`](docs/00-STRATEGY.md)).

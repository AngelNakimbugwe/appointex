# 02 — Architecture

## Two apps, one codebase

The artboards describe two products with different form factors, navigation
models and users:

- **Client app** — mobile, 390×844, bottom tab bar, 12 screens
- **Business dashboard** — desktop/web, 1160×760, persistent left sidebar, 8 screens

They share the palette, the type scale, the icon set and the primitive widgets.
They share **no** layout chrome. Keep them as sibling feature trees under one
`lib/`, over a common `design/` and `core/`.

## Folder layout

```
lib/
  main.dart                     # runApp only
  app/
    app.dart                    # MaterialApp.router, theme wiring
    router.dart                 # all 21 routes, go_router
    routes.dart                 # route name + path constants
  design/
    theme.dart                  # ThemeData built from tokens
    tokens/
      ax_colors.dart
      ax_gradients.dart
      ax_type.dart
      ax_radius.dart
      ax_space.dart
    icons/
      ax_icons.dart             # generated: name -> asset path
      ax_icon.dart              # the AxIcon widget
    widgets/                    # shared primitives (see 04)
      ax_card.dart
      ax_chip.dart
      ax_badge.dart
      ax_primary_button.dart
      ax_field.dart
      ax_avatar.dart
      ax_section_header.dart
      ax_toggle.dart
      ax_data_table.dart
  core/
    models/                     # Provider, Service, Booking, Category, ...
    formatters.dart             # UGX money, dates, durations
  features/
    client/
      shell/                    # ClientShell: bottom nav scaffold
      onboarding/ register/ home/ urgent/ search/ provider/
      book/ event_bundle/ checkout/ confirmation/ my_bookings/ chat/
    business/
      shell/                    # BizShell: sidebar scaffold
      onboarding/ dashboard/ calendar/ clients/ earnings/
      services/ featured_spots/ settings/
  dev/
    gallery.dart                # component gallery route, debug builds only
```

Inside each feature:

```
features/client/home/
  presentation/home_screen.dart
  presentation/widgets/          # widgets used ONLY by this screen
  data/fixtures.dart             # the exact copy from the artboard
```

**Promotion rule:** a widget starts inside the feature that needs it. The moment
a second screen needs it, it moves to `design/widgets/` and gets a golden test.
Do not pre-emptively build shared widgets that only one screen uses.

## Navigation

`go_router`, with two `StatefulShellRoute.indexedStack` branches so each tab and
each sidebar section keeps its own navigation stack.

### Client routes

| Path | Screen | In shell |
|---|---|---|
| `/onboarding` | Client_Onboarding | no |
| `/register` | Client_Register | no |
| `/home` | Client_Home | yes, tab 0 |
| `/home/urgent` | Client_Urgent | yes |
| `/search` | Client_Search | yes |
| `/provider/:id` | Client_Provider | yes |
| `/provider/:id/book` | Client_Book | yes |
| `/event` | Client_EventBundle | yes |
| `/checkout` | Client_Checkout | no, full-screen |
| `/confirmation` | Client_Confirmation | no, full-screen |
| `/bookings` | Client_MyBookings | yes, tab 1 |
| `/chat` and `/chat/:threadId` | Client_Chat | yes, tab 2 |

Bottom nav has four tabs — **Home, Bookings, Chat, Profile**. Note that the
artboards define no Profile screen. Wire the tab and route it to a placeholder;
flag it as a gap (see [PROGRESS.md](PROGRESS.md)).

### Business routes

`/biz/onboarding` sits outside the shell. The other seven live inside `BizShell`
and match the sidebar order exactly: `dashboard`, `calendar`, `clients`,
`earnings`, `services`, `featured`, `settings`.

The sidebar in the artboards lists exactly seven items in that order, with the
active row on `#FFB5A7` and inactive labels/icons on `#C9A79D`. That ordering is
part of the design — do not reorder it.

## State management

`flutter_riverpod`, but deliberately thin. There is no backend in scope, so:

- Every screen reads a provider that returns a fixture object.
- Fixtures live in `features/<f>/data/fixtures.dart` and hold **the exact strings
  from the artboard** — "Grace Nabbosa Braids", "4.9 · from UGX 25,000",
  "Where to today?". This matters: it keeps goldens honest and means the copy
  review happens once, against the design, rather than being invented later.
- Widgets take their data as constructor arguments and never reach for a provider
  themselves. That keeps every widget golden-testable with no container.

Swapping fixtures for a real repository later changes only the provider bodies.

## Naming conventions

- Shared design widgets: `Ax` prefix (`AxCard`, `AxChip`, `AxIcon`).
- Screens: `<Name>Screen` in `<name>_screen.dart`.
- Screen-private widgets: `_LeadingUnderscore` when in the same file, otherwise
  a plain name in `presentation/widgets/`.
- Fixture instances: `k` prefix (`kFeaturedProviders`, `kHomeCategories`).

## Dependencies to add

| Package | Why |
|---|---|
| `flutter_svg` | Renders the 60 extracted icon assets. Non-negotiable given the icon decision. |
| `go_router` | Declarative routing with the two shell branches. |
| `flutter_riverpod` | Thin state layer described above. |
| `intl` | UGX and date formatting (`Fri, 14 Mar`, `UGX 25,000`). |

Fonts are **bundled**, not fetched — so no `google_fonts` dependency. Declare the
four Manrope weights in `pubspec.yaml` under `flutter: fonts:`.

Dev-only: `golden_toolkit` (or plain `flutter_test` goldens) — see
[06-VERIFICATION.md](06-VERIFICATION.md).

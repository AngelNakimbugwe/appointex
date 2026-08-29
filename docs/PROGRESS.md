# Progress

Tick a screen only when every box in its spec's **Acceptance criteria** is
green. See [06-VERIFICATION.md](06-VERIFICATION.md) for what each check means.

## Phase 0 — Foundation

- [x] Design source extracted to `.design-src/` (21 artboards)
- [x] Icons extracted — 182 instances → 60 assets (52 ui, 2 duo, 6 art)
- [x] `lib/design/icons/ax_icons.dart` generated
- [x] Screen specs generated for all 21 artboards
- [x] `pubspec.yaml` — add `flutter_svg`, `go_router`, `flutter_riverpod`, `intl`
- [x] `pubspec.yaml` — declare `assets/icons/` and the four Manrope weights
- [x] Manrope 500/600/700/800 `.ttf` bundled under `assets/fonts/`
- [x] `lib/design/tokens/` — colours, gradients, type, radius, space
- [x] `lib/design/theme.dart` — `elevation: 0`, transparent shadows
- [x] `lib/design/icons/ax_icon.dart` — `AxIcon`, `AxDuoIcon`, `AxArt`
- [x] `lib/app/router.dart` — 21 routes to placeholders
- [x] `lib/main.dart` — replace the stock counter app
- [x] Golden test harness + `flutter_test_config.dart` font loading
- [x] Token lint test

## Phase 1 — Shared components

- [ ] `AxIcon` / `AxDuoIcon` / `AxArt`
- [ ] `AxMobileHeader`
- [ ] `AxBottomNav`
- [ ] `AxSidebar` + `BizShell`
- [ ] `AxAvatar`
- [ ] `AxVerifiedBadge`
- [ ] `AxRating`
- [ ] `AxProviderRow`
- [ ] `AxCard`
- [ ] `AxChip`
- [ ] `AxField`
- [ ] `AxPrimaryButton`
- [ ] `AxStatTile`
- [ ] `AxDataTable`
- [ ] `AxToggle`
- [ ] `AxPill`
- [ ] Component gallery route

## Phase 2 — Client app · 390×844

| # | Screen | Spec | Built | Golden | Responsive | Signed off |
|---|---|---|---|---|---|---|
| 1 | Onboarding | [spec](specs/client/01-onboarding.md) | ☐ | ☐ | ☐ | ☐ |
| 2 | Register | [spec](specs/client/02-register.md) | ☐ | ☐ | ☐ | ☐ |
| 3 | Home | [spec](specs/client/03-home.md) | ☐ | ☐ | ☐ | ☐ |
| 4 | Urgent booking | [spec](specs/client/04-urgent.md) | ☐ | ☐ | ☐ | ☐ |
| 5 | Search results | [spec](specs/client/05-search.md) | ☐ | ☐ | ☐ | ☐ |
| 6 | Provider profile | [spec](specs/client/06-provider.md) | ☐ | ☐ | ☐ | ☐ |
| 7 | Book service | [spec](specs/client/07-book.md) | ☐ | ☐ | ☐ | ☐ |
| 8 | Plan an event | [spec](specs/client/08-event-bundle.md) | ☐ | ☐ | ☐ | ☐ |
| 9 | Checkout | [spec](specs/client/09-checkout.md) | ☐ | ☐ | ☐ | ☐ |
| 10 | Confirmation | [spec](specs/client/10-confirmation.md) | ☐ | ☐ | ☐ | ☐ |
| 11 | My bookings | [spec](specs/client/11-my-bookings.md) | ☐ | ☐ | ☐ | ☐ |
| 12 | Chat | [spec](specs/client/12-chat.md) | ☐ | ☐ | ☐ | ☐ |

## Phase 3 — Business dashboard · 1160×760

| # | Screen | Spec | Built | Golden | Responsive | Signed off |
|---|---|---|---|---|---|---|
| 1 | Onboarding & verification | [spec](specs/business/01-onboarding.md) | ☐ | ☐ | ☐ | ☐ |
| 2 | Dashboard home | [spec](specs/business/02-dashboard.md) | ☐ | ☐ | ☐ | ☐ |
| 3 | Calendar | [spec](specs/business/03-calendar.md) | ☐ | ☐ | ☐ | ☐ |
| 4 | Clients | [spec](specs/business/04-clients.md) | ☐ | ☐ | ☐ | ☐ |
| 5 | Earnings & payouts | [spec](specs/business/05-earnings.md) | ☐ | ☐ | ☐ | ☐ |
| 6 | Services & pricing | [spec](specs/business/06-services.md) | ☐ | ☐ | ☐ | ☐ |
| 7 | Featured Spots | [spec](specs/business/07-featured-spots.md) | ☐ | ☐ | ☐ | ☐ |
| 8 | Settings | [spec](specs/business/08-settings.md) | ☐ | ☐ | ☐ | ☐ |

## Phase 4 — Motion, states, polish

- [ ] Press / hover states on every tappable surface
- [ ] Loading skeletons
- [ ] Empty states
- [ ] Error states
- [ ] Page transitions
- [ ] Keyboard handling on Register, Chat, Biz Onboarding

---

## Known gaps in the design

Things the app needs that no artboard specifies. Each needs a decision before
the screen that depends on it is called done.

| Gap | Blocks | Status |
|---|---|---|
| **Profile screen** — bottom nav has a Profile tab, but no artboard exists for it | Client bottom nav | ☐ undecided |
| **Filled-input state** — every artboard shows empty fields with `#9A9A9A` placeholder text only | Register, Biz Onboarding | ☐ undecided |
| **Dark mode** — one light palette only; a dark theme means inventing 58 colours | Whole app | ☐ out of scope (00-STRATEGY) |
| **Chat thread list** — Client_Chat shows one open conversation, no inbox list | Chat tab root | ☐ undecided |
| **Error / empty / loading** — static frames show the happy path only | Every screen | ☐ per-screen, Phase 4 |
| **Business screens below 900 px** | Biz responsive | ☐ decided: show "use a larger screen" |

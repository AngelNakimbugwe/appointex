# Progress

Tick a screen only when every box in its spec's **Acceptance criteria** is
green. See [06-VERIFICATION.md](06-VERIFICATION.md) for what each check means.

> **Build status (this pass):** Phases 0–3 complete. 210/210 tests pass,
> `flutter analyze --fatal-infos` clean. Every golden was verified
> programmatically (geometry probes + pixel sampling against artboard
> literals); the human **Layer-2 eyeball pass has not been done** — run
> `dart run tool/design/compare.dart <Screen>` and review each side-by-side
> page before signing off the "Signed off" column below.

## Phase 0 — Foundation

- [x] Design source extracted to `.design-src/` (21 artboards)
- [x] Icons extracted — 182 instances → 60 assets (52 ui, 2 duo, 6 art)
- [x] `lib/design/icons/ax_icons.dart` generated
- [x] Screen specs generated for all 21 artboards
- [x] `pubspec.yaml` — add `flutter_svg`, `go_router`, `flutter_riverpod`, `intl`
- [x] `pubspec.yaml` — declare `assets/icons/` and the four Manrope weights
  (fixed: Flutter directory assets are non-recursive — `ui/`, `duo/`, `art/`
  subdirectories declared explicitly)
- [x] Manrope 500/600/700/800 `.ttf` bundled under `assets/fonts/`
- [x] `lib/design/tokens/` — colours, gradients, type, radius, space
- [x] `lib/design/theme.dart` — `elevation: 0`, transparent shadows
- [x] `lib/design/icons/ax_icon.dart` — `AxIcon`, `AxDuoIcon`, `AxArt`
- [x] `lib/app/router.dart` — 21 routes (now wired to the real screens)
- [x] `lib/main.dart` — replace the stock counter app
- [x] Golden test harness + `flutter_test_config.dart` font loading
- [x] Token lint test

## Phase 1 — Shared components

- [x] `AxIcon` / `AxDuoIcon` / `AxArt`
- [x] `AxMobileHeader`
- [x] `AxBottomNav`
- [x] `AxSidebar` + `BizShell` (sidebar brand block fixed with `Expanded`)
- [x] `AxAvatar`
- [x] `AxVerifiedBadge`
- [x] `AxRating`
- [x] `AxProviderRow`
- [x] `AxCard`
- [x] `AxChip`
- [x] `AxField`
- [x] `AxPrimaryButton`
- [x] `AxStatTile` (incl. `AxStatTile.dark` for Biz_Earnings + `valueSize`)
- [x] `AxDataTable`
- [x] `AxToggle`
- [x] `AxPill`
- [x] `AxTierCard` / `AxPlanCard`
- [x] Component gallery route

## Phase 2 — Client app · 390×844

| # | Screen | Spec | Built | Golden | Responsive | Signed off |
|---|---|---|---|---|---|---|
| 1 | Onboarding | [spec](specs/client/01-onboarding.md) | ✅ | ✅ | ✅ | ☐ |
| 2 | Register | [spec](specs/client/02-register.md) | ✅ | ✅ | ✅ | ☐ |
| 3 | Home | [spec](specs/client/03-home.md) | ✅ | ✅ | ✅ | ☐ |
| 4 | Urgent booking | [spec](specs/client/04-urgent.md) | ✅ | ✅ | ✅ | ☐ |
| 5 | Search results | [spec](specs/client/05-search.md) | ✅ | ✅ | ✅ | ☐ |
| 6 | Provider profile | [spec](specs/client/06-provider.md) | ✅ | ✅ | ✅ | ☐ |
| 7 | Book service | [spec](specs/client/07-book.md) | ✅ | ✅ | ✅ | ☐ |
| 8 | Plan an event | [spec](specs/client/08-event-bundle.md) | ✅ | ✅ | ✅ | ☐ |
| 9 | Checkout | [spec](specs/client/09-checkout.md) | ✅ | ✅ | ✅ | ☐ |
| 10 | Confirmation | [spec](specs/client/10-confirmation.md) | ✅ | ✅ | ✅ | ☐ |
| 11 | My bookings | [spec](specs/client/11-my-bookings.md) | ✅ | ✅ | ✅ | ☐ |
| 12 | Chat (thread + minimal inbox) | [spec](specs/client/12-chat.md) | ✅ | ✅ | ✅ | ☐ |

## Phase 3 — Business dashboard · 1160×760

| # | Screen | Spec | Built | Golden | Responsive | Signed off |
|---|---|---|---|---|---|---|
| 1 | Onboarding & verification | [spec](specs/business/01-onboarding.md) | ✅ | ✅ | ✅ | ☐ |
| 2 | Dashboard home | [spec](specs/business/02-dashboard.md) | ✅ | ✅ | ✅ | ☐ |
| 3 | Calendar | [spec](specs/business/03-calendar.md) | ✅ | ✅ | ✅ | ☐ |
| 4 | Clients | [spec](specs/business/04-clients.md) | ✅ | ✅ | ✅ | ☐ |
| 5 | Earnings & payouts | [spec](specs/business/05-earnings.md) | ✅ | ✅ | ✅ | ☐ |
| 6 | Services & pricing | [spec](specs/business/06-services.md) | ✅ | ✅ | ✅ | ☐ |
| 7 | Featured Spots | [spec](specs/business/07-featured-spots.md) | ✅ | ✅ | ✅ | ☐ |
| 8 | Settings | [spec](specs/business/08-settings.md) | ✅ | ✅ | ✅ | ☐ |

## Phase 4 — Motion, states, polish

- [x] Press / hover states on every tappable surface
- [x] Loading skeletons
- [x] Empty states
- [x] Error states
- [x] Page transitions
- [x] Keyboard handling on Register, Chat, Biz Onboarding

---

## Known gaps in the design

| Gap | Blocks | Status |
|---|---|---|
| **Profile screen** — bottom nav has a Profile tab, but no artboard exists for it | Client bottom nav | ✅ decided: placeholder route (`/profile`) |
| **Filled-input state** — every artboard shows empty fields with `#9A9A9A` placeholder text only | Register, Biz Onboarding | ✅ decided: entered text is `textPrimary` `#3A3A3A`; implemented |
| **Dark mode** — one light palette only; a dark theme means inventing 58 colours | Whole app | ☐ out of scope (00-STRATEGY) |
| **Chat thread list** — Client_Chat shows one open conversation, no inbox list | Chat tab root | ✅ decided: minimal inbox built from existing tokens (no golden — not pixel-sourced) |
| **Error / empty / loading** — static frames show the happy path only | Every screen | ☐ per-screen, Phase 4 |
| **Business screens below 900 px** | Biz responsive | ✅ decided: "use a larger screen" panel in BizShell |

## Implementation notes (this pass)

- **Guest browsing + Google sign-in:** signed-out users can now browse all
  client routes (the router only bounces them to onboarding from `/biz/*`);
  the onboarding guest link actually works. "Continue with Google" was added
  to onboarding, and login gained a "continue browsing as a guest" link.
  Login and onboarding now create a Firestore profile on sign-in (no-op for
  returning users), so brand-new Google/OTP users are no longer stranded on
  the auth screen — the router's redirect owns the destination. Profile tab
  gained the client bottom nav (was a dead end).
- **Auth entry points:** added `/login` (phone OTP + Google, mirrors Register
  visuals, does **not** create a profile — returning business users keep their
  role and the router redirect lands them on the biz dashboard). Onboarding and
  Register both link to it ("Already have an account? **Log in**"); the guest
  link is preserved. Profile tab is now a real screen (identity card + Log out
  → onboarding).
- **Dead back buttons fixed:** drill-down screens (search, provider, book,
  checkout, event_bundle, urgent, chat) used bare `context.pop()` which throws
  on an empty stack since all forward nav is `context.go()`. Pattern now:
  `context.canPop() ? context.pop() : context.go(fallback)`.
- **Navigation model deviation:** 02-ARCHITECTURE suggests
  `StatefulShellRoute`; implemented as flat `GoRoute`s with each in-shell
  screen embedding `AxBottomNav` / composing `BizShell(current:, child:)`
  directly, so every screen pumps standalone in the golden harness per
  06-VERIFICATION's `harness(const XScreen())` pattern.
- **Token fixes:** `AxSpace.bizContentPadding` was transposed (CSS
  `26px 32px` = v26/h32) — corrected. Promoted recurring artboard literals to
  tokens: `AxColors.roseGlow`/`tagline`/`navyOverlay`, `AxType.body14`/`nano9`.
- **Widget params added:** `AxPrimaryButton(height:, labelSize:)`,
  `AxAvatar(artScale:)`, `AxStatTile.dark`, `AxRating` internally Flexible.
- **Recommended follow-ups** (noted in specs): extend `AxDataTable` with
  per-cell builders and row-gap/footnote support; promote the inner-page
  56 px header variant and the rich urgent/search row variants into
  `AxProviderRow`.
- **Golden harness caveat:** only Manrope is loaded in tests, so system-font
  text renders as test-font boxes in goldens. Subagents verified screens
  programmatically (geometry + pixel sampling); the human Layer-2 pass
  (`dart run tool/design/compare.dart <Screen>`) remains the sign-off gate.

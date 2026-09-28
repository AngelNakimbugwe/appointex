# Business · Settings

| | |
|---|---|
| **Artboard** | [`.design-src/Biz_Settings.dc.html`](../../../.design-src/Biz_Settings.dc.html) |
| **Reference size** | 1160 × 760 |
| **Route** | `/biz/settings` |
| **Widget** | `lib/features/business/settings/presentation/settings_screen.dart` |
| **Build order** | business #8 |
| **Icons on screen** | 13 |

> Everything above the HANDWRITTEN marker is generated from the artboard by
> `node tool/design/specgen.mjs`. Do not edit it — edit the artboard, or add
> your notes below the marker.

## Root container

```
width: 1160px
height: 760px
background: #FBFAF7
display: flex
overflow: hidden
```

Per [Rule 1](../../03-RESPONSIVE-RULES.md): drop `width`, `height` and
`overflow`; keep the background; wrap in `SafeArea`.

## Layout tree

```
div { display:flex; width:1160px; height:760px; background:#FBFAF7; overflow:hidden }
  div { display:flex; flex-direction:column; flex-shrink:0; width:220px; padding:22px 14px; background:#F8EDEB }
    div { display:flex; gap:9px; align-items:center; padding:0 8px 24px }
      div { display:flex; align-items:center; justify-content:center; width:28px; height:28px; background:linear-gradient(135deg,#6B3F3A,#A66A5D); border-radius:8px }
        <svg>
      div { display:flex; flex-direction:column }
        span.head { font-size:13px; font-weight:800; color:#6B3F3A }  "Appointex"
        span { font-size:9.5px; font-weight:700; color:#A66A5D; letter-spacing:0.05em }  "FOR BUSINESS"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Dashboard"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Calendar"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Clients"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Earnings"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Services"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Featured Spots"
    div.navrow { background:#FFB5A7 }
      <svg>
      span { font-size:13px; font-weight:700; color:#6B3F3A }  "Settings"
  div { display:flex; flex-direction:column; flex:1; gap:16px; padding:26px 32px; overflow:hidden }
    span.head { font-size:20px; font-weight:800; color:#6B3F3A }  "Settings"
    div { display:flex; flex:1; gap:18px; overflow:hidden }
      div { display:flex; flex-direction:column; flex:1; gap:16px; overflow:hidden }
        div.card
          span.head { font-size:14px; font-weight:700; color:#6B3F3A }  "Business profile"
          div { display:flex; gap:12px; align-items:center }
            div { display:flex; align-items:center; justify-content:center; width:44px; height:44px; background:linear-gradient(135deg,#F8EDEB,#FFB5A7); border-radius:12px }
              <svg>
            div { display:flex; flex-direction:column }
              span { font-size:13px; font-weight:700; color:#6B3F3A }  "Patricia Glam Studio"
              span { font-size:11.5px; color:#8A8A8A }  "Makeup · Kampala, Kansanga"
          div { display:flex; align-items:center; justify-content:space-between }
            span { font-size:11.5px; color:#7A7A7A }  "12 photos, 2 videos on your profile"
            span { font-size:12px; font-weight:700; color:#A66A5D }  "Manage portfolio"
        div.card
          span.head { font-size:14px; font-weight:700; color:#6B3F3A }  "Team"
          div { display:flex; gap:10px; align-items:center; padding:6px 0; border-bottom:1px solid #F1EEE6 }
            div { display:flex; align-items:center; justify-content:center; width:28px; height:28px; background:linear-gradient(135deg,#F8EDEB,#FCD5CE); border-radius:50% }
              <svg>
            span { flex:1; font-size:12.5px; font-weight:600; color:#6B3F3A }  "Gukiina Patricia"
            span { font-size:11px; color:#8A8A8A }  "Owner"
          div { display:flex; gap:10px; align-items:center; padding:6px 0 }
            div { display:flex; align-items:center; justify-content:center; width:28px; height:28px; background:linear-gradient(135deg,#F9DCC4,#FEC89A); border-radius:50% }
              <svg>
            span { flex:1; font-size:12.5px; font-weight:600; color:#6B3F3A }  "Sarah Nakato"
            span { font-size:11px; color:#8A8A8A }  "Assistant"
        div.card
          div { display:flex; align-items:center; justify-content:space-between }
            div { display:flex; gap:7px; align-items:center }
              <svg>
              span.head { font-size:14px; font-weight:700; color:#6B3F3A }  "Urgent bookings"
            div { display:flex; align-items:center; width:36px; height:20px; padding:2px; background:#6B3F3A; border-radius:10px }
              div { width:16px; height:16px; background:#FFFFFF; border-radius:50% }
          span { font-size:11.5px; color:#7A7A7A; line-height:1.5 }  "Show up when clients need someone today. Only slots you actually ha…"
          div { display:flex; gap:8px }
            div { flex:1; padding:8px 6px; background:#F7F5F1; border-radius:9px; text-align:center }
              span { display:block; font-size:10px; color:#8A8A8A }  "Today"
              span { font-size:12px; font-weight:800; color:#6B3F3A }  "+15%"
            div { flex:1; padding:8px 6px; background:#F7F5F1; border-radius:9px; text-align:center }
              span { display:block; font-size:10px; color:#8A8A8A }  "3 hrs"
              span { font-size:12px; font-weight:800; color:#6B3F3A }  "+25%"
            div { flex:1; padding:8px 6px; background:#F7F5F1; border-radius:9px; text-align:center }
              span { display:block; font-size:10px; color:#8A8A8A }  "ASAP"
              span { font-size:12px; font-weight:800; color:#6B3F3A }  "+40%"
          span { font-size:10.5px; color:#9A9A9A }  "Platform-set rates, shown to clients before they book. Appointex ta…"
        div.card
          div { display:flex; align-items:center; justify-content:space-between }
            div { display:flex; gap:7px; align-items:center }
              <svg>
              span.head { font-size:14px; font-weight:700; color:#6B3F3A }  "Mobile service"
            div { display:flex; align-items:center; width:36px; height:20px; padding:2px; background:#6B3F3A; border-radius:10px }
              div { width:16px; height:16px; background:#FFFFFF; border-radius:50% }
          span { font-size:11.5px; color:#7A7A7A; line-height:1.5 }  "Travel to a client's home or venue instead of your salon. They pay …"
          div { display:flex; align-items:center; justify-content:space-between; padding:8px 10px; background:#F7F5F1; border-radius:9px }
            span { font-size:11.5px; color:#5B5B5B }  "Client travel fee"
            span { font-size:12px; font-weight:800; color:#6B3F3A }  "+5%"
          span { font-size:10.5px; color:#9A9A9A }  "Platform-set rate, shown to clients before they book. Your standard…"
        div.card
          span.head { font-size:14px; font-weight:700; color:#6B3F3A }  "Payout account"
          div { display:flex; align-items:center; justify-content:space-between }
            span { font-size:12.5px; color:#5B5B5B }  "MTN Mobile Money, ending 4456"
            span { font-size:12px; font-weight:700; color:#A66A5D }  "Change"
      div { display:flex; flex-direction:column; flex:1; gap:16px; overflow:hidden }
        div.card
          span.head { font-size:14px; font-weight:700; color:#6B3F3A }  "Commission plan"
          div { display:flex; gap:10px }
            div.plan { background:#6B3F3A; border:1.5px solid #6B3F3A }
              span { font-size:11px; font-weight:700; color:#FEC89A }  "CURRENT PLAN"
              span.head { font-size:20px; font-weight:800; color:#FFFFFF }  "9%"
              span { font-size:11.5px; color:#D9BFB8 }  "Standard rate, no conditions"
            div.plan { background:#F7F5F1; border:1.5px dashed #D7D1C2 }
              span { font-size:11px; font-weight:700; color:#A66A5D }  "AVAILABLE"
              span.head { font-size:20px; font-weight:800; color:#6B3F3A }  "5%"
              span { font-size:11.5px; color:#7A7A7A }  "Reduced rate for providers who keep bookings and payments on Appointex"
          span { font-size:11px; color:#9A9A9A; line-height:1.5 }  "You qualify for the reduced rate once your last 20 bookings were al…"
        div.card { flex:1 }
          span.head { font-size:14px; font-weight:700; color:#6B3F3A }  "Notifications"
          div { display:flex; align-items:center; justify-content:space-between; padding:5px 0 }
            span { font-size:12.5px; color:#3A3A3A }  "New booking requests"
            div { display:flex; align-items:center; width:36px; height:20px; padding:2px; background:#6B3F3A; border-radius:10px }
              div { width:16px; height:16px; background:#FFFFFF; border-radius:50% }
          div { display:flex; align-items:center; justify-content:space-between; padding:5px 0 }
            span { font-size:12.5px; color:#3A3A3A }  "Payout confirmations"
            div { display:flex; align-items:center; width:36px; height:20px; padding:2px; background:#6B3F3A; border-radius:10px }
              div { width:16px; height:16px; background:#FFFFFF; border-radius:50% }
          div { display:flex; align-items:center; justify-content:space-between; padding:5px 0 }
            span { font-size:12.5px; color:#3A3A3A }  "Marketing tips"
            div { display:flex; align-items:center; width:36px; height:20px; padding:2px; background:#D7D1C2; border-radius:10px }
              div { width:16px; height:16px; background:#FFFFFF; border-radius:50% }
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/business/settings/data/fixtures.dart` verbatim.

- `Appointex`
- `FOR BUSINESS`
- `Dashboard`
- `Calendar`
- `Clients`
- `Earnings`
- `Services`
- `Featured Spots`
- `Settings`
- `Settings`
- `Business profile`
- `Patricia Glam Studio`
- `Makeup · Kampala, Kansanga`
- `12 photos, 2 videos on your profile`
- `Manage portfolio`
- `Team`
- `Gukiina Patricia`
- `Owner`
- `Sarah Nakato`
- `Assistant`
- `Urgent bookings`
- `Show up when clients need someone today. Only slots you actually have open are offered, based on your calendar.`
- `Today`
- `+15%`
- `3 hrs`
- `+25%`
- `ASAP`
- `+40%`
- `Platform-set rates, shown to clients before they book. Appointex takes a larger share of the rush portion only.`
- `Mobile service`
- `Travel to a client's home or venue instead of your salon. They pay a small travel fee on top of your service price — your rate stays the same.`
- `Client travel fee`
- `+5%`
- `Platform-set rate, shown to clients before they book. Your standard commission still applies to the service price only.`
- `Payout account`
- `MTN Mobile Money, ending 4456`
- `Change`
- `Commission plan`
- `CURRENT PLAN`
- `9%`
- `Standard rate, no conditions`
- `AVAILABLE`
- `5%`
- `Reduced rate for providers who keep bookings and payments on Appointex`
- `You qualify for the reduced rate once your last 20 bookings were all booked and paid in the app. Your progress: 14 of 20.`
- `Notifications`
- `New booking requests`
- `Payout confirmations`
- `Marketing tips`

## Tokens on this screen

**Colours** — #6B3F3A (27) · #FFFFFF (17) · #C9A79D (12) · #8A8A8A (6) · #A66A5D (5) · #F7F5F1 (5) · #C15B6B (4) · #7A7A7A (4) · #F8EDEB (3) · #FEC89A (3) · #FFB5A7 (3) · #9A9A9A (3) · #3A3A3A (3) · #5B5B5B (2) · #D7D1C2 (2) · #ECE7DC (1) · #FBFAF7 (1) · #F1EEE6 (1) · #FCD5CE (1) · #F9DCC4 (1) · #E8433D (1) · #3D8B85 (1) · #D9BFB8 (1)

**Font sizes** — 13px (9) · 14px (7) · 11.5px (7) · 12px (6) · 12.5px (6) · 11px (5) · 20px (3) · 10px (3) · 10.5px (2) · 9.5px (1)

**Radii** — 9px (5) · 10px (5) · 12px (2) · 14px (1) · 8px (1)

**Gradients**

- `linear-gradient(135deg,#6B3F3A,#A66A5D)`
- `linear-gradient(135deg,#F8EDEB,#FFB5A7)`
- `linear-gradient(135deg,#F8EDEB,#FCD5CE)`
- `linear-gradient(135deg,#F9DCC4,#FEC89A)`

## Artboard-local CSS classes

`.navrow`

```css
display:flex; align-items:center; gap:11px; padding:10px 16px; border-radius:9px;
```

`.card`

```css
background:#FFFFFF; border:1px solid #ECE7DC; border-radius:14px; padding:18px 20px; display:flex; flex-direction:column; gap:12px;
```

`.plan`

```css
flex:1; border-radius:12px; padding:14px 16px; display:flex; flex-direction:column; gap:6px;
```


<!-- HANDWRITTEN — everything below this line is preserved by specgen -->







## Purpose

The provider's account and configuration screen: business identity and
portfolio, team members, the two opt-in service modes (urgent bookings with
their platform-set rush rates, mobile service with its client travel fee),
the payout account, the commission plan (current 9% vs the 5% reduced rate
they qualify for once 20 consecutive in-app bookings), and notification
preferences.

## Components used

- `BizShell` — `Scaffold(body: BizShell(current: AxSidebarItem.settings, …))`
- `AxSidebarItem` routing via `context.go` to the `AxRoutes.biz*` paths
- `AxCard` — every panel, at the `.card` defaults (radius 14, padding
  `18 20`, inner column gap 12)
- `AxPlanCard` — both commission plans: the selected one (`#6B3F3A` +
  `1.5px solid`) and the dashed-border alternate (`#F7F5F1`,
  `1.5px dashed #D7D1C2`)
- `AxToggle` — all five switches (36×20). Note the real constructor
  signature is `value` / `onChanged`.
- `AxAvatar` — profile 44 px radius 12 (`avatarBlush`, `artMakeup` at 52%);
  team 28 px as circles (radius = size/2) with a `personFill` child at 55%
- `AxIcon` — `boltFill` 15 `#E8433D` (urgent) and `mapPin23` 15 `#3D8B85`
  (mobile service — the escrow/held-payment teal, `AxColors.escrow`)
- Screen-local: `_SettingsContent`, `_ProfileColumn`, `_CardTitle`,
  `_BusinessProfileCard`, `_TeamCard`, `_TeamRow`, `_UrgentBookingsCard`,
  `_RateTile`, `_MobileServiceCard`, `_PayoutAccountCard`, `_PlansColumn`,
  `_CommissionPlanCard`, `_NotificationsCard`, `_ToggleRow`,
  `_ToggleCardHeader`
- Import note: `AxArt` exists both as a widget (`design/icons/ax_icon.dart`)
  and as the generated asset-constant class (`design/icons/ax_icons.dart`).
  The screen imports the former with `hide AxArt` so `AxArt.artMakeup`
  resolves to the asset path.

## Data model

```dart
// lib/features/business/settings/data/fixtures.dart
class TeamMember { final String name, role; final Gradient gradient; }
const List<TeamMember> kTeam;            // 2 rows: Owner, Assistant
class RushRate { final String label, value; }
const List<RushRate> kUrgentRates;      // Today +15% / 3 hrs +25% / ASAP +40%
const String kPageTitle, kBusinessProfileTitle, kBusinessName,
    kBusinessLocation, kPortfolioSummary, kManagePortfolio;
const String kTeamTitle, kUrgentTitle, kUrgentDescription, kUrgentFootnote;
const String kMobileTitle, kMobileDescription, kTravelFeeLabel,
    kTravelFeeValue, kMobileFootnote;
const String kPayoutTitle, kPayoutAccount, kPayoutChange;
const String kCommissionTitle, kCurrentPlanEyebrow, kCurrentPlanValue,
    kCurrentPlanDescription, kAvailablePlanEyebrow, kAvailablePlanValue,
    kAvailablePlanDescription, kCommissionFootnote;
const String kNotificationsTitle, kNotifyBookings, kNotifyPayouts,
    kNotifyMarketing;
const bool kUrgentEnabled, kMobileEnabled, kBookingRequestsEnabled,
    kPayoutConfirmationsEnabled, kMarketingTipsEnabled;  // on/on/on/on/off
```

## Interactions & states

Each toggle-holding card is its own `StatefulWidget` and owns its switch
state; initial values come from the fixtures, as drawn.

| Element | Interaction | Result |
|---|---|---|
| Sidebar rows | tap | `context.go` to the matching `/biz/*` route |
| Urgent / Mobile / ×3 notification toggles | tap | flips that card's state (`setState` local to the card) |
| "Manage portfolio", "Change", plan cards | tap | inert — no artboard target |

**States not in the artboard**

- Loading: Phase 4.
- Empty: n/a (all sections have content).
- Error: out of scope.
- Pressed / hover: none.
- Disabled: n/a.

## Responsive notes

- Scroll region: `BizShell`'s content pane (Rule 3). The notifications card
  is an `Expanded` (artboard `.card` with `flex:1`) so the right column fills
  the pane; taller content scrolls.
- Kept fixed: 44/28 px avatars, 36×20 toggles, 15 px card-header icons,
  `8 6` rate-tile padding, 9 px tile radius.
- Made flexible: the two columns at flex 1:1, gap 18; plan cards stretch to
  equal height (CSS flex `align-items: stretch` → `IntrinsicHeight` +
  `CrossAxisAlignment.stretch`); rate tiles share the row equally.
- Behaviour at 900 px: sidebar stays, both columns compress; plan
  descriptions and footnotes wrap taller and the pane scrolls.

## Open questions

- [ ] "Manage portfolio", "Change", team management and switching to the 5%
  plan have no artboard targets — left inert.
- [ ] Toggle state persistence is out of scope — values reset to the
  artboard's on/on/on/on/off on rebuild.
- [ ] The team avatar person glyph is `#FFFFFF` at `opacity:0.92` (artboard
  line 82) — rendered as `AxColors.surface.withValues(alpha: 0.92)`.
- [ ] `AxPlanCard`'s dash pattern (4 on / 4 off) is the shared widget's
  approximation of `1.5px dashed #D7D1C2`.

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes
- [x] No literal colours or font sizes outside `design/tokens/`
- [ ] Layer-2 side-by-side reviewed and signed off

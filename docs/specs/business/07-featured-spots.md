# Business · Featured Spots

| | |
|---|---|
| **Artboard** | [`.design-src/Biz_FeaturedSpots.dc.html`](../../../.design-src/Biz_FeaturedSpots.dc.html) |
| **Reference size** | 1160 × 760 |
| **Route** | `/biz/featured` |
| **Widget** | `lib/features/business/featured_spots/presentation/featured_spots_screen.dart` |
| **Build order** | business #7 |
| **Icons on screen** | 12 |

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
    div.navrow { background:#FFB5A7 }
      <svg>
      span { font-size:13px; font-weight:700; color:#6B3F3A }  "Featured Spots"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Settings"
  div { display:flex; flex-direction:column; flex:1; gap:16px; padding:26px 32px; overflow:hidden }
    div { display:flex; flex-direction:column; gap:3px }
      span.head { font-size:20px; font-weight:800; color:#6B3F3A }  "Featured Spots"
      span { font-size:12.5px; color:#8A8A8A }  "Pay to be one of the top 3 shown first when clients browse your cat…"
    div { display:flex; flex:1; gap:20px; overflow:hidden }
      div { display:flex; flex-direction:column; flex:1.3; gap:16px }
        div { display:flex; flex-direction:column; gap:10px; padding:16px 18px; background:#FFFFFF; border:1px solid #ECE7DC; border-radius:14px }
          div { display:flex; align-items:center; justify-content:space-between }
            span.head { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Currently featured in Makeup"
            span { padding:3px 9px; background:#FBF3E7; border-radius:8px; font-size:11px; font-weight:700; color:#9A6B1E }  "3 of 3 spots taken"
          div.row
            div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:22px; height:22px; background:#FFB5A7; border-radius:50% }
              span.head { font-size:11px; font-weight:800; color:#6B3F3A }  "1"
            div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:30px; height:30px; background:linear-gradient(135deg,#F8EDEB,#FFB5A7); border-radius:8px }
              <svg>
            span { flex:1; font-size:12.5px; font-weight:600; color:#6B3F3A }  "Faces by Immaculate"
            span { font-size:11px; color:#9A9A9A }  "5 days left"
          div.row
            div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:22px; height:22px; background:#C9A79D; border-radius:50% }
              span.head { font-size:11px; font-weight:800; color:#6B3F3A }  "2"
            div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:30px; height:30px; background:linear-gradient(135deg,#F8EDEB,#FCD5CE); border-radius:8px }
              <svg>
            span { flex:1; font-size:12.5px; font-weight:600; color:#6B3F3A }  "Glow by Sandra"
            span { font-size:11px; color:#9A9A9A }  "2 days left"
          div.row { border-bottom:none }
            div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:22px; height:22px; background:#F0EEE9; border-radius:50% }
              span.head { font-size:11px; font-weight:800; color:#6B3F3A }  "3"
            div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:30px; height:30px; background:linear-gradient(135deg,#F9DCC4,#FEC89A); border-radius:8px }
              <svg>
            span { flex:1; font-size:12.5px; font-weight:600; color:#6B3F3A }  "Patricia Glam Studio (you)"
            span { font-size:11px; font-weight:700; color:#2E8B57 }  "6 days left"
        div { display:flex; gap:14px; align-items:center; padding:16px 18px; background:#6B3F3A; border-radius:14px }
          <svg>
          div { display:flex; flex-direction:column; flex:1; gap:2px }
            span { font-size:13px; font-weight:700; color:#FFFFFF }  "You're featured this week"
            span { font-size:11.5px; color:#D9BFB8 }  "Renews automatically unless you turn it off in Settings."
      div { display:flex; flex-direction:column; flex:1; gap:9px; overflow:hidden }
        span.head { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Advertise on Appointex"
        span { font-size:10.5px; font-weight:700; color:#9A9A9A; letter-spacing:0.03em; text-transform:uppercase }  "Category placement · Makeup"
        div.tier { gap:5px; padding:12px 16px }
          span { font-size:10.5px; font-weight:700; color:#9A9A9A; letter-spacing:0.04em; text-transform:uppercase }  "1 week"
          span.head { font-size:17px; font-weight:800; color:#6B3F3A }  "UGX 30,000"
          div { display:flex; align-items:center; justify-content:center; height:32px; border:1.5px solid #6B3F3A; border-radius:16px }
            span { font-size:11.5px; font-weight:700; color:#6B3F3A }  "Choose"
        div.tier { gap:5px; padding:12px 16px; background:#F9DCC4 }
          span { font-size:10.5px; font-weight:700; color:#A66A5D; letter-spacing:0.04em; text-transform:uppercase }  "1 month · save 17%"
          span.head { font-size:17px; font-weight:800; color:#6B3F3A }  "UGX 100,000"
          div { display:flex; align-items:center; justify-content:center; height:32px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); border-radius:16px }
            span { font-size:11.5px; font-weight:700; color:#6B3F3A }  "Choose"
        span { font-size:10.5px; font-weight:700; color:#9A9A9A; letter-spacing:0.03em; text-transform:uppercase }  "Home banner ad"
        div { display:flex; flex-direction:column; gap:5px; padding:12px 16px; border:1px solid #ECE7DC; border-radius:14px }
          div { display:flex; align-items:center; justify-content:space-between }
            span.head { font-size:12.5px; font-weight:700; color:#6B3F3A }  "Rotating carousel slot"
            span { font-size:11px; font-weight:700; color:#6B3F3A }  "UGX 50,000/wk"
          span { font-size:10.5px; color:#7A7A7A; line-height:1.4 }  "Shown in the carousel on every client's Home screen, across all cat…"
          div { display:flex; align-items:center; justify-content:center; height:32px; border:1.5px solid #6B3F3A; border-radius:16px }
            span { font-size:11.5px; font-weight:700; color:#6B3F3A }  "Get a slot"
        span { font-size:10px; color:#9A9A9A; line-height:1.5 }  "Both are clearly marked to clients as paid, separate from review sc…"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/business/featured_spots/data/fixtures.dart` verbatim.

- `Appointex`
- `FOR BUSINESS`
- `Dashboard`
- `Calendar`
- `Clients`
- `Earnings`
- `Services`
- `Featured Spots`
- `Settings`
- `Featured Spots`
- `Pay to be one of the top 3 shown first when clients browse your category. Only 3 spots per category, one week at a time.`
- `Currently featured in Makeup`
- `3 of 3 spots taken`
- `1`
- `Faces by Immaculate`
- `5 days left`
- `2`
- `Glow by Sandra`
- `2 days left`
- `3`
- `Patricia Glam Studio (you)`
- `6 days left`
- `You're featured this week`
- `Renews automatically unless you turn it off in Settings.`
- `Advertise on Appointex`
- `Category placement · Makeup`
- `1 week`
- `UGX 30,000`
- `Choose`
- `1 month · save 17%`
- `UGX 100,000`
- `Choose`
- `Home banner ad`
- `Rotating carousel slot`
- `UGX 50,000/wk`
- `Shown in the carousel on every client's Home screen, across all categories.`
- `Get a slot`
- `Both are clearly marked to clients as paid, separate from review score and ranking.`

## Tokens on this screen

**Colours** — #6B3F3A (26) · #C9A79D (13) · #FFFFFF (8) · #FFB5A7 (8) · #C15B6B (6) · #9A9A9A (6) · #FEC89A (5) · #ECE7DC (3) · #F8EDEB (3) · #A66A5D (3) · #5A3A33 (2) · #F9DCC4 (2) · #F1EEE6 (1) · #FBFAF7 (1) · #8A8A8A (1) · #9A6B1E (1) · #FBF3E7 (1) · #D98B96 (1) · #C97A5D (1) · #9C6B7A (1) · #FCD5CE (1) · #F0EEE9 (1) · #2E8B57 (1) · #D9BFB8 (1) · #7A7A7A (1)

**Font sizes** — 13px (9) · 11px (8) · 12.5px (5) · 10.5px (5) · 11.5px (4) · 13.5px (2) · 17px (2) · 9.5px (1) · 20px (1) · 10px (1)

**Radii** — 8px (5) · 14px (4) · 16px (3) · 9px (1)

**Gradients**

- `linear-gradient(135deg,#6B3F3A,#A66A5D)`
- `linear-gradient(135deg,#F8EDEB,#FFB5A7)`
- `linear-gradient(135deg,#F8EDEB,#FCD5CE)`
- `linear-gradient(135deg,#F9DCC4,#FEC89A)`
- `linear-gradient(135deg,#FEC89A,#FFB5A7)`

## Artboard-local CSS classes

`.navrow`

```css
display:flex; align-items:center; gap:11px; padding:10px 16px; border-radius:9px;
```

`.tier`

```css
flex:1; border:1px solid #ECE7DC; border-radius:14px; padding:16px 18px; display:flex; flex-direction:column; gap:8px;
```

`.row`

```css
display:flex; align-items:center; gap:12px; padding:10px 0; border-bottom:1px solid #F1EEE6;
```


<!-- HANDWRITTEN — everything below this line is preserved by specgen -->







## Purpose

The provider's advertising screen. It shows who currently holds the top-3
featured spots in their category (the provider themselves holds #3, with 6
days left, auto-renewing), then lets them buy into that placement — a 1-week
or 1-month category slot (the month is highlighted as the better deal) — or a
rotating Home-banner carousel slot. Both products carry the paid-placement
disclosure so providers know clients see them marked as ads.

## Components used

- `BizShell` — `Scaffold(body: BizShell(current: AxSidebarItem.featured, …))`
- `AxSidebarItem` routing via `context.go` to the `AxRoutes.biz*` paths
- `AxAvatar` — the three rank rows: 30 px, radius 8, `artScale` 0.52,
  gradients `avatarBlush` / `avatarPale` / `avatarSand` (artboard lines
  74/80/86), art `artNails` / `artSpa` / `artMakeup`
- `AxPrimaryButton` — the three compact CTAs (height 32, label 11.5): two
  `outline` (week tier, carousel) and one `gradient` (month tier); radius 16
  on 32 is a stadium, which `StadiumBorder` gives exactly
- `AxIcon` — `starOutline` 22 `#FEC89A` in the renewal banner
- Screen-local: `_PageHeader`, `_CurrentSpotsCard`, `_SpotsTakenPill`,
  `_FeaturedRow`, `_FeaturedBanner`, `_AdvertiseColumn`, `_Eyebrow`,
  `_TierCard`, `_CarouselCard`
- `AxTierCard` is *not* used directly: both `.tier` instances override the
  class defaults to `padding:12px 16px; gap:5px` (artboard lines 105/110),
  which the shared widget hard-codes at `16 18` / gap 8 and cannot take as
  parameters. `_TierCard` mirrors `AxTierCard`'s styles otherwise (radius 14,
  10.5/700 `0.04em` eyebrow — `#A66A5D` when selected, 17/800 price, salmon
  border + `#F9DCC4` background when selected).
- `AxDataTable` is *not* used — the "Currently featured" list has no `.th`
  header row; the rows are custom (`10px 0` padding, `#F1EEE6` separators,
  none on the last row), matching `.row`.

## Data model

```dart
// lib/features/business/featured_spots/data/fixtures.dart
class FeaturedSpot {
  final String rank, name, daysLeft;
  final Color rankColor;          // #FFB5A7 / #C9A79D / #F0EEE9 by rank
  final Gradient gradient;        // avatar gradient, artboard lines 74/80/86
  final String art;               // AxArt.artNails / artSpa / artMakeup
  final bool daysLeftHighlight;   // true only for "(you)" — #2E8B57, 700
}
const List<FeaturedSpot> kFeaturedSpots;   // 3 rows
const String kPageTitle, kPageSubtitle, kCurrentTitle, kSpotsTakenPill;
const String kBannerTitle, kBannerBody;
const String kAdvertiseTitle, kPlacementEyebrow, kBannerAdEyebrow;
const String kWeekLabel, kWeekPrice, kMonthLabel, kMonthPrice, kChoose;
const String kCarouselTitle, kCarouselPrice, kCarouselDescription, kGetASlot;
const String kPaidDisclosure;
```

## Interactions & states

| Element | Interaction | Result |
|---|---|---|
| Sidebar rows | tap | `context.go` to the matching `/biz/*` route |
| "Choose" ×2, "Get a slot" | tap | inert — purchase flow has no artboard target |

**States not in the artboard**

- Loading: Phase 4.
- Empty (spots available / not currently featured): out of scope — the
  artboard only draws the all-taken state ("3 of 3 spots taken" is fixed copy).
- Error: out of scope.
- Pressed / hover: none.
- Disabled: n/a.

## Responsive notes

- Scroll region: `BizShell`'s content pane (Rule 3). The two-column body is
  an `Expanded` like the artboard's `flex:1` row, so it fills the pane at the
  reference size and scrolls when taller (large text scale).
- Kept fixed: 22 px rank circles, 30 px avatars, 22 px banner star, 32 px CTA
  heights, `1.5px` CTA borders.
- Made flexible: left/right columns at flex 13:10 (artboard `flex:1.3` / `1`),
  gap 20; all cards stretch full width. At 1440 the pane grows and the
  columns stretch with it (no table here to max-width at 1160).
- Behaviour at 900 px: sidebar stays, both columns compress; tier cards keep
  their `12 16` padding and the copy wraps.

## Open questions

- [ ] The "Choose" / "Get a slot" CTAs have no target — left inert. Where
  does purchase confirmation go?
- [ ] The banner says renewal is turned off "in Settings", but Biz_Settings
  draws no such control — copy only, no wired behaviour.
- [ ] "3 of 3 spots taken" is static copy; no free-spot state exists to port.

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes
- [x] No literal colours or font sizes outside `design/tokens/`
- [ ] Layer-2 side-by-side reviewed and signed off

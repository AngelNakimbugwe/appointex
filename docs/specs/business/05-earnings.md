# Business · Earnings & payouts

| | |
|---|---|
| **Artboard** | [`.design-src/Biz_Earnings.dc.html`](../../../.design-src/Biz_Earnings.dc.html) |
| **Reference size** | 1160 × 760 |
| **Route** | `/biz/earnings` |
| **Widget** | `lib/features/business/earnings/presentation/earnings_screen.dart` |
| **Build order** | business #5 |
| **Icons on screen** | 8 |

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
    div.navrow { background:#FFB5A7 }
      <svg>
      span { font-size:13px; font-weight:700; color:#6B3F3A }  "Earnings"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Services"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Featured Spots"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Settings"
  div { display:flex; flex-direction:column; flex:1; gap:16px; padding:26px 32px; overflow:hidden }
    div { display:flex; align-items:center; justify-content:space-between }
      span.head { font-size:20px; font-weight:800; color:#6B3F3A }  "Earnings"
      div { display:flex; align-items:center; height:38px; padding:0 16px; border:1px solid #6B3F3A; border-radius:19px }
        span { font-size:12.5px; font-weight:700; color:#6B3F3A }  "Payout account: MTN ··56"
    div { display:flex; gap:16px }
      div.stat
        span { font-size:11.5px; color:#8A8A8A }  "Gross bookings (30 days)"
        span.head { font-size:22px; font-weight:800; color:#6B3F3A }  "UGX 3,240,000"
      div.stat
        span { font-size:11.5px; color:#8A8A8A }  "Appointex commission (9%)"
        span.head { font-size:22px; font-weight:800; color:#6B3F3A }  "UGX 291,600"
      div.stat
        span { font-size:11.5px; color:#8A8A8A }  "Net payout"
        span.head { font-size:22px; font-weight:800; color:#6B3F3A }  "UGX 2,948,400"
      div.stat { background:#6B3F3A }
        span { font-size:11.5px; color:#FEC89A }  "Next payout"
        span.head { font-size:22px; font-weight:800; color:#FFFFFF }  "Fri, 29 Aug"
    div { display:flex; flex-direction:column; flex:1; gap:10px; padding:6px 22px 12px; background:#FFFFFF; border:1px solid #ECE7DC; border-radius:14px; overflow:hidden }
      div.row { border-bottom:1px solid #E8E3D8 }
        span.th { flex:1.2 }  "Date"
        span.th { flex:1.6 }  "Client & service"
        span.th { flex:1 }  "Amount"
        span.th { flex:1 }  "Commission"
        span.th { flex:1 }  "Status"
      div.row
        span { flex:1.2; font-size:12.5px; color:#5B5B5B }  "26 Aug"
        span { flex:1.6; font-size:12.5px; font-weight:600; color:#6B3F3A }  "Aisha K. · Everyday glam"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "UGX 120,000"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "UGX 10,800"
        span { flex:1 }
          span.pill { background:#FBF3E7; color:#9A6B1E }  "Held"
      div.row
        span { flex:1.2; font-size:12.5px; color:#5B5B5B }  "21 Aug"
        span { flex:1.6; font-size:12.5px; font-weight:600; color:#6B3F3A }  "Fiona T. · Everyday glam"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "UGX 140,000"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "UGX 12,600"
        span { flex:1 }
          span.pill { background:#EAF3EC; color:#2E8B57 }  "Released"
      div.row
        span { flex:1.2; font-size:12.5px; color:#5B5B5B }  "18 Aug"
        span { flex:1.6; font-size:12.5px; font-weight:600; color:#6B3F3A }  "Ruth M. · Photoshoot makeup"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "UGX 160,000"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "UGX 14,400"
        span { flex:1 }
          span.pill { background:#EAF3EC; color:#2E8B57 }  "Released"
      div.row { border-bottom:none }
        span { flex:1.2; font-size:12.5px; color:#5B5B5B }  "14 Aug"
        span { flex:1.6; font-size:12.5px; font-weight:600; color:#6B3F3A }  "Grace N. · Bridal makeup"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "UGX 350,000"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "UGX 31,500"
        span { flex:1 }
          span.pill { background:#EAF3EC; color:#2E8B57 }  "Released"
      span { font-size:11px; color:#9A9A9A }  "Held funds are released to your mobile money account within 24 hour…"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/business/earnings/data/fixtures.dart` verbatim.

- `Appointex`
- `FOR BUSINESS`
- `Dashboard`
- `Calendar`
- `Clients`
- `Earnings`
- `Services`
- `Featured Spots`
- `Settings`
- `Earnings`
- `Payout account: MTN ··56`
- `Gross bookings (30 days)`
- `UGX 3,240,000`
- `Appointex commission (9%)`
- `UGX 291,600`
- `Net payout`
- `UGX 2,948,400`
- `Next payout`
- `Fri, 29 Aug`
- `Date`
- `Client & service`
- `Amount`
- `Commission`
- `Status`
- `26 Aug`
- `Aisha K. · Everyday glam`
- `UGX 120,000`
- `UGX 10,800`
- `Held`
- `21 Aug`
- `Fiona T. · Everyday glam`
- `UGX 140,000`
- `UGX 12,600`
- `Released`
- `18 Aug`
- `Ruth M. · Photoshoot makeup`
- `UGX 160,000`
- `UGX 14,400`
- `Released`
- `14 Aug`
- `Grace N. · Bridal makeup`
- `UGX 350,000`
- `UGX 31,500`
- `Released`
- `Held funds are released to your mobile money account within 24 hours of the appointment being marked complete.`

## Tokens on this screen

**Colours** — #6B3F3A (16) · #C9A79D (12) · #5B5B5B (12) · #FFFFFF (9) · #8A8A8A (3) · #EAF3EC (3) · #2E8B57 (3) · #ECE7DC (2) · #9A9A9A (2) · #A66A5D (2) · #FEC89A (2) · #F1EEE6 (1) · #FBFAF7 (1) · #F8EDEB (1) · #FFB5A7 (1) · #E8E3D8 (1) · #FBF3E7 (1) · #9A6B1E (1)

**Font sizes** — 12.5px (17) · 13px (8) · 11.5px (4) · 22px (4) · 11px (2) · 10.5px (1) · 9.5px (1) · 20px (1)

**Radii** — 14px (2) · 9px (1) · 7px (1) · 8px (1) · 19px (1)

**Gradients**

- `linear-gradient(135deg,#6B3F3A,#A66A5D)`

## Artboard-local CSS classes

`.navrow`

```css
display:flex; align-items:center; gap:11px; padding:10px 16px; border-radius:9px;
```

`.stat`

```css
flex:1; background:#FFFFFF; border:1px solid #ECE7DC; border-radius:14px; padding:16px 18px; display:flex; flex-direction:column; gap:6px;
```

`.row`

```css
display:flex; align-items:center; gap:14px; padding:12px 6px; border-bottom:1px solid #F1EEE6;
```

`.th`

```css
font-size:11px; font-weight:700; color:#9A9A9A; text-transform:uppercase; letter-spacing:0.03em;
```

`.pill`

```css
padding:3px 9px; border-radius:7px; font-size:10.5px; font-weight:700;
```


<!-- HANDWRITTEN — everything below this line is preserved by specgen -->







## Purpose

The business owner reviews what they earned: gross bookings vs Appointex commission vs net payout over the last 30 days, when the next payout lands (the dark "Next payout" tile), and the per-appointment ledger showing each payout's amount, commission and escrow status (Held / Released). The only navigation onward is the shell sidebar to the other business sections; the screen itself is read-only.

## Components used

- `BizShell` (sidebar + scrolling pane; sidebar taps already wired by the shell)
- `AxStatTile` — **extended additively** in this task: a `valueSize` parameter (Biz_Earnings stat values are 22 px where the dashboard's are 24) and an `AxStatTile.dark` named constructor for the `#6B3F3A` / label `#FEC89A` / value `#FFFFFF` tile (Biz_Earnings.dc.html line 71). Defaults keep the dashboard rendering byte-identical (biz_dashboard golden still passes).
- `AxPill` — `Held` uses `pending`/`pendingBg`, `Released` uses `verified`/`verifiedBg`
- Screen-local: `EarningsTable` (`presentation/widgets/earnings_table.dart`) and the payout-account chip (stadium outline, height 38). **Recommendation:** extend the shared `AxDataTable` with per-cell builders (pills, per-column weights, row gap, footnote) so Earnings/Services/Clients can share one implementation; today its `List<List<String>>` rows cannot express any of those.

## Data model

`lib/features/business/earnings/data/fixtures.dart` — `EarningsStat {label, value, dark}` as `kStats`, `PayoutEntry {date, clientService, amount, commission, released}` as `kPayouts`, plus `kPageTitle`, `kPayoutAccount`, `kColumns`, `kHeldLabel`, `kReleasedLabel`, `kFootnote`. All values verbatim from the copy inventory above.

## Interactions & states

| Element | Interaction | Result |
|---|---|---|
| Payout account chip | none | display only; opening account settings is Phase 4 |
| Table rows | none | display only |
| Sidebar rows | tap | navigate via BizShell (already wired) |

**States not in the artboard** — loading / empty / error are out of scope (static port; Phase 4 wires the API). Pressed / hover / disabled on the chip are Phase 4.

## Responsive notes

- Scroll region: the whole content pane (`BizShell`'s `SingleChildScrollView`, Rule 3); the table card is the `flex:1` body via a trailing `Expanded`.
- Kept fixed: chip height 38, stat tile padding `16 18`, row padding `12 6`, sidebar 220, all font sizes/radii/colours.
- Made flexible: stat tiles are equal `Expanded`s (stretched to equal height, matching CSS default `align-items:stretch`); table columns are proportional flexes `6, 8, 5, 5, 5` (×5 of `1.2, 1.6, 1, 1, 1`); every cell text ellipsizes (`maxLines: 1`).
- 900 px: tile values wrap to a second line rather than clip (CSS behaves the same — no `white-space:nowrap`); 1440 px: the card stretches with the pane. `textScaler 1.3` — the 38 px chip still holds the 16.25 px label; verified no overflow.

## Open questions

- [ ] `lib/app/router.dart` still routes `/biz/earnings` to the Phase 0 placeholder (outside this task's file set) — needs wiring.
- [ ] The artboard gives no state for a different/missing payout account, or for what the chip should open.
- [ ] The dark "Next payout" tile is the only dark stat tile in the design — if more appear, promote the value size (22) into `AxType` instead of the screen-local constant.

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes (content pane has no icons; sidebar renders via `AxIcon`)
- [x] No literal colours or font sizes outside `design/tokens/`
- [ ] Layer-2 side-by-side reviewed and signed off

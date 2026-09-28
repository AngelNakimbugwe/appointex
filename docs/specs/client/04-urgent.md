# Client · Urgent booking

| | |
|---|---|
| **Artboard** | [`.design-src/Client_Urgent.dc.html`](../../../.design-src/Client_Urgent.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/home/urgent` |
| **Widget** | `lib/features/client/urgent/presentation/urgent_screen.dart` |
| **Build order** | client #4 |
| **Icons on screen** | 14 |

> Everything above the HANDWRITTEN marker is generated from the artboard by
> `node tool/design/specgen.mjs`. Do not edit it — edit the artboard, or add
> your notes below the marker.

## Root container

```
width: 390px
height: 844px
background: #FFFFFF
display: flex
flex-direction: column
overflow: hidden
```

Per [Rule 1](../../03-RESPONSIVE-RULES.md): drop `width`, `height` and
`overflow`; keep the background; wrap in `SafeArea`.

## Layout tree

```
div { display:flex; flex-direction:column; width:390px; height:844px; background:#FFFFFF; overflow:hidden }
  div { display:flex; flex-shrink:0; gap:12px; align-items:center; height:56px; padding:0 16px; border-bottom:1px solid #ECE7DC }
    <svg>
    <svg>
    span.head { font-size:16px; font-weight:700; color:#6B3F3A }  "Urgent booking"
  div { display:flex; flex-direction:column; flex:1; gap:16px; padding:16px 18px; overflow:hidden }
    div { display:flex; gap:12px; align-items:center; padding:14px 16px; background:linear-gradient(120deg,#FF7A4D,#E8433D); border-radius:14px }
      div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:36px; height:36px; background:rgba(255,255,255,0.22); border-radius:10px }
        <svg>
      div { display:flex; flex-direction:column; gap:2px }
        span.head { font-size:13.5px; font-weight:800; color:#FFFFFF }  "Need it today?"
        span { font-size:11px; color:#FFE4DA; line-height:1.4 }  "We'll match you with a provider who has a real opening in your window."
    div { display:flex; flex-direction:column; gap:8px }
      span.head { font-size:12.5px; font-weight:700; color:#6B3F3A }  "What do you need?"
      div { display:flex; gap:12px; overflow:hidden }
        div.catchip
          div { display:flex; align-items:center; justify-content:center; width:44px; height:44px; background:#F9DCC4; border-radius:12px }
            <svg>
          span { font-size:10px; font-weight:600; color:#5B5B5B }  "Hair"
        div.catchip
          div { display:flex; align-items:center; justify-content:center; width:44px; height:44px; background:#E8433D; border-radius:12px }
            <svg>
          span { font-size:10px; font-weight:700; color:#E8433D }  "Makeup"
        div.catchip
          div { display:flex; align-items:center; justify-content:center; width:44px; height:44px; background:#F5DEE0; border-radius:12px }
            <svg>
          span { font-size:10px; font-weight:600; color:#5B5B5B }  "Nails"
        div.catchip
          div { display:flex; align-items:center; justify-content:center; width:44px; height:44px; background:#F8EDEB; border-radius:12px }
            <svg>
          span { font-size:10px; font-weight:600; color:#5B5B5B; text-align:center }  "Spa"
    div { display:flex; flex-direction:column; gap:8px }
      span.head { font-size:12.5px; font-weight:700; color:#6B3F3A }  "How soon?"
      div { display:flex; flex-direction:column; gap:8px }
        div { display:flex; align-items:center; justify-content:space-between; padding:11px 14px; border:1px solid #E0DBCF; border-radius:12px }
          span { font-size:12.5px; font-weight:600; color:#3A3A3A }  "Today"
          span { font-size:11.5px; font-weight:700; color:#8A8A8A }  "+15% rush fee"
        div { display:flex; align-items:center; justify-content:space-between; padding:11px 14px; background:#FFF3EF; border:2px solid #E8433D; border-radius:12px }
          span { font-size:12.5px; font-weight:700; color:#E8433D }  "Next 3 hours"
          span { font-size:11.5px; font-weight:800; color:#E8433D }  "+25% rush fee"
        div { display:flex; align-items:center; justify-content:space-between; padding:11px 14px; border:1px solid #E0DBCF; border-radius:12px }
          span { font-size:12.5px; font-weight:600; color:#3A3A3A }  "ASAP · within 1 hr"
          span { font-size:11.5px; font-weight:700; color:#8A8A8A }  "+40% rush fee"
    div { display:flex; gap:8px; align-items:flex-start; padding:10px 12px; background:#F7F5F1; border-radius:10px }
      <svg>
      span { font-size:10.5px; color:#5B5B5B; line-height:1.5 }  "Only providers with a genuinely open slot in this window are shown.…"
    div { display:flex; flex-direction:column; gap:10px }
      span.head { font-size:12.5px; font-weight:700; color:#6B3F3A }  "2 providers can fit you in this window"
      div { display:flex; gap:12px; padding:12px; border:1px solid #ECE7DC; border-radius:14px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:56px; height:56px; background:linear-gradient(135deg,#F9DCC4,#FEC89A); border-radius:12px }
          <svg>
        div { display:flex; flex-direction:column; flex:1; gap:3px }
          div { display:flex; gap:5px; align-items:center }
            span { font-size:13px; font-weight:700; color:#6B3F3A }  "Patricia Glam Studio"
            <svg>
          span { font-size:11px; color:#8A8A8A }  "5.0 · Kololo · Everyday glam"
          div { display:flex; gap:4px; align-items:center }
            <svg>
            span { font-size:10.5px; font-weight:700; color:#E8433D }  "Free at 3:15pm today"
          span { font-size:11.5px; color:#3A3A3A }  "UGX 60,000 &plus; 25% rush →"
            span { font-weight:800; color:#6B3F3A }  "UGX 75,000"
      div { display:flex; gap:12px; padding:12px; border:1px solid #ECE7DC; border-radius:14px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:56px; height:56px; background:linear-gradient(135deg,#F8EDEB,#FFB5A7); border-radius:12px }
          <svg>
        div { display:flex; flex-direction:column; flex:1; gap:3px }
          div { display:flex; gap:5px; align-items:center }
            span { font-size:13px; font-weight:700; color:#6B3F3A }  "Nina's Beauty Bar"
            <svg>
          span { font-size:11px; color:#8A8A8A }  "4.7 · Bugolobi · Everyday glam"
          div { display:flex; gap:4px; align-items:center }
            <svg>
            span { font-size:10.5px; font-weight:700; color:#E8433D }  "Free at 4:00pm today"
          span { font-size:11.5px; color:#3A3A3A }  "UGX 35,000 &plus; 25% rush →"
            span { font-weight:800; color:#6B3F3A }  "UGX 43,750"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/urgent/data/fixtures.dart` verbatim.

- `Urgent booking`
- `Need it today?`
- `We'll match you with a provider who has a real opening in your window.`
- `What do you need?`
- `Hair`
- `Makeup`
- `Nails`
- `Spa`
- `How soon?`
- `Today`
- `+15% rush fee`
- `Next 3 hours`
- `+25% rush fee`
- `ASAP · within 1 hr`
- `+40% rush fee`
- `Only providers with a genuinely open slot in this window are shown. The rush fee is shown before you book, on top of the normal service price.`
- `2 providers can fit you in this window`
- `Patricia Glam Studio`
- `5.0 · Kololo · Everyday glam`
- `Free at 3:15pm today`
- `UGX 60,000 &plus; 25% rush →`
- `UGX 75,000`
- `Nina's Beauty Bar`
- `4.7 · Bugolobi · Everyday glam`
- `Free at 4:00pm today`
- `UGX 35,000 &plus; 25% rush →`
- `UGX 43,750`

## Tokens on this screen

**Colours** — #6B3F3A (13) · #E8433D (11) · #FFFFFF (6) · #C15B6B (6) · #5B5B5B (4) · #3A3A3A (4) · #8A8A8A (4) · #ECE7DC (3) · #FFB5A7 (3) · #F9DCC4 (2) · #C97A5D (2) · #9C6B7A (2) · #F8EDEB (2) · #E0DBCF (2) · #FEC89A (2) · #2E8B57 (2) · #FF7A4D (1) · #FFE4DA (1) · #F5DEE0 (1) · #B37B4E (1) · #FFF3EF (1) · #F7F5F1 (1) · #D98B96 (1)

**Font sizes** — 12.5px (6) · 11.5px (5) · 10px (4) · 11px (3) · 10.5px (3) · 13px (2) · 16px (1) · 13.5px (1)

**Radii** — 12px (9) · 14px (3) · 10px (2)

**Gradients**

- `linear-gradient(120deg,#FF7A4D,#E8433D)`
- `linear-gradient(135deg,#F9DCC4,#FEC89A)`
- `linear-gradient(135deg,#F8EDEB,#FFB5A7)`

## Artboard-local CSS classes

`.catchip`

```css
display:flex; flex-direction:column; align-items:center; gap:5px; flex-shrink:0; width:58px;
```


<!-- HANDWRITTEN — everything below this line is preserved by specgen -->







## Purpose

Urgent-booking entry point reached from Home. The user picks a service category and a time window, is shown only providers with a genuinely open slot in that window (rush fee disclosed up front), and drills into a provider to book.

## Components used

- [x] `AxAvatar` — 56px, radius 12, art passed via `child` at the artboard's exact 52% (29.12) rather than the widget's 55% default
- [x] `AxVerifiedBadge`
- [x] `AxIcon` / `AxArt` — `chevronLeft`, `boltFill` (16 header / 18 banner / 11 slot pill), `clock`, `catHair`/`catMakeup`/`catNails`/`catSpa`, `artMakeup`/`artNails`
- [ ] `AxMobileHeader` — **not used**: this artboard's header is the 56px `0 16` bordered bar (line 19), which `AxMobileHeader` does not cover (it models the Home/inner-page padding). Local `_Header` kept in the screen file. Same bar appears on Book, Checkout, EventBundle and Search — see Open questions.
- [ ] `AxProviderRow` — **not used**: `AxProviderRow.urgent` renders `feeSummary` as flat 11.5px text, but the artboard's fee line ends in a bold `#6B3F3A` nested span with `margin-top:1px` (lines 102, 115). Local `UrgentMatchRow` in `presentation/widgets/`. See Open questions.
- Local: `_Banner`, `_CategoryPicker`/`_Catchip` (Tier 3 `.catchip`), `_WindowPicker`/`_WindowOption`, `_RushNote` — all screen-private in `urgent_screen.dart`.

## Data model

`lib/features/client/urgent/data/fixtures.dart` — `UrgentCategory`, `UrgentWindow`,
`UrgentMatch` (id, name, subtitle, slotTime, feeBase, feeTotal, art, gradient)
plus `kUrgentCategories`, `kUrgentWindows`, `kUrgentMatches` and the `kUrgent*`
copy constants. The fee is split `feeBase`/`feeTotal` because the artboard
styles the two halves differently.

## Interactions & states

| Element | Interaction | Result |
|---|---|---|
| Back arrow | tap | `context.pop()` → `/home` |
| Provider match row | tap | `context.go('/provider/:id')` (fixture ids) |
| Category chip | tap | Phase 4 — selection + re-filter of matches |
| Time window | tap | Phase 4 — selection; heading count follows |

- Loading: out of scope (fixtures only)
- Empty: out of scope
- Error: out of scope
- Pressed / hover: Phase 4
- Disabled: n/a

## Responsive notes

- Scroll region: everything below the fixed 56px header (Rule 3) — banner, pickers, note and provider list all scroll.
- Kept fixed: header 56; `.catchip` 58 wide with 44px tile; banner icon tile 36; avatar 56 (art 29.12); window option padding 11/14.
- Made flexible: window label/fee texts wrap inside `Flexible` (CSS spans wrap under constraint); slot pill text wraps; header title sits in `Expanded`.
- The category row is a horizontal scroller (`SingleChildScrollView` + `Row`) so the fixed 58px chips never wrap; at 390 all four fit.
- Urgent gradient is the Rule-9 120deg approximation (`AxGradients.urgent`).
- Behaviour at 320 px / 900 px: verified no overflow at 320/390/430 and at textScaler 1.3. 900 px is a business-form-factor concern — out of scope; the content column simply stretches.

## Open questions

- [ ] Five client artboards (Urgent, Search, Book, Checkout, EventBundle) share this 56px `0 16` bordered header bar; `AxMobileHeader` should grow an inner-page variant so it can be shared.
- [ ] `AxProviderRow.urgent` should accept a rich fee line (base + bold total, +1px top offset) instead of a flat string; the urgent screen currently carries a local row.
- [ ] Do category/window taps re-filter the match list and heading count ("2 providers can fit you in this window")? Phase 4.
- [ ] No bottom nav on this artboard — confirmed absent, none embedded.

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes
- [x] No literal colours or font sizes outside `design/tokens/`
- [ ] Layer-2 side-by-side reviewed and signed off

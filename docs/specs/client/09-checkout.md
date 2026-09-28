# Client · Checkout

| | |
|---|---|
| **Artboard** | [`.design-src/Client_Checkout.dc.html`](../../../.design-src/Client_Checkout.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/checkout` |
| **Widget** | `lib/features/client/checkout/presentation/checkout_screen.dart` |
| **Build order** | client #9 |
| **Icons on screen** | 6 |

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
  div { display:flex; flex-shrink:0; gap:14px; align-items:center; height:56px; padding:0 16px; border-bottom:1px solid #ECE7DC }
    <svg>
    span.head { font-size:16px; font-weight:700; color:#6B3F3A }  "Checkout"
  div { display:flex; flex-direction:column; flex:1; gap:14px; padding:18px; overflow:hidden }
    div { display:flex; align-items:center; justify-content:space-between; padding:12px 14px; background:#EAF4F3; border:1px solid #BFDCDA; border-radius:12px }
      div { display:flex; gap:9px; align-items:center }
        <svg>
        div { display:flex; flex-direction:column }
          span { font-size:12.5px; font-weight:700; color:#2E6864 }  "At my location"
          span { font-size:11px; color:#4E827E }  "Naguru, Kampala · details sent to provider after booking"
      span { font-size:11.5px; font-weight:700; color:#3D8B85 }  "Change"
    div { display:flex; flex-direction:column; gap:9px; padding:14px; background:#F7F5F1; border-radius:14px }
      div { display:flex; justify-content:space-between }
        span { font-size:12.5px; color:#3A3A3A }  "Bridal makeup, full glam"
        span { font-size:12.5px; font-weight:600; color:#6B3F3A }  "UGX 180,000"
      div { display:flex; justify-content:space-between }
        span { font-size:12.5px; color:#3A3A3A }  "Lashes add-on"
        span { font-size:12.5px; font-weight:600; color:#6B3F3A }  "UGX 20,000"
      div { height:1px; margin:2px 0; background:#E8E3D8 }
      div { display:flex; justify-content:space-between }
        span { font-size:12.5px; color:#3A3A3A }  "Subtotal"
        span { font-size:12.5px; font-weight:600; color:#6B3F3A }  "UGX 200,000"
      div { display:flex; justify-content:space-between }
        span { font-size:12.5px; color:#3A3A3A }  "Service fee (3%)"
        span { font-size:12.5px; font-weight:600; color:#6B3F3A }  "UGX 6,000"
      div { display:flex; align-items:center; justify-content:space-between }
        span { display:flex; gap:4px; align-items:center; font-size:12.5px; color:#E8433D }  "Urgent booking fee (25%)"
          <svg>
        span { font-size:12.5px; font-weight:700; color:#E8433D }  "UGX 50,000"
      div { display:flex; align-items:center; justify-content:space-between }
        span { display:flex; gap:4px; align-items:center; font-size:12.5px; color:#3D8B85 }  "Mobile service fee (5%)"
          <svg>
        span { font-size:12.5px; font-weight:700; color:#3D8B85 }  "UGX 10,000"
      div { height:1px; margin:2px 0; background:#E8E3D8 }
      div { display:flex; justify-content:space-between }
        span { font-size:14px; font-weight:800; color:#6B3F3A }  "Total"
        span { font-size:14px; font-weight:800; color:#6B3F3A }  "UGX 266,000"
    div { display:flex; flex-direction:column; gap:10px }
      span.head { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Pay with"
      div { display:flex; gap:12px; align-items:center; padding:13px 14px; border:2px solid #6B3F3A; border-radius:12px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:34px; height:24px; background:#FFCC08; border-radius:5px }
          span { font-size:9px; font-weight:800; color:#6B3F3A }  "MTN"
        span { flex:1; font-size:13px; font-weight:600; color:#6B3F3A }  "MTN Mobile Money"
        div { width:18px; height:18px; border:5.5px solid #6B3F3A; border-radius:50% }
      div { display:flex; gap:12px; align-items:center; padding:13px 14px; border:1px solid #E0DBCF; border-radius:12px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:34px; height:24px; background:#ED1C24; border-radius:5px }
          span { font-size:8px; font-weight:800; color:#FFFFFF }  "Airtel"
        span { flex:1; font-size:13px; font-weight:600; color:#3A3A3A }  "Airtel Money"
        div { width:18px; height:18px; border:1.5px solid #C7C2B6; border-radius:50% }
      div { display:flex; flex-direction:column; gap:6px }
        span { font-size:11.5px; color:#8A8A8A }  "Mobile money number"
        div { display:flex; align-items:center; height:46px; padding:0 14px; border:1px solid #E0DBCF; border-radius:10px }
          span { font-size:13.5px; font-weight:600; color:#6B3F3A }  "+256 772 ••• 145"
    div { display:flex; flex-direction:column; gap:10px; padding:12px; background:#F7F5F1; border-radius:10px }
      div { display:flex; gap:8px; align-items:flex-start }
        <svg>
        span { font-size:11.5px; color:#5B5B5B; line-height:1.5 }  "Held securely by Appointex until the appointment is marked complete…"
      div { display:flex; gap:8px; align-items:flex-start }
        <svg>
        span { font-size:11.5px; color:#5B5B5B; line-height:1.5 }  "Buyer protection and verified reviews apply only to bookings paid i…"
  div { display:flex; flex-direction:column; flex-shrink:0; gap:12px; padding:14px 18px 22px; border-top:1px solid #ECE7DC }
    div { display:flex; align-items:center; justify-content:space-between }
      span { font-size:12.5px; color:#8A8A8A }  "Total"
      span.head { font-size:18px; font-weight:800; color:#6B3F3A }  "UGX 266,000"
    div { display:flex; align-items:center; justify-content:center; height:50px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); border-radius:25px }
      span { font-size:14.5px; font-weight:700; color:#6B3F3A }  "Confirm payment"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/checkout/data/fixtures.dart` verbatim.

- `Checkout`
- `At my location`
- `Naguru, Kampala · details sent to provider after booking`
- `Change`
- `Bridal makeup, full glam`
- `UGX 180,000`
- `Lashes add-on`
- `UGX 20,000`
- `Subtotal`
- `UGX 200,000`
- `Service fee (3%)`
- `UGX 6,000`
- `Urgent booking fee (25%)`
- `UGX 50,000`
- `Mobile service fee (5%)`
- `UGX 10,000`
- `Total`
- `UGX 266,000`
- `Pay with`
- `MTN`
- `MTN Mobile Money`
- `Airtel`
- `Airtel Money`
- `Mobile money number`
- `+256 772 ••• 145`
- `Held securely by Appointex until the appointment is marked complete. We never ask for or store your mobile money PIN.`
- `Buyer protection and verified reviews apply only to bookings paid in the app.`
- `Total`
- `UGX 266,000`
- `Confirm payment`

## Tokens on this screen

**Colours** — #6B3F3A (17) · #3D8B85 (5) · #3A3A3A (5) · #E8433D (3) · #FFFFFF (2) · #ECE7DC (2) · #F7F5F1 (2) · #E8E3D8 (2) · #E0DBCF (2) · #8A8A8A (2) · #5B5B5B (2) · #BFDCDA (1) · #EAF4F3 (1) · #2E6864 (1) · #4E827E (1) · #FFCC08 (1) · #ED1C24 (1) · #C7C2B6 (1) · #2E8B57 (1) · #FEC89A (1) · #FFB5A7 (1)

**Font sizes** — 12.5px (14) · 11.5px (4) · 14px (2) · 13.5px (2) · 13px (2) · 16px (1) · 11px (1) · 9px (1) · 8px (1) · 18px (1) · 14.5px (1)

**Radii** — 12px (3) · 5px (2) · 10px (2) · 14px (1) · 25px (1)

**Gradients**

- `linear-gradient(135deg,#FEC89A,#FFB5A7)`

## Artboard-local CSS classes

_None — this screen is entirely inline-styled._

<!-- HANDWRITTEN — everything below this line is preserved by specgen -->







## Purpose

The pay leg of the booking flow: the client confirms where the appointment
happens ("At my location"), reviews the itemised total — service, add-ons,
service fee, urgent booking fee, mobile service fee — chooses a mobile-money
wallet (MTN or Airtel), verifies the masked number, and confirms payment,
which lands on the confirmation screen.

## Components used

- `AxPrimaryButton` — footer "Confirm payment" (height 50, label 14.5)
- Screen-local (kept local on purpose):
  - `_HeaderBar` — the artboard's 56 px header (`padding:0 16px`); same
    rationale as EventBundle's, and the two should be promoted together if
    a third screen uses this exact header
  - `_Rule` — the 1 px `#E8E3D8` divider with 2 px vertical margins
  - `_MethodRow` — wallet row: 34×24 brand tile, label, 18 px radio ring
    (5.5 px border when selected, 1.5 px when not)
  - `_NumberField` — the masked mobile-money number field
  - `_CostCard` / `_CostLine` / `_SecurityNotes` — single-screen composites

## Data model

`Checkout`, `CheckoutLine`, `CheckoutPaymentMethod`, `CheckoutNote`; fixture
`kCheckout` in `lib/features/client/checkout/data/fixtures.dart` — all
strings verbatim from the copy inventory.

```dart
// lib/features/client/checkout/data/fixtures.dart
const kCheckout = Checkout(...);
```

## Interactions & states

| Element | Interaction | Result |
|---|---|---|
| Back arrow | tap | `context.pop()` |
| "Change" (location) | tap | location picker — Phase 4 (no artboard) |
| MTN / Airtel rows | tap | wallet selection is static (MTN selected); live selection — Phase 4 |
| Mobile money number | tap | edit — Phase 4 |
| "Confirm payment" | tap | `context.go('/confirmation')` |

**States not in the artboard**

- Loading: out of scope (fixture-driven static port)
- Empty: out of scope
- Error: out of scope (payment failure states unspecified)
- Pressed / hover: Phase 4
- Disabled: Phase 4 (button never disabled in the static frame)

## Responsive notes

- Scroll region: `Expanded > SingleChildScrollView` between the fixed
  header and the fixed footer (total + CTA stay visible — Rule 3)
- Kept fixed: header 56, brand tiles 34×24, radio rings 18, number field 46,
  button 50
- Made flexible: fee-row labels and amounts sit in `Flexible` so they wrap
  instead of overflowing (CSS `flex-shrink: 1` semantics); card/field widths
  fill the content column
- The 18 px footer total and the 8 px Airtel brand label have no `AxType`
  step — cited local values (see screen / fixtures)
- No bottom nav — full-screen flow
- At 320 px and at `textScaler 1.3`: no overflow (tested)

## Open questions

- [ ] Where does "Change" (location) lead? No location-picker artboard.
- [ ] The Airtel brand label is 8 px — below the type scale's smallest step.
      Kept as fixture data with an artboard citation; flagged in case design
      wants it bumped to 9.
- [ ] Payment failure / pending states are unspecified in the artboards.

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes
- [x] No literal colours or font sizes outside `design/tokens/`
- [ ] Layer-2 side-by-side reviewed and signed off

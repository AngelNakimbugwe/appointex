# Client · Confirmation

| | |
|---|---|
| **Artboard** | [`.design-src/Client_Confirmation.dc.html`](../../../.design-src/Client_Confirmation.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/confirmation` |
| **Widget** | `lib/features/client/confirmation/presentation/confirmation_screen.dart` |
| **Build order** | client #10 |
| **Icons on screen** | 5 |

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
  div { display:flex; flex-direction:column; flex:1; gap:18px; align-items:center; justify-content:center; padding:0 32px }
    div { display:flex; align-items:center; justify-content:center; width:120px; height:120px; position:relative }
      <svg>
      <svg>
      <svg>
      <svg>
      div { display:flex; align-items:center; justify-content:center; width:76px; height:76px; background:linear-gradient(135deg,#FCD5CE,#FFB5A7); border-radius:50% }
        <svg>
    div { display:flex; flex-direction:column; gap:6px; align-items:center }
      span.head { font-size:20px; font-weight:800; color:#6B3F3A }  "Booking confirmed"
      span { font-size:13px; color:#7A7A7A; line-height:1.5; text-align:center }  "We've sent a WhatsApp confirmation to your number."
    div { display:flex; flex-direction:column; gap:9px; width:100%; padding:16px; background:#F7F5F1; border-radius:14px }
      div { display:flex; justify-content:space-between }
        span { font-size:12px; color:#8A8A8A }  "Provider"
        span { font-size:12.5px; font-weight:700; color:#6B3F3A }  "Patricia Glam Studio"
      div { display:flex; justify-content:space-between }
        span { font-size:12px; color:#8A8A8A }  "Service"
        span { font-size:12.5px; font-weight:700; color:#6B3F3A }  "Bridal makeup, full glam"
      div { display:flex; justify-content:space-between }
        span { font-size:12px; color:#8A8A8A }  "When"
        span { font-size:12.5px; font-weight:700; color:#6B3F3A }  "Wed 26 Aug, 12:00 pm"
      div { height:1px; margin:2px 0; background:#E8E3D8 }
      div { display:flex; justify-content:space-between }
        span { font-size:12px; color:#8A8A8A }  "Amount held"
        span { font-size:13px; font-weight:800; color:#6B3F3A }  "UGX 206,000"
    span { font-size:11px; color:#9A9A9A; line-height:1.5; text-align:center }  "Free cancellation up to 24 hours before. If your provider cancels o…"
    div { display:flex; flex-direction:column; gap:10px; width:100% }
      div { display:flex; align-items:center; justify-content:center; height:48px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); border-radius:24px }
        span { font-size:14px; font-weight:700; color:#6B3F3A }  "View booking"
      div { display:flex; align-items:center; justify-content:center; height:48px; border:1.5px solid #6B3F3A; border-radius:24px }
        span { font-size:14px; font-weight:700; color:#6B3F3A }  "Add to calendar"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/confirmation/data/fixtures.dart` verbatim.

- `Booking confirmed`
- `We've sent a WhatsApp confirmation to your number.`
- `Provider`
- `Patricia Glam Studio`
- `Service`
- `Bridal makeup, full glam`
- `When`
- `Wed 26 Aug, 12:00 pm`
- `Amount held`
- `UGX 206,000`
- `Free cancellation up to 24 hours before. If your provider cancels or doesn't show, you're refunded automatically.`
- `View booking`
- `Add to calendar`

## Tokens on this screen

**Colours** — #6B3F3A (9) · #8A8A8A (4) · #FFB5A7 (3) · #FFFFFF (2) · #FEC89A (2) · #D98B96 (1) · #FCD5CE (1) · #7A7A7A (1) · #F7F5F1 (1) · #E8E3D8 (1) · #9A9A9A (1)

**Font sizes** — 12px (4) · 12.5px (3) · 13px (2) · 14px (2) · 20px (1) · 11px (1)

**Radii** — 24px (2) · 14px (1)

**Gradients**

- `linear-gradient(135deg,#FCD5CE,#FFB5A7)`
- `linear-gradient(135deg,#FEC89A,#FFB5A7)`

## Artboard-local CSS classes

_None — this screen is entirely inline-styled._

<!-- HANDWRITTEN — everything below this line is preserved by specgen -->







## Purpose

The success leg of the booking flow: a centred hero and summary card confirm
the booking (provider, service, time, amount held in escrow) and the WhatsApp
confirmation, with a cancellation footnote. "View booking" jumps to the
bookings list; "Add to calendar" will add the appointment to the device
calendar.

## Components used

- `AxPrimaryButton` ×2 — gradient "View booking" and outline "Add to
  calendar", both height 48 with 14 px labels (radius 24 on 48 = stadium)
- Screen-local (kept local on purpose):
  - `_Hero` — the 120×120 confetti `Stack`; the four dots are plain filled
    `Container`s, not SVG assets (docs/05 "Not icons at all")
  - `_DetailsCard` / `_DetailRow` / `_Rule` — the summary card rows
  - `_TitleBlock`, `_Buttons` — trivial single-screen composites

## Data model

`Confirmation`, `ConfirmationDetail`; fixture `kConfirmation` in
`lib/features/client/confirmation/data/fixtures.dart` — all strings verbatim
from the copy inventory.

```dart
// lib/features/client/confirmation/data/fixtures.dart
const kConfirmation = Confirmation(...);
```

## Interactions & states

| Element | Interaction | Result |
|---|---|---|
| "View booking" | tap | `context.go('/bookings')` |
| "Add to calendar" | tap | device calendar intent — Phase 4; no-op in this port |

**States not in the artboard**

- Loading: out of scope (fixture-driven static port)
- Empty: n/a (there is always a booking to confirm)
- Error: out of scope
- Pressed / hover: Phase 4
- Disabled: n/a

## Responsive notes

- Scroll region: the whole screen. `LayoutBuilder > SingleChildScrollView >
  ConstrainedBox(minHeight)` keeps the content centred when it fits and
  scrollable when it does not (at 320×640 with `textScaler 1.3` it scrolls)
- Kept fixed: hero box 120, gradient disc 76, check icon 38, buttons 48
- Made flexible: card and buttons fill the content column
  (`crossAxisAlignment: stretch`), the hero is wrapped in `Center` so the
  `Positioned` confetti dots keep their 120×120 coordinate box
- No header and no bottom nav — the artboard is a bare centred column
  (full-screen flow)

## Open questions

- [ ] The gradient disc carries `box-shadow:0 10px 24px
      rgba(224,122,95,0.4)` (artboard line 24). Omitted: the port bans
      shadows, and `#E07A5F` has no `AxColors` token (the lint forbids a
      local `Color(0x…)`). Needs a design/token decision.
- [ ] "Add to calendar" behaviour — device calendar intent is unspecified in
      the artboards.
- [ ] "Amount held" (`UGX 206,000`) differs from the checkout total
      (`UGX 266,000`) in the artboards; kept verbatim, presumably a
      deposit-vs-total distinction to be confirmed.

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes
- [x] No literal colours or font sizes outside `design/tokens/`
- [ ] Layer-2 side-by-side reviewed and signed off

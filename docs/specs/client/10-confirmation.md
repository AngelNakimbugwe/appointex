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

_One paragraph: what the user is doing on this screen, and what they can reach
from it. Written from the product's point of view, not the layout's._

## Components used

_Which `Ax*` widgets this screen composes, and any screen-local widgets it needs.
If a screen-local widget here also appears on another screen, promote it to
`design/widgets/` and note that here._

- [ ] `AxMobileHeader`
- [ ] …

## Data model

_The fixture shape this screen reads. Name the model classes and the fixture
constant. The copy inventory above is the source of the values._

```dart
// lib/features/<row>/<feature>/data/fixtures.dart
```

## Interactions & states

The artboards are static frames, so everything in this section is an extension
of the design rather than a transcription of it. Decide it deliberately.

| Element | Interaction | Result |
|---|---|---|
| | | |

**States not in the artboard** — specify each, or explicitly say "out of scope":

- Loading:
- Empty:
- Error:
- Pressed / hover:
- Disabled:

## Responsive notes

_Per-screen deviations from [03-RESPONSIVE-RULES.md](../../03-RESPONSIVE-RULES.md).
Which fixed dimensions were kept and why; which became flexible; where the
scroll boundary sits._

- Scroll region:
- Kept fixed:
- Made flexible:
- Behaviour at 320 px / 900 px:

## Open questions

_Things the artboard does not answer. Raise them rather than inventing an answer
silently._

- [ ]

## Acceptance criteria

- [ ] Golden passes at the reference size
- [ ] No overflow across the responsive matrix
- [ ] No overflow at `textScaler: 1.3`
- [ ] Every string from the copy inventory present, character for character
- [ ] All icons are `AxIcons` / `AxArt`, no Material substitutes
- [ ] No literal colours or font sizes outside `design/tokens/`
- [ ] Layer-2 side-by-side reviewed and signed off

# Client · Provider profile

| | |
|---|---|
| **Artboard** | [`.design-src/Client_Provider.dc.html`](../../../.design-src/Client_Provider.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/provider/:id` |
| **Widget** | `lib/features/client/provider/presentation/provider_screen.dart` |
| **Build order** | client #6 |
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
position: relative
```

Per [Rule 1](../../03-RESPONSIVE-RULES.md): drop `width`, `height` and
`overflow`; keep the background; wrap in `SafeArea`.

## Layout tree

```
div { display:flex; flex-direction:column; width:390px; height:844px; background:#FFFFFF; position:relative; overflow:hidden }
  div { flex-shrink:0; height:170px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); position:relative }
    div { display:flex; align-items:center; justify-content:center; width:32px; height:32px; background:rgba(255,255,255,0.9); border-radius:50%; position:absolute; top:16px; left:16px }
      <svg>
  div { flex-shrink:0; padding:16px 18px 12px }
    div { display:flex; gap:6px; align-items:center }
      span.head { font-size:19px; font-weight:800; color:#6B3F3A }  "Patricia Glam Studio"
      <svg>
    div { display:flex; gap:6px; align-items:center }
      <svg>
      span { font-size:12.5px; color:#5B5B5B }  "5.0 · 142 reviews · Kololo, Kampala"
    div { display:flex; gap:5px; align-items:center }
      <svg>
      span { font-size:11px; font-weight:600; color:#2E8B57 }  "ID verified · Buyer protection when you pay in the app"
    div { display:flex; gap:5px; align-items:center }
      <svg>
      span { font-size:11px; font-weight:600; color:#3D8B85 }  "Offers mobile service · +5% travel fee"
  div { display:flex; flex-direction:column; flex-shrink:0; gap:8px; padding:0 18px 14px; border-bottom:1px solid #ECE7DC }
    div { display:flex; align-items:center; justify-content:space-between }
      span.head { font-size:12.5px; font-weight:700; color:#6B3F3A }  "Portfolio"
      span { font-size:11px; font-weight:600; color:#A66A5D }  "See all"
    div { display:flex; gap:8px; overflow:hidden }
      div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:72px; height:72px; background:linear-gradient(135deg,#F8EDEB,#FCD5CE); border-radius:10px }
        <svg>
      div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:72px; height:72px; background:linear-gradient(135deg,#F9DCC4,#FEC89A); border-radius:10px; position:relative }
        <svg>
        div { display:flex; align-items:center; justify-content:center; position:absolute }
          div { display:flex; align-items:center; justify-content:center; width:24px; height:24px; background:rgba(27,42,74,0.75); border-radius:50% }
            <svg>
      div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:72px; height:72px; background:linear-gradient(135deg,#FCD5CE,#FFB5A7); border-radius:10px }
        <svg>
      div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:72px; height:72px; background:linear-gradient(135deg,#F8EDEB,#FFB5A7); border-radius:10px }
        <svg>
    span { font-size:10.5px; color:#9A9A9A }  "Photos and videos from real Appointex bookings"
  div { display:flex; flex-shrink:0; gap:22px; padding:12px 18px 0; border-bottom:1px solid #ECE7DC }
    div { display:flex; flex-direction:column; gap:4px; align-items:center; border-bottom:2.5px solid #FFB5A7 }
      span { font-size:13px; font-weight:700; color:#6B3F3A }  "Services"
    div { display:flex; flex-direction:column; gap:4px; align-items:center }
      span { font-size:13px; font-weight:600; color:#9A9A9A }  "Reviews"
    div { display:flex; flex-direction:column; gap:4px; align-items:center }
      span { font-size:13px; font-weight:600; color:#9A9A9A }  "About"
  div { display:flex; flex-direction:column; flex:1; gap:12px; padding:14px 18px; overflow:hidden }
    div { display:flex; align-items:center; justify-content:space-between; padding:12px 0; border-bottom:1px solid #F1EEE6 }
      div { display:flex; flex-direction:column; gap:3px }
        span { font-size:14px; font-weight:700; color:#6B3F3A }  "Bridal makeup, full glam"
        span { font-size:12px; color:#8A8A8A }  "2 hr · UGX 180,000"
      div { display:flex; align-items:center; justify-content:center; width:26px; height:26px; background:#6B3F3A; border-radius:50% }
        <svg>
    div { display:flex; align-items:center; justify-content:space-between; padding:12px 0; border-bottom:1px solid #F1EEE6 }
      div { display:flex; flex-direction:column; gap:3px }
        span { font-size:14px; font-weight:700; color:#6B3F3A }  "Everyday glam"
        span { font-size:12px; color:#8A8A8A }  "45 min · UGX 60,000"
      div { display:flex; align-items:center; justify-content:center; width:26px; height:26px; background:#FFB5A7; border-radius:50% }
        <svg>
    div { display:flex; align-items:center; justify-content:space-between; padding:12px 0; border-bottom:1px solid #F1EEE6 }
      div { display:flex; flex-direction:column; gap:3px }
        span { font-size:14px; font-weight:700; color:#6B3F3A }  "Photoshoot makeup"
        span { font-size:12px; color:#8A8A8A }  "1 hr · UGX 90,000"
      div { display:flex; align-items:center; justify-content:center; width:26px; height:26px; background:#6B3F3A; border-radius:50% }
        <svg>
    div { display:flex; align-items:center; justify-content:space-between; padding:12px 0 }
      div { display:flex; flex-direction:column; gap:3px }
        span { font-size:14px; font-weight:700; color:#6B3F3A }  "Lashes add-on"
        span { font-size:12px; color:#8A8A8A }  "20 min · UGX 20,000"
      div { display:flex; align-items:center; justify-content:center; width:26px; height:26px; background:#6B3F3A; border-radius:50% }
        <svg>
  div { display:flex; flex-shrink:0; gap:14px; align-items:center; padding:14px 18px 22px; border-top:1px solid #ECE7DC }
    div { display:flex; flex-direction:column }
      span { font-size:11.5px; color:#8A8A8A }  "2 selected"
      span { font-size:14.5px; font-weight:800; color:#6B3F3A }  "UGX 150,000"
    div { display:flex; flex:1; align-items:center; justify-content:center; height:50px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); border-radius:25px }
      span { font-size:14.5px; font-weight:700; color:#6B3F3A }  "Continue"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/provider/data/fixtures.dart` verbatim.

- `Patricia Glam Studio`
- `5.0 · 142 reviews · Kololo, Kampala`
- `ID verified · Buyer protection when you pay in the app`
- `Offers mobile service · +5% travel fee`
- `Portfolio`
- `See all`
- `Photos and videos from real Appointex bookings`
- `Services`
- `Reviews`
- `About`
- `Bridal makeup, full glam`
- `2 hr · UGX 180,000`
- `Everyday glam`
- `45 min · UGX 60,000`
- `Photoshoot makeup`
- `1 hr · UGX 90,000`
- `Lashes add-on`
- `20 min · UGX 20,000`
- `2 selected`
- `UGX 150,000`
- `Continue`

## Tokens on this screen

**Colours** — #6B3F3A (16) · #FFB5A7 (10) · #FFFFFF (7) · #C15B6B (6) · #FEC89A (5) · #8A8A8A (5) · #2E8B57 (3) · #ECE7DC (3) · #FCD5CE (3) · #9A9A9A (3) · #F1EEE6 (3) · #A66A5D (2) · #3D8B85 (2) · #F8EDEB (2) · #D98B96 (2) · #5A3A33 (2) · #5B5B5B (1) · #C97A5D (1) · #9C6B7A (1) · #F9DCC4 (1) · #B37B4E (1)

**Font sizes** — 14px (4) · 12px (4) · 11px (3) · 13px (3) · 12.5px (2) · 14.5px (2) · 19px (1) · 10.5px (1) · 11.5px (1)

**Radii** — 10px (4) · 25px (1)

**Gradients**

- `linear-gradient(135deg,#FEC89A,#FFB5A7)`
- `linear-gradient(135deg,#F8EDEB,#FCD5CE)`
- `linear-gradient(135deg,#F9DCC4,#FEC89A)`
- `linear-gradient(135deg,#FCD5CE,#FFB5A7)`
- `linear-gradient(135deg,#F8EDEB,#FFB5A7)`

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

# Client · Plan an event

| | |
|---|---|
| **Artboard** | [`.design-src/Client_EventBundle.dc.html`](../../../.design-src/Client_EventBundle.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/event` |
| **Widget** | `lib/features/client/event_bundle/presentation/event_bundle_screen.dart` |
| **Build order** | client #8 |
| **Icons on screen** | 9 |

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
    span.head { font-size:16px; font-weight:700; color:#6B3F3A }  "Plan an event"
  div { display:flex; flex-direction:column; flex:1; gap:20px; padding:18px; overflow:hidden }
    div { display:flex; flex-direction:column; gap:10px }
      span { font-size:12.5px; color:#7A7A7A }  "One booking, the whole team, one checkout."
      div { display:flex; gap:8px; overflow:hidden }
        div.etype { background:#6B3F3A; color:#FFFFFF }  "Wedding"
        div.etype  "Kwanjula"
        div.etype  "Graduation"
        div.etype  "Photoshoot"
    div { display:flex; align-items:center; justify-content:space-between; padding:12px 14px; background:#F7F5F1; border-radius:12px }
      div { display:flex; gap:10px; align-items:center }
        <svg>
        span { font-size:13px; font-weight:600; color:#6B3F3A }  "Saturday, 12 September"
      span { font-size:12px; font-weight:700; color:#A66A5D }  "Change"
    div { display:flex; flex-direction:column; gap:10px }
      span.head { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Your event team"
      div { display:flex; gap:12px; align-items:center; padding:12px; border:1px solid #ECE7DC; border-radius:12px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:38px; height:38px; background:linear-gradient(135deg,#F8EDEB,#FFB5A7); border-radius:10px }
          <svg>
        div { display:flex; flex-direction:column; flex:1; gap:2px }
          span { font-size:13px; font-weight:700; color:#6B3F3A }  "Hair · Grace Nabbosa"
          span { font-size:11.5px; color:#8A8A8A }  "9:00 am · UGX 120,000"
        <svg>
      div { display:flex; gap:12px; align-items:center; padding:12px; border:1px solid #ECE7DC; border-radius:12px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:38px; height:38px; background:linear-gradient(135deg,#F8EDEB,#FCD5CE); border-radius:10px }
          <svg>
        div { display:flex; flex-direction:column; flex:1; gap:2px }
          span { font-size:13px; font-weight:700; color:#6B3F3A }  "Makeup · Patricia Glam Studio"
          span { font-size:11.5px; color:#8A8A8A }  "10:30 am · UGX 180,000"
        <svg>
      div { display:flex; gap:12px; align-items:center; padding:12px; border:1px solid #ECE7DC; border-radius:12px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:38px; height:38px; background:linear-gradient(135deg,#F9DCC4,#FEC89A); border-radius:10px }
          <svg>
        div { display:flex; flex-direction:column; flex:1; gap:2px }
          span { font-size:13px; font-weight:700; color:#6B3F3A }  "Photography · Kato Visuals"
          span { font-size:11.5px; color:#8A8A8A }  "1:00 pm · UGX 350,000"
        <svg>
      div { display:flex; gap:10px; align-items:center; padding:13px; border:1.5px dashed #D7D1C2; border-radius:12px }
        <svg>
        span { font-size:12.5px; font-weight:600; color:#A66A5D }  "Add another service"
  div { display:flex; flex-shrink:0; gap:14px; align-items:center; padding:14px 18px 22px; border-top:1px solid #ECE7DC }
    div { display:flex; flex-direction:column }
      span { font-size:11.5px; color:#8A8A8A }  "3 providers"
      span { font-size:14.5px; font-weight:800; color:#6B3F3A }  "UGX 650,000"
    div { display:flex; flex:1; align-items:center; justify-content:center; height:50px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); border-radius:25px }
      span { font-size:14.5px; font-weight:700; color:#6B3F3A }  "Review & pay"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/event_bundle/data/fixtures.dart` verbatim.

- `Plan an event`
- `One booking, the whole team, one checkout.`
- `Wedding`
- `Kwanjula`
- `Graduation`
- `Photoshoot`
- `Saturday, 12 September`
- `Change`
- `Your event team`
- `Hair · Grace Nabbosa`
- `9:00 am · UGX 120,000`
- `Makeup · Patricia Glam Studio`
- `10:30 am · UGX 180,000`
- `Photography · Kato Visuals`
- `1:00 pm · UGX 350,000`
- `Add another service`
- `3 providers`
- `UGX 650,000`
- `Review & pay`

## Tokens on this screen

**Colours** — #6B3F3A (15) · #ECE7DC (5) · #FEC89A (5) · #8A8A8A (4) · #C15B6B (4) · #A66A5D (3) · #FFB5A7 (3) · #C97A5D (3) · #2E8B57 (3) · #FFFFFF (2) · #F8EDEB (2) · #5A3A33 (2) · #E0DBCF (1) · #3A3A3A (1) · #7A7A7A (1) · #F7F5F1 (1) · #FCD5CE (1) · #F9DCC4 (1) · #D7D1C2 (1)

**Font sizes** — 13px (4) · 11.5px (4) · 12px (2) · 12.5px (2) · 14.5px (2) · 16px (1) · 13.5px (1)

**Radii** — 12px (5) · 10px (3) · 16px (1) · 25px (1)

**Gradients**

- `linear-gradient(135deg,#F8EDEB,#FFB5A7)`
- `linear-gradient(135deg,#F8EDEB,#FCD5CE)`
- `linear-gradient(135deg,#F9DCC4,#FEC89A)`
- `linear-gradient(135deg,#FEC89A,#FFB5A7)`

## Artboard-local CSS classes

`.etype`

```css
font-size:12px; font-weight:600; padding:8px 14px; border-radius:16px; border:1px solid #E0DBCF; color:#3A3A3A; white-space:nowrap;
```


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

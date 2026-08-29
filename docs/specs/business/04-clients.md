# Business · Clients

| | |
|---|---|
| **Artboard** | [`.design-src/Biz_Clients.dc.html`](../../../.design-src/Biz_Clients.dc.html) |
| **Reference size** | 1160 × 760 |
| **Route** | `/biz/clients` |
| **Widget** | `lib/features/business/clients/presentation/clients_screen.dart` |
| **Build order** | business #4 |
| **Icons on screen** | 14 |

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
    div.navrow { background:#FFB5A7 }
      <svg>
      span { font-size:13px; font-weight:700; color:#6B3F3A }  "Clients"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Earnings"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Services"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Featured Spots"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Settings"
  div { display:flex; flex-direction:column; flex:1; gap:18px; padding:26px 32px; overflow:hidden }
    div { display:flex; align-items:center; justify-content:space-between }
      span.head { font-size:20px; font-weight:800; color:#6B3F3A }  "Clients"
      div { display:flex; gap:8px; align-items:center; width:280px; height:40px; padding:0 14px; background:#FFFFFF; border:1px solid #E0DBCF; border-radius:9px }
        <svg>
        span { font-size:12.5px; color:#9A9A9A }  "Search clients"
    div { display:flex; flex-direction:column; flex:1; padding:6px 22px; background:#FFFFFF; border:1px solid #ECE7DC; border-radius:14px; overflow:hidden }
      div.row { border-bottom:1px solid #E8E3D8 }
        span.th { flex:1.6 }  "Client"
        span.th { flex:1 }  "Last visit"
        span.th { flex:0.8; text-align:center }  "Visits"
        span.th { flex:1 }  "Total spend"
        span.th { flex:1.4 }  "Favourite service"
      div.row
        div { display:flex; flex:1.6; gap:10px; align-items:center }
          div { display:flex; align-items:center; justify-content:center; width:32px; height:32px; background:linear-gradient(135deg,#F8EDEB,#FFB5A7); border-radius:50% }
            <svg>
          span { font-size:13px; font-weight:700; color:#6B3F3A }  "Aisha Kirabo"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "26 Aug 2026"
        span { flex:0.8; font-size:12.5px; color:#5B5B5B; text-align:center }  "7"
        span { flex:1; font-size:12.5px; font-weight:700; color:#6B3F3A }  "UGX 980,000"
        span { flex:1.4; font-size:12.5px; color:#5B5B5B }  "Everyday glam"
      div.row
        div { display:flex; flex:1.6; gap:10px; align-items:center }
          div { display:flex; align-items:center; justify-content:center; width:32px; height:32px; background:linear-gradient(135deg,#F8EDEB,#FCD5CE); border-radius:50% }
            <svg>
          span { font-size:13px; font-weight:700; color:#6B3F3A }  "Diana Nansubuga"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "26 Aug 2026"
        span { flex:0.8; font-size:12.5px; color:#5B5B5B; text-align:center }  "2"
        span { flex:1; font-size:12.5px; font-weight:700; color:#6B3F3A }  "UGX 410,000"
        span { flex:1.4; font-size:12.5px; color:#5B5B5B }  "Bridal makeup, full glam"
      div.row
        div { display:flex; flex:1.6; gap:10px; align-items:center }
          div { display:flex; align-items:center; justify-content:center; width:32px; height:32px; background:linear-gradient(135deg,#F9DCC4,#FEC89A); border-radius:50% }
            <svg>
          span { font-size:13px; font-weight:700; color:#6B3F3A }  "Ruth Mirembe"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "26 Aug 2026"
        span { flex:0.8; font-size:12.5px; color:#5B5B5B; text-align:center }  "4"
        span { flex:1; font-size:12.5px; font-weight:700; color:#6B3F3A }  "UGX 640,000"
        span { flex:1.4; font-size:12.5px; color:#5B5B5B }  "Photoshoot makeup"
      div.row
        div { display:flex; flex:1.6; gap:10px; align-items:center }
          div { display:flex; align-items:center; justify-content:center; width:32px; height:32px; background:linear-gradient(135deg,#FCD5CE,#FFB5A7); border-radius:50% }
            <svg>
          span { font-size:13px; font-weight:700; color:#6B3F3A }  "Fiona Tumusiime"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "21 Aug 2026"
        span { flex:0.8; font-size:12.5px; color:#5B5B5B; text-align:center }  "11"
        span { flex:1; font-size:12.5px; font-weight:700; color:#6B3F3A }  "UGX 1,540,000"
        span { flex:1.4; font-size:12.5px; color:#5B5B5B }  "Everyday glam"
      div.row { border-bottom:none }
        div { display:flex; flex:1.6; gap:10px; align-items:center }
          div { display:flex; align-items:center; justify-content:center; width:32px; height:32px; background:linear-gradient(135deg,#F9DCC4,#FCD5CE); border-radius:50% }
            <svg>
          span { font-size:13px; font-weight:700; color:#6B3F3A }  "Grace Namono"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "29 Aug 2026"
        span { flex:0.8; font-size:12.5px; color:#5B5B5B; text-align:center }  "1"
        span { flex:1; font-size:12.5px; font-weight:700; color:#6B3F3A }  "UGX 350,000"
        span { flex:1.4; font-size:12.5px; color:#5B5B5B }  "Wedding party glam"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/business/clients/data/fixtures.dart` verbatim.

- `Appointex`
- `FOR BUSINESS`
- `Dashboard`
- `Calendar`
- `Clients`
- `Earnings`
- `Services`
- `Featured Spots`
- `Settings`
- `Clients`
- `Search clients`
- `Client`
- `Last visit`
- `Visits`
- `Total spend`
- `Favourite service`
- `Aisha Kirabo`
- `26 Aug 2026`
- `7`
- `UGX 980,000`
- `Everyday glam`
- `Diana Nansubuga`
- `26 Aug 2026`
- `2`
- `UGX 410,000`
- `Bridal makeup, full glam`
- `Ruth Mirembe`
- `26 Aug 2026`
- `4`
- `UGX 640,000`
- `Photoshoot makeup`
- `Fiona Tumusiime`
- `21 Aug 2026`
- `11`
- `UGX 1,540,000`
- `Everyday glam`
- `Grace Namono`
- `29 Aug 2026`
- `1`
- `UGX 350,000`
- `Wedding party glam`

## Tokens on this screen

**Colours** — #FFFFFF (18) · #6B3F3A (15) · #5B5B5B (15) · #C9A79D (12) · #9A9A9A (3) · #F8EDEB (3) · #FFB5A7 (3) · #FCD5CE (3) · #A66A5D (2) · #FEC89A (2) · #F9DCC4 (2) · #F1EEE6 (1) · #FBFAF7 (1) · #E0DBCF (1) · #ECE7DC (1) · #E8E3D8 (1)

**Font sizes** — 12.5px (21) · 13px (13) · 11px (1) · 9.5px (1) · 20px (1)

**Radii** — 9px (2) · 8px (1) · 14px (1)

**Gradients**

- `linear-gradient(135deg,#6B3F3A,#A66A5D)`
- `linear-gradient(135deg,#F8EDEB,#FFB5A7)`
- `linear-gradient(135deg,#F8EDEB,#FCD5CE)`
- `linear-gradient(135deg,#F9DCC4,#FEC89A)`
- `linear-gradient(135deg,#FCD5CE,#FFB5A7)`
- `linear-gradient(135deg,#F9DCC4,#FCD5CE)`

## Artboard-local CSS classes

`.navrow`

```css
display:flex; align-items:center; gap:11px; padding:10px 16px; border-radius:9px;
```

`.row`

```css
display:flex; align-items:center; gap:14px; padding:13px 6px; border-bottom:1px solid #F1EEE6;
```

`.th`

```css
font-size:11px; font-weight:700; color:#9A9A9A; text-transform:uppercase; letter-spacing:0.03em;
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

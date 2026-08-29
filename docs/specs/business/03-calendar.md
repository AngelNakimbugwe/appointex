# Business · Calendar

| | |
|---|---|
| **Artboard** | [`.design-src/Biz_Calendar.dc.html`](../../../.design-src/Biz_Calendar.dc.html) |
| **Reference size** | 1160 × 760 |
| **Route** | `/biz/calendar` |
| **Widget** | `lib/features/business/calendar/presentation/calendar_screen.dart` |
| **Build order** | business #3 |
| **Icons on screen** | 10 |

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
    div.navrow { background:#FFB5A7 }
      <svg>
      span { font-size:13px; font-weight:700; color:#6B3F3A }  "Calendar"
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
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Settings"
  div { display:flex; flex-direction:column; flex:1; gap:18px; padding:26px 32px; overflow:hidden }
    div { display:flex; align-items:center; justify-content:space-between }
      span.head { font-size:20px; font-weight:800; color:#6B3F3A }  "Calendar"
      div { display:flex; gap:14px; align-items:center }
        div { display:flex; gap:10px; align-items:center }
          <svg>
          span { font-size:13px; font-weight:700; color:#6B3F3A }  "24 to 30 August"
          <svg>
        div { display:flex; align-items:center; height:38px; padding:0 16px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); border-radius:19px }
          span { font-size:12.5px; font-weight:700; color:#6B3F3A }  "+ Make an appointment"
    div { display:flex; flex:1; gap:0; padding:16px 12px; background:#FFFFFF; border:1px solid #ECE7DC; border-radius:14px; overflow:hidden }
      div.daycol { border-left:none }
        span { font-size:11px; font-weight:700; color:#9A9A9A; text-align:center }  "MON 24"
        div.appt { background:#EAF3EC }
          span { font-size:10.5px; font-weight:700; color:#2E8B57 }  "9:00"
          span { font-size:10.5px; color:#2E8B57 }  "Aisha K."
      div.daycol
        span { font-size:11px; font-weight:700; color:#9A9A9A; text-align:center }  "TUE 25"
      div.daycol
        span.head { padding:2px 0; background:#F7F5F1; border-radius:6px; font-size:11px; font-weight:800; color:#6B3F3A; text-align:center }  "WED 26"
        div.appt { background:#EAF3EC }
          span { font-size:10.5px; font-weight:700; color:#2E8B57 }  "9:00"
          span { font-size:10.5px; color:#2E8B57 }  "Aisha K."
        div.appt { background:#EAF3EC }
          span { font-size:10.5px; font-weight:700; color:#2E8B57 }  "12:00"
          span { font-size:10.5px; color:#2E8B57 }  "Diana N."
        div.appt { background:#FBF3E7 }
          span { font-size:10.5px; font-weight:700; color:#9A6B1E }  "3:30"
          span { font-size:10.5px; color:#9A6B1E }  "Ruth M. · pending"
      div.daycol
        span { font-size:11px; font-weight:700; color:#9A9A9A; text-align:center }  "THU 27"
        div.appt { background:#EAF3EC }
          span { font-size:10.5px; font-weight:700; color:#2E8B57 }  "2:00"
          span { font-size:10.5px; color:#2E8B57 }  "Fiona T."
      div.daycol
        span { font-size:11px; font-weight:700; color:#9A9A9A; text-align:center }  "FRI 28"
      div.daycol
        span { font-size:11px; font-weight:700; color:#9A9A9A; text-align:center }  "SAT 29"
        div.appt { background:#6B3F3A }
          span { font-size:10.5px; font-weight:700; color:#FEC89A }  "9:00"
          span { font-size:10.5px; color:#FFFFFF }  "Wedding: Namono"
      div.daycol
        span { font-size:11px; font-weight:700; color:#9A9A9A; text-align:center }  "SUN 30"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/business/calendar/data/fixtures.dart` verbatim.

- `Appointex`
- `FOR BUSINESS`
- `Dashboard`
- `Calendar`
- `Clients`
- `Earnings`
- `Services`
- `Featured Spots`
- `Settings`
- `Calendar`
- `24 to 30 August`
- `+ Make an appointment`
- `MON 24`
- `9:00`
- `Aisha K.`
- `TUE 25`
- `WED 26`
- `9:00`
- `Aisha K.`
- `12:00`
- `Diana N.`
- `3:30`
- `Ruth M. · pending`
- `THU 27`
- `2:00`
- `Fiona T.`
- `FRI 28`
- `SAT 29`
- `9:00`
- `Wedding: Namono`
- `SUN 30`

## Tokens on this screen

**Colours** — #C9A79D (12) · #6B3F3A (11) · #FFFFFF (8) · #2E8B57 (8) · #9A9A9A (6) · #EAF3EC (4) · #FEC89A (3) · #A66A5D (2) · #FFB5A7 (2) · #9A6B1E (2) · #F1EEE6 (1) · #FBFAF7 (1) · #F8EDEB (1) · #ECE7DC (1) · #F7F5F1 (1) · #FBF3E7 (1)

**Font sizes** — 10.5px (12) · 13px (9) · 11px (7) · 9.5px (1) · 20px (1) · 12.5px (1)

**Radii** — 8px (2) · 9px (1) · 19px (1) · 14px (1) · 6px (1)

**Gradients**

- `linear-gradient(135deg,#6B3F3A,#A66A5D)`
- `linear-gradient(135deg,#FEC89A,#FFB5A7)`

## Artboard-local CSS classes

`.navrow`

```css
display:flex; align-items:center; gap:11px; padding:10px 16px; border-radius:9px;
```

`.daycol`

```css
flex:1; display:flex; flex-direction:column; gap:8px; border-left:1px solid #F1EEE6; padding:0 8px;
```

`.appt`

```css
border-radius:8px; padding:7px 9px; display:flex; flex-direction:column; gap:2px;
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

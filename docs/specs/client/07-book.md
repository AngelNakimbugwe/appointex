# Client · Book service

| | |
|---|---|
| **Artboard** | [`.design-src/Client_Book.dc.html`](../../../.design-src/Client_Book.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/provider/:id/book` |
| **Widget** | `lib/features/client/book/presentation/book_screen.dart` |
| **Build order** | client #7 |
| **Icons on screen** | 7 |

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
    span.head { flex:1; font-size:16px; font-weight:700; color:#6B3F3A }  "Make an appointment"
    div { display:flex; gap:4px; align-items:center; padding:5px 9px; background:#FFF3EF; border-radius:10px }
      <svg>
      span { font-size:10px; font-weight:800; color:#E8433D }  "+25% rush"
  div { display:flex; flex-direction:column; flex:1; gap:13px; padding:16px 18px; overflow:hidden }
    div { display:flex; flex-direction:column; gap:7px }
      span.head { font-size:12.5px; font-weight:700; color:#6B3F3A }  "Where would you like this?"
      div { display:flex; gap:9px }
        div { display:flex; flex-direction:column; flex:1; gap:3px; align-items:center; padding:9px 6px; border:1px solid #E0DBCF; border-radius:12px }
          <svg>
          span { font-size:11px; font-weight:600; color:#5B5B5B }  "At the salon"
        div { display:flex; flex-direction:column; flex:1; gap:3px; align-items:center; padding:9px 6px; background:#EAF4F3; border:2px solid #3D8B85; border-radius:12px }
          <svg>
          span { font-size:11px; font-weight:700; color:#3D8B85 }  "At my location"
          span { font-size:9px; font-weight:700; color:#3D8B85 }  "+5% mobile fee"
    div { display:flex; flex-direction:column; gap:7px }
      div { display:flex; align-items:center; justify-content:space-between }
        <svg>
        span.head { font-size:13.5px; font-weight:700; color:#6B3F3A }  "August 2026"
        <svg>
      div { display:grid; grid-template-columns:repeat(7, 1fr); gap:3px }
        span.wk  "S"
        span.wk  "M"
        span.wk  "T"
        span.wk  "W"
        span.wk  "T"
        span.wk  "F"
        span.wk  "S"
      div { display:grid; grid-template-columns:repeat(7, 1fr); gap:3px }
        div.cell
        div.cell
        div.cell
        div.cell
        div.cell
        div.cell
        div.cell
          span.daynum  "1"
        div.cell
          span.daynum  "2"
        div.cell
          span.daynum  "3"
        div.cell
          span.daynum  "4"
        div.cell
          span.daynum  "5"
        div.cell
          span.daynum  "6"
        div.cell
          span.daynum  "7"
        div.cell
          span.daynum  "8"
        div.cell
          span.daynum  "9"
        div.cell
          span.daynum  "10"
        div.cell
          span.daynum  "11"
        div.cell
          span.daynum  "12"
        div.cell
          span.daynum  "13"
        div.cell
          span.daynum  "14"
        div.cell
          span.daynum  "15"
        div.cell
          span.daynum  "16"
        div.cell
          span.daynum  "17"
        div.cell
          span.daynum  "18"
        div.cell
          span.daynum  "19"
        div.cell { background:#F0EEE9; border-radius:50% }
          span.daynum { color:#C7C2B6 }  "20"
        div.cell
          span.daynum  "21"
        div.cell
          span.daynum  "22"
        div.cell
          span.daynum  "23"
        div.cell
          span.daynum  "24"
          span { width:4px; height:4px; background:#FFB5A7; border-radius:50% }
        div.cell
          span.daynum  "25"
        div.cell { background:#6B3F3A; border-radius:50% }
          span.daynum { font-weight:800; color:#FFFFFF }  "26"
        div.cell
          span.daynum  "27"
          span { width:4px; height:4px; background:#FFB5A7; border-radius:50% }
        div.cell
          span.daynum  "28"
        div.cell { background:#F0EEE9; border-radius:50% }
          span.daynum { color:#C7C2B6 }  "29"
        div.cell
          span.daynum  "30"
        div.cell
          span.daynum  "31"
        div.cell
        div.cell
        div.cell
        div.cell
        div.cell
      div { display:flex; gap:14px; align-items:center }
        div { display:flex; gap:5px; align-items:center }
          div { width:7px; height:7px; background:#FFB5A7; border-radius:50% }
          span { font-size:10px; color:#8A8A8A }  "Some booked"
        div { display:flex; gap:5px; align-items:center }
          div { width:7px; height:7px; background:linear-gradient(135deg,#F8EDEB,#FFB5A7); border-radius:50% }
          span { font-size:10px; color:#8A8A8A }  "Fully booked"
        div { display:flex; gap:5px; align-items:center }
          div { width:7px; height:7px; background:#6B3F3A; border-radius:50% }
          span { font-size:10px; color:#8A8A8A }  "Selected"
    div { display:flex; flex-direction:column; gap:7px }
      span.head { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Available times, Wed 26 Aug"
      div { display:grid; grid-template-columns:repeat(3, minmax(0,1fr)); gap:8px }
        div { padding:11px 0; border:1px solid #E0DBCF; border-radius:18px; font-size:12.5px; font-weight:600; color:#3A3A3A; text-align:center }  "9:00 am"
        div { padding:11px 0; border:1px solid #E0DBCF; border-radius:18px; font-size:12.5px; font-weight:600; color:#3A3A3A; text-align:center }  "10:30 am"
        div { padding:11px 0; background:#FFB5A7; border-radius:18px; font-size:12.5px; font-weight:700; color:#6B3F3A; text-align:center }  "12:00 pm"
        div { padding:11px 0; border:1px solid #E0DBCF; border-radius:18px; font-size:12.5px; font-weight:600; color:#3A3A3A; text-align:center }  "1:30 pm"
        div { padding:11px 0; border:1px solid #E0DBCF; border-radius:18px; font-size:12.5px; font-weight:600; color:#C7C2B6; text-align:center }  "3:00 pm"
        div { padding:11px 0; border:1px solid #E0DBCF; border-radius:18px; font-size:12.5px; font-weight:600; color:#3A3A3A; text-align:center }  "4:30 pm"
    div { display:flex; flex-direction:column; gap:9px; padding:14px; background:#F7F5F1; border-radius:14px }
      span { font-size:11.5px; font-weight:700; color:#9A9A9A; letter-spacing:0.04em; text-transform:uppercase }  "Appointment summary"
      div { display:flex; justify-content:space-between }
        span { font-size:13px; color:#3A3A3A }  "Bridal makeup, full glam"
        span { font-size:13px; font-weight:700; color:#6B3F3A }  "UGX 180,000"
      div { display:flex; justify-content:space-between }
        span { font-size:12px; color:#8A8A8A }  "Patricia Glam Studio · Wed 26 Aug, 12:00 pm"
      div { display:flex; gap:4px; align-items:center }
        <svg>
        span { font-size:11.5px; font-weight:600; color:#3D8B85 }  "At my location · +5% mobile fee"
  div { flex-shrink:0; padding:14px 18px 22px; border-top:1px solid #ECE7DC }
    div { display:flex; align-items:center; justify-content:center; height:50px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); border-radius:25px }
      span { font-size:14.5px; font-weight:700; color:#6B3F3A }  "Continue to checkout"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/book/data/fixtures.dart` verbatim.

- `Make an appointment`
- `+25% rush`
- `Where would you like this?`
- `At the salon`
- `At my location`
- `+5% mobile fee`
- `August 2026`
- `S`
- `M`
- `T`
- `W`
- `T`
- `F`
- `S`
- `1`
- `2`
- `3`
- `4`
- `5`
- `6`
- `7`
- `8`
- `9`
- `10`
- `11`
- `12`
- `13`
- `14`
- `15`
- `16`
- `17`
- `18`
- `19`
- `20`
- `21`
- `22`
- `23`
- `24`
- `25`
- `26`
- `27`
- `28`
- `29`
- `30`
- `31`
- `Some booked`
- `Fully booked`
- `Selected`
- `Available times, Wed 26 Aug`
- `9:00 am`
- `10:30 am`
- `12:00 pm`
- `1:30 pm`
- `3:00 pm`
- `4:30 pm`
- `Appointment summary`
- `Bridal makeup, full glam`
- `UGX 180,000`
- `Patricia Glam Studio · Wed 26 Aug, 12:00 pm`
- `At my location · +5% mobile fee`
- `Continue to checkout`

## Tokens on this screen

**Colours** — #6B3F3A (12) · #3A3A3A (6) · #E0DBCF (6) · #3D8B85 (6) · #FFB5A7 (6) · #8A8A8A (5) · #C7C2B6 (3) · #9A9A9A (2) · #FFFFFF (2) · #ECE7DC (2) · #E8433D (2) · #F0EEE9 (2) · #FFF3EF (1) · #5B5B5B (1) · #EAF4F3 (1) · #F8EDEB (1) · #F7F5F1 (1) · #FEC89A (1)

**Font sizes** — 12.5px (7) · 10px (5) · 12px (2) · 11px (2) · 13.5px (2) · 11.5px (2) · 13px (2) · 16px (1) · 9px (1) · 14.5px (1)

**Radii** — 18px (6) · 12px (2) · 10px (1) · 14px (1) · 25px (1)

**Gradients**

- `linear-gradient(135deg,#F8EDEB,#FFB5A7)`
- `linear-gradient(135deg,#FEC89A,#FFB5A7)`

## Artboard-local CSS classes

`.daynum`

```css
font-size:12px; font-weight:600; color:#3A3A3A;
```

`.cell`

```css
aspect-ratio:1; display:flex; flex-direction:column; align-items:center; justify-content:center; gap:2px;
```

`.wk`

```css
font-size:10px; font-weight:700; color:#9A9A9A; text-align:center;
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

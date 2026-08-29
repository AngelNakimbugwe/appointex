# Business · Dashboard home

| | |
|---|---|
| **Artboard** | [`.design-src/Biz_Dashboard.dc.html`](../../../.design-src/Biz_Dashboard.dc.html) |
| **Reference size** | 1160 × 760 |
| **Route** | `/biz/dashboard` |
| **Widget** | `lib/features/business/dashboard/presentation/dashboard_screen.dart` |
| **Build order** | business #2 |
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
    div.navrow { background:#FFB5A7 }
      <svg>
      span { font-size:13px; font-weight:700; color:#6B3F3A }  "Dashboard"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Calendar"
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
  div { display:flex; flex-direction:column; flex:1; gap:22px; padding:26px 32px; overflow:hidden }
    div { display:flex; align-items:center; justify-content:space-between }
      div { display:flex; flex-direction:column; gap:3px }
        span.head { font-size:20px; font-weight:800; color:#6B3F3A }  "Good morning, Patricia"
        span { font-size:12.5px; color:#8A8A8A }  "Wednesday, 26 August"
      <svg>
    div { display:flex; gap:16px }
      div.stat
        span { font-size:11.5px; color:#8A8A8A }  "Today's bookings"
        span.head { font-size:24px; font-weight:800; color:#6B3F3A }  "6"
      div.stat
        span { font-size:11.5px; color:#8A8A8A }  "Today's takings"
        span.head { font-size:24px; font-weight:800; color:#6B3F3A }  "UGX 410K"
      div.stat
        span { font-size:11.5px; color:#8A8A8A }  "Held, pending payout"
        span.head { font-size:24px; font-weight:800; color:#6B3F3A }  "UGX 96K"
      div.stat
        span { font-size:11.5px; color:#8A8A8A }  "Rating"
        span.head { font-size:24px; font-weight:800; color:#6B3F3A }  "5.0 ★"
    div { display:flex; flex:1; gap:20px; overflow:hidden }
      div { display:flex; flex-direction:column; flex:1.4; gap:12px; padding:18px 20px; background:#FFFFFF; border:1px solid #ECE7DC; border-radius:14px }
        span.head { font-size:14px; font-weight:700; color:#6B3F3A }  "Today's schedule"
        div { display:flex; gap:14px; align-items:center; padding:11px 0; border-bottom:1px solid #F1EEE6 }
          span { width:56px; font-size:12px; font-weight:700; color:#A66A5D }  "9:00 am"
          div { display:flex; flex-direction:column; flex:1 }
            span { font-size:13px; font-weight:600; color:#6B3F3A }  "Aisha K."
            span { font-size:11.5px; color:#8A8A8A }  "Everyday glam"
          span { font-size:11px; font-weight:700; color:#2E8B57 }  "Confirmed"
        div { display:flex; gap:14px; align-items:center; padding:11px 0; border-bottom:1px solid #F1EEE6 }
          span { width:56px; font-size:12px; font-weight:700; color:#A66A5D }  "12:00 pm"
          div { display:flex; flex-direction:column; flex:1 }
            span { font-size:13px; font-weight:600; color:#6B3F3A }  "Diana N."
            span { font-size:11.5px; color:#8A8A8A }  "Bridal makeup, full glam"
          span { font-size:11px; font-weight:700; color:#2E8B57 }  "Confirmed"
        div { display:flex; gap:14px; align-items:center; padding:11px 0 }
          span { width:56px; font-size:12px; font-weight:700; color:#A66A5D }  "3:30 pm"
          div { display:flex; flex-direction:column; flex:1 }
            span { font-size:13px; font-weight:600; color:#6B3F3A }  "Ruth M."
            span { font-size:11.5px; color:#8A8A8A }  "Photoshoot makeup"
          span { font-size:11px; font-weight:700; color:#A66A5D }  "Pending"
      div { display:flex; flex-direction:column; flex:1; gap:12px; padding:18px 20px; background:#FFFFFF; border:1px solid #ECE7DC; border-radius:14px }
        span.head { font-size:14px; font-weight:700; color:#6B3F3A }  "Recent reviews"
        div { display:flex; flex-direction:column; gap:4px }
          div { display:flex; gap:2px }
            <svg>
            <svg>
            <svg>
            <svg>
            <svg>
          span { font-size:12px; color:#5B5B5B; line-height:1.5 }  "&ldquo;Patricia made me look and feel amazing on my big day.&rdquo;"
          span { font-size:11px; color:#9A9A9A }  "— Diana N."
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/business/dashboard/data/fixtures.dart` verbatim.

- `Appointex`
- `FOR BUSINESS`
- `Dashboard`
- `Calendar`
- `Clients`
- `Earnings`
- `Services`
- `Featured Spots`
- `Settings`
- `Good morning, Patricia`
- `Wednesday, 26 August`
- `Today's bookings`
- `6`
- `Today's takings`
- `UGX 410K`
- `Held, pending payout`
- `UGX 96K`
- `Rating`
- `5.0 ★`
- `Today's schedule`
- `9:00 am`
- `Aisha K.`
- `Everyday glam`
- `Confirmed`
- `12:00 pm`
- `Diana N.`
- `Bridal makeup, full glam`
- `Confirmed`
- `3:30 pm`
- `Ruth M.`
- `Photoshoot makeup`
- `Pending`
- `Recent reviews`
- `&ldquo;Patricia made me look and feel amazing on my big day.&rdquo;`
- `— Diana N.`

## Tokens on this screen

**Colours** — #6B3F3A (15) · #A66A5D (12) · #C9A79D (12) · #FFFFFF (9) · #8A8A8A (8) · #FFB5A7 (4) · #ECE7DC (3) · #FEC89A (2) · #F1EEE6 (2) · #2E8B57 (2) · #FBFAF7 (1) · #F8EDEB (1) · #5B5B5B (1) · #9A9A9A (1)

**Font sizes** — 13px (11) · 11.5px (7) · 24px (4) · 12px (4) · 11px (4) · 14px (2) · 9.5px (1) · 20px (1) · 12.5px (1)

**Radii** — 14px (3) · 9px (1) · 8px (1)

**Gradients**

- `linear-gradient(135deg,#6B3F3A,#A66A5D)`

## Artboard-local CSS classes

`.navrow`

```css
display:flex; align-items:center; gap:11px; padding:10px 16px; border-radius:9px;
```

`.stat`

```css
flex:1; background:#FFFFFF; border:1px solid #ECE7DC; border-top:3px solid #FFB5A7; border-radius:14px; padding:16px 18px; display:flex; flex-direction:column; gap:6px;
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

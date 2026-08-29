# Client · Home

| | |
|---|---|
| **Artboard** | [`.design-src/Client_Home.dc.html`](../../../.design-src/Client_Home.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/home` |
| **Widget** | `lib/features/client/home/presentation/home_screen.dart` |
| **Build order** | client #3 |
| **Icons on screen** | 21 |

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
  div { display:flex; flex-shrink:0; align-items:center; justify-content:space-between; padding:20px 20px 14px }
    div { display:flex; flex-direction:column }
      span { font-size:12px; color:#8A8A8A }  "Good morning"
      span.head { font-size:17px; font-weight:700; color:#6B3F3A }  "Where to today?"
    div { display:flex; gap:10px; align-items:center }
      div { display:flex; gap:4px; align-items:center; padding:7px 12px; background:#F7F5F1; border-radius:20px; font-size:12.5px; font-weight:600; color:#6B3F3A }  "Kampala"
        <svg>
      <svg>
  div { flex-shrink:0; padding:0 20px 18px }
    div { display:flex; gap:10px; align-items:center; padding:12px 14px; background:#F7F5F1; border-radius:12px }
      <svg>
      span { font-size:13.5px; color:#9A9A9A }  "Search stylists, makeup artists, spas…"
  div { display:flex; flex-direction:column; flex:1; gap:22px; padding:0 20px; overflow:hidden }
    div { display:flex; flex-direction:column; gap:8px }
      div { display:flex; gap:12px; overflow:hidden }
        div { display:flex; flex-shrink:0; align-items:center; width:300px; height:112px; padding:0 20px; background:#6B3F3A; border-radius:16px; position:relative; overflow:hidden }
          span { padding:2px 7px; background:#FFB5A7; border-radius:6px; position:absolute; top:10px; right:12px; font-size:8.5px; font-weight:800; color:#6B3F3A; letter-spacing:0.03em }  "AD"
          div { width:140px; height:140px; background:#FFB5A7; border-radius:50%; position:absolute; top:-40px; right:-50px; opacity:0.15 }
          div { display:flex; gap:12px; align-items:center }
            div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:44px; height:44px; background:linear-gradient(135deg,#F8EDEB,#FFB5A7); border-radius:10px }
              <svg>
            div { display:flex; flex-direction:column; gap:4px }
              span.head { font-size:14.5px; font-weight:800; color:#FFFFFF; line-height:1.3 }  "Grace Nabbosa Braids"
              span { font-size:11.5px; color:#FEC89A }  "20% off box braids this week"
              span { font-size:11px; font-weight:700; color:#FEC89A }  "Book now →"
        div { flex-shrink:0; width:40px; height:112px; background:#FFB5A7; border-radius:16px; opacity:0.35 }
      div { display:flex; gap:6px; justify-content:center }
        div { width:16px; height:6px; background:#6B3F3A; border-radius:3px }
        div { width:6px; height:6px; background:#D7D1C2; border-radius:3px }
        div { width:6px; height:6px; background:#D7D1C2; border-radius:3px }
    div { display:flex; flex-direction:column; gap:10px }
      span.head { font-size:14.5px; font-weight:700; color:#6B3F3A }  "Browse by category"
      div { display:grid; grid-template-columns:repeat(3, minmax(0,1fr)); gap:10px }
        div { display:flex; flex-direction:column; gap:6px; align-items:center; padding:14px 6px; background:#F9DCC4; border-radius:14px }
          <svg>
          span { font-size:11.5px; font-weight:700; color:#B3654A }  "Hair"
        div { display:flex; flex-direction:column; gap:6px; align-items:center; padding:14px 6px; background:#FEC89A; border-radius:14px }
          <svg>
          span { font-size:11.5px; font-weight:700; color:#A84658 }  "Makeup"
        div { display:flex; flex-direction:column; gap:6px; align-items:center; padding:14px 6px; background:#F5DEE0; border-radius:14px }
          <svg>
          span { font-size:11.5px; font-weight:700; color:#855868 }  "Nails"
        div { display:flex; flex-direction:column; gap:6px; align-items:center; padding:14px 6px; background:#F8EDEB; border-radius:14px }
          <svg>
          span { font-size:11.5px; font-weight:700; color:#9C6539; text-align:center }  "Spa & massage"
        div { display:flex; flex-direction:column; gap:6px; align-items:center; padding:14px 6px; background:#FFB5A7; border-radius:14px }
          <svg>
          span { font-size:11.5px; font-weight:700; color:#5A3A33 }  "Photography"
        div { display:flex; flex-direction:column; gap:6px; align-items:center; justify-content:center; padding:14px 6px; background:linear-gradient(135deg,#6B3F3A,#A66A5D); border-radius:14px }
          span { font-size:11px; font-weight:700; color:#F9DCC4; line-height:1.3; text-align:center }  "Plan an event"
            br
    div { display:flex; flex-shrink:0; gap:12px; align-items:center; padding:13px 15px; background:linear-gradient(120deg,#FF7A4D,#E8433D); border-radius:14px }
      div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:34px; height:34px; background:rgba(255,255,255,0.22); border-radius:10px }
        <svg>
      div { display:flex; flex-direction:column; flex:1; gap:1px }
        span.head { font-size:13px; font-weight:800; color:#FFFFFF }  "Need it today? Book urgent"
        span { font-size:10.5px; color:#FFE4DA }  "Get matched fast, for a small rush fee"
      <svg>
    div { display:flex; flex-direction:column; gap:10px }
      div { display:flex; align-items:center; justify-content:space-between }
        span.head { font-size:14.5px; font-weight:700; color:#6B3F3A }  "Featured near you"
        span { font-size:12px; font-weight:600; color:#A66A5D }  "See all"
      div { display:flex; gap:12px; align-items:center; padding:10px; border:1px solid #ECE7DC; border-radius:12px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:56px; height:56px; background:linear-gradient(135deg,#F8EDEB,#FCD5CE); border-radius:10px }
          <svg>
        div { display:flex; flex-direction:column; flex:1; gap:3px }
          div { display:flex; gap:5px; align-items:center }
            span { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Grace Nabbosa Braids"
            <svg>
          span { font-size:11.5px; color:#8A8A8A }  "Hair · Ntinda"
          div { display:flex; gap:4px; align-items:center }
            <svg>
            span { font-size:11.5px; color:#5B5B5B }  "4.9 · from UGX 25,000"
      div { display:flex; gap:12px; align-items:center; padding:10px; border:1px solid #ECE7DC; border-radius:12px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:56px; height:56px; background:linear-gradient(135deg,#F9DCC4,#FEC89A); border-radius:10px }
          <svg>
        div { display:flex; flex-direction:column; flex:1; gap:3px }
          div { display:flex; gap:5px; align-items:center }
            span { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Patricia Glam Studio"
            <svg>
          span { font-size:11.5px; color:#8A8A8A }  "Makeup · Kololo"
          div { display:flex; gap:4px; align-items:center }
            <svg>
            span { font-size:11.5px; color:#5B5B5B }  "5.0 · from UGX 60,000"
  div { display:flex; flex-shrink:0; height:64px; border-top:1px solid #ECE7DC }
    div.navicon
      <svg>
      span { font-size:10px; font-weight:700; color:#6B3F3A }  "Home"
    div.navicon
      <svg>
      span { font-size:10px; color:#B3B3B3 }  "Bookings"
    div.navicon
      <svg>
      span { font-size:10px; color:#B3B3B3 }  "Chat"
    div.navicon
      <svg>
      span { font-size:10px; color:#B3B3B3 }  "Profile"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/home/data/fixtures.dart` verbatim.

- `Good morning`
- `Where to today?`
- `Kampala`
- `Search stylists, makeup artists, spas…`
- `AD`
- `Grace Nabbosa Braids`
- `20% off box braids this week`
- `Book now →`
- `Browse by category`
- `Hair`
- `Makeup`
- `Nails`
- `Spa & massage`
- `Photography`
- `Plan an event`
- `Need it today? Book urgent`
- `Get matched fast, for a small rush fee`
- `Featured near you`
- `See all`
- `Grace Nabbosa Braids`
- `Hair · Ntinda`
- `4.9 · from UGX 25,000`
- `Patricia Glam Studio`
- `Makeup · Kololo`
- `5.0 · from UGX 60,000`
- `Home`
- `Bookings`
- `Chat`
- `Profile`

## Tokens on this screen

**Colours** — #6B3F3A (19) · #FFFFFF (7) · #C97A5D (7) · #FFB5A7 (6) · #B3B3B3 (6) · #A66A5D (5) · #C15B6B (5) · #8A8A8A (4) · #FEC89A (4) · #F8EDEB (3) · #F9DCC4 (3) · #ECE7DC (3) · #F7F5F1 (2) · #D7D1C2 (2) · #2E8B57 (2) · #5B5B5B (2) · #4A2B27 (1) · #9A9A9A (1) · #B3654A (1) · #A84658 (1) · #F5DEE0 (1) · #9C6B7A (1) · #855868 (1) · #B37B4E (1) · #9C6539 (1) · #6B4A42 (1) · #5A3A33 (1) · #FF7A4D (1) · #E8433D (1) · #FFE4DA (1) · #FCD5CE (1)

**Font sizes** — 11.5px (10) · 10px (4) · 13.5px (3) · 14.5px (3) · 12px (2) · 11px (2) · 17px (1) · 12.5px (1) · 8.5px (1) · 13px (1) · 10.5px (1)

**Radii** — 14px (7) · 10px (4) · 12px (3) · 3px (3) · 16px (2) · 20px (1) · 6px (1)

**Gradients**

- `linear-gradient(135deg,#F8EDEB,#FFB5A7)`
- `linear-gradient(135deg,#6B3F3A,#A66A5D)`
- `linear-gradient(120deg,#FF7A4D,#E8433D)`
- `linear-gradient(135deg,#F8EDEB,#FCD5CE)`
- `linear-gradient(135deg,#F9DCC4,#FEC89A)`

## Artboard-local CSS classes

`.navicon`

```css
display:flex; flex-direction:column; align-items:center; gap:4px; flex:1;
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

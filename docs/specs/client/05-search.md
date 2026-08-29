# Client · Search results

| | |
|---|---|
| **Artboard** | [`.design-src/Client_Search.dc.html`](../../../.design-src/Client_Search.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/search` |
| **Widget** | `lib/features/client/search/presentation/search_screen.dart` |
| **Build order** | client #5 |
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
```

Per [Rule 1](../../03-RESPONSIVE-RULES.md): drop `width`, `height` and
`overflow`; keep the background; wrap in `SafeArea`.

## Layout tree

```
div { display:flex; flex-direction:column; width:390px; height:844px; background:#FFFFFF; overflow:hidden }
  div { display:flex; flex-shrink:0; gap:14px; align-items:center; height:56px; padding:0 16px; border-bottom:1px solid #ECE7DC }
    <svg>
    span.head { flex:1; font-size:16px; font-weight:700; color:#6B3F3A }  "Makeup artists"
    <svg>
  div { display:flex; flex-shrink:0; gap:8px; padding:14px 16px; overflow:hidden }
    div.chip { background:#6B3F3A; color:#FFFFFF }  "Kampala"
    div.chip  "Price"
    div.chip  "Rating 4.5+"
    div.chip  "Available today"
  div { display:flex; flex-direction:column; flex:1; gap:16px; padding:2px 16px 16px; overflow:hidden }
    div { display:flex; flex-direction:column; gap:8px }
      span.head { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Featured in Makeup"
      div { display:flex; gap:10px; overflow:hidden }
        div { display:flex; flex-direction:column; flex-shrink:0; gap:6px; width:108px }
          div { display:flex; align-items:center; justify-content:center; width:108px; height:80px; background:linear-gradient(135deg,#F8EDEB,#FFB5A7); border-radius:12px }
            <svg>
          span { font-size:11.5px; font-weight:700; color:#6B3F3A; line-height:1.25 }  "Patricia Glam Studio"
          span { font-size:10.5px; color:#8A8A8A }  "5.0 ★ · Kololo"
        div { display:flex; flex-direction:column; flex-shrink:0; gap:6px; width:108px }
          div { display:flex; align-items:center; justify-content:center; width:108px; height:80px; background:linear-gradient(135deg,#F8EDEB,#FCD5CE); border-radius:12px }
            <svg>
          span { font-size:11.5px; font-weight:700; color:#6B3F3A; line-height:1.25 }  "Faces by Immaculate"
          span { font-size:10.5px; color:#8A8A8A }  "4.8 ★ · Ntinda"
        div { display:flex; flex-direction:column; flex-shrink:0; gap:6px; width:108px }
          div { display:flex; align-items:center; justify-content:center; width:108px; height:80px; background:linear-gradient(135deg,#F9DCC4,#FEC89A); border-radius:12px }
            <svg>
          span { font-size:11.5px; font-weight:700; color:#6B3F3A; line-height:1.25 }  "Glow by Sandra"
          span { font-size:10.5px; color:#8A8A8A }  "4.9 ★ · Muyenga"
    div { display:flex; flex-direction:column; gap:10px; overflow:hidden }
      span.head { font-size:13.5px; font-weight:700; color:#6B3F3A }  "All makeup artists · 28"
      div { display:flex; gap:12px; padding:12px; border:1px solid #ECE7DC; border-radius:14px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:68px; height:68px; background:linear-gradient(135deg,#FCD5CE,#FFB5A7); border-radius:12px }
          <svg>
        div { display:flex; flex-direction:column; flex:1; gap:4px }
          div { display:flex; gap:5px; align-items:center }
            span { font-size:14px; font-weight:700; color:#6B3F3A }  "Ritah's Touch Makeup"
            <svg>
          div { display:flex; gap:4px; align-items:center }
            <svg>
            span { font-size:11.5px; color:#5B5B5B }  "4.9 (74) · Naguru"
          span { font-size:12.5px; color:#7A7A7A }  "Editorial & soft glam"
          span { font-size:13px; font-weight:700; color:#6B3F3A }  "from UGX 50,000"
      div { display:flex; gap:12px; padding:12px; border:1px solid #ECE7DC; border-radius:14px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:68px; height:68px; background:linear-gradient(135deg,#F9DCC4,#FCD5CE); border-radius:12px }
          <svg>
        div { display:flex; flex-direction:column; flex:1; gap:4px }
          div { display:flex; gap:5px; align-items:center }
            span { font-size:14px; font-weight:700; color:#6B3F3A }  "Nina's Beauty Bar"
            <svg>
          div { display:flex; gap:4px; align-items:center }
            <svg>
            span { font-size:11.5px; color:#5B5B5B }  "4.7 (63) · Bugolobi"
          span { font-size:12.5px; color:#7A7A7A }  "Everyday glam & makeovers"
          span { font-size:13px; font-weight:700; color:#6B3F3A }  "from UGX 35,000"
      div { display:flex; gap:12px; padding:12px; border:1px solid #ECE7DC; border-radius:14px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:68px; height:68px; background:linear-gradient(135deg,#F8EDEB,#FCD5CE); border-radius:12px }
          <svg>
        div { display:flex; flex-direction:column; flex:1; gap:4px }
          div { display:flex; gap:5px; align-items:center }
            span { font-size:14px; font-weight:700; color:#6B3F3A }  "Comfort Namutebi Makeup"
            <svg>
          div { display:flex; gap:4px; align-items:center }
            <svg>
            span { font-size:11.5px; color:#5B5B5B }  "4.6 (21) · Kansanga"
          span { font-size:12.5px; color:#7A7A7A }  "New to Appointex"
          span { font-size:13px; font-weight:700; color:#6B3F3A }  "from UGX 30,000"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/search/data/fixtures.dart` verbatim.

- `Makeup artists`
- `Kampala`
- `Price`
- `Rating 4.5+`
- `Available today`
- `Featured in Makeup`
- `Patricia Glam Studio`
- `5.0 ★ · Kololo`
- `Faces by Immaculate`
- `4.8 ★ · Ntinda`
- `Glow by Sandra`
- `4.9 ★ · Muyenga`
- `All makeup artists · 28`
- `Ritah's Touch Makeup`
- `4.9 (74) · Naguru`
- `Editorial & soft glam`
- `from UGX 50,000`
- `Nina's Beauty Bar`
- `4.7 (63) · Bugolobi`
- `Everyday glam & makeovers`
- `from UGX 35,000`
- `Comfort Namutebi Makeup`
- `4.6 (21) · Kansanga`
- `New to Appointex`
- `from UGX 30,000`

## Tokens on this screen

**Colours** — #6B3F3A (22) · #C15B6B (12) · #FFB5A7 (8) · #FFFFFF (5) · #A66A5D (4) · #ECE7DC (4) · #FCD5CE (4) · #5A3A33 (4) · #F8EDEB (3) · #8A8A8A (3) · #FEC89A (3) · #2E8B57 (3) · #5B5B5B (3) · #7A7A7A (3) · #D98B96 (2) · #C97A5D (2) · #9C6B7A (2) · #F9DCC4 (2) · #E0DBCF (1) · #3A3A3A (1)

**Font sizes** — 11.5px (6) · 10.5px (3) · 14px (3) · 12.5px (3) · 13px (3) · 13.5px (2) · 12px (1) · 16px (1)

**Radii** — 12px (6) · 14px (3) · 16px (1)

**Gradients**

- `linear-gradient(135deg,#F8EDEB,#FFB5A7)`
- `linear-gradient(135deg,#F8EDEB,#FCD5CE)`
- `linear-gradient(135deg,#F9DCC4,#FEC89A)`
- `linear-gradient(135deg,#FCD5CE,#FFB5A7)`
- `linear-gradient(135deg,#F9DCC4,#FCD5CE)`

## Artboard-local CSS classes

`.chip`

```css
font-size:12px; font-weight:600; padding:7px 13px; border-radius:16px; border:1px solid #E0DBCF; color:#3A3A3A; white-space:nowrap;
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

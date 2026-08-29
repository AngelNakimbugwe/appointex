# Business · Onboarding & verification

| | |
|---|---|
| **Artboard** | [`.design-src/Biz_Onboarding.dc.html`](../../../.design-src/Biz_Onboarding.dc.html) |
| **Reference size** | 1160 × 760 |
| **Route** | `/biz/onboarding` |
| **Widget** | `lib/features/business/onboarding/presentation/onboarding_screen.dart` |
| **Build order** | business #1 |
| **Icons on screen** | 3 |

> Everything above the HANDWRITTEN marker is generated from the artboard by
> `node tool/design/specgen.mjs`. Do not edit it — edit the artboard, or add
> your notes below the marker.

## Root container

```
width: 1160px
height: 760px
background: linear-gradient(135deg,#F8EDEB 0%,#F9DCC4 45%,#FEC89A 100%)
display: flex
align-items: center
justify-content: center
position: relative
overflow: hidden
```

Per [Rule 1](../../03-RESPONSIVE-RULES.md): drop `width`, `height` and
`overflow`; keep the background; wrap in `SafeArea`.

## Layout tree

```
div { display:flex; align-items:center; justify-content:center; width:1160px; height:760px; background:linear-gradient(135deg,#F8EDEB 0%,#F9DCC4 45%,#FEC89A 100%); position:relative; overflow:hidden }
  div { width:420px; height:420px; background:radial-gradient(circle,#FEC89A,transparent 70%); border-radius:50%; position:absolute; top:-160px; left:-140px; opacity:0.5 }
  div { width:380px; height:380px; background:radial-gradient(circle,#FFB5A7,transparent 70%); border-radius:50%; position:absolute; right:-140px; bottom:-160px; opacity:0.35 }
  div { display:flex; flex-direction:column; gap:22px; width:460px; padding:38px 40px; background:#FFFFFF; border-radius:18px; position:relative }
    div { display:flex; gap:9px; align-items:center }
      div { display:flex; align-items:center; justify-content:center; width:30px; height:30px; background:linear-gradient(135deg,#6B3F3A,#A66A5D); border-radius:8px }
        <svg>
      span.head { font-size:14px; font-weight:700; color:#6B3F3A }  "Appointex for Business"
    div { display:flex; flex-direction:column; gap:6px }
      h1.head { margin:0; font-size:23px; font-weight:800; color:#6B3F3A }  "Join Appointex"
      span { font-size:13px; color:#7A7A7A }  "Free to join. You only pay when a booking happens."
    div { display:flex; gap:8px; align-items:center }
      div { display:flex; gap:6px; align-items:center }
        div { display:flex; align-items:center; justify-content:center; width:22px; height:22px; background:#6B3F3A; border-radius:50%; font-size:11px; font-weight:700; color:#FFFFFF }  "1"
        span { font-size:11.5px; font-weight:700; color:#6B3F3A }  "Details"
      div { flex:1; height:1px; background:#E0DBCF }
      div { display:flex; gap:6px; align-items:center }
        div { display:flex; align-items:center; justify-content:center; width:22px; height:22px; background:#EDEAE2; border-radius:50%; font-size:11px; font-weight:700; color:#9A9A9A }  "2"
        span { font-size:11.5px; color:#9A9A9A }  "Verify"
      div { flex:1; height:1px; background:#E0DBCF }
      div { display:flex; gap:6px; align-items:center }
        div { display:flex; align-items:center; justify-content:center; width:22px; height:22px; background:#EDEAE2; border-radius:50%; font-size:11px; font-weight:700; color:#9A9A9A }  "3"
        span { font-size:11.5px; color:#9A9A9A }  "Services"
    div.field
      span { font-size:12px; font-weight:600; color:#3A3A3A }  "Business or provider name"
      div.input  "e.g. Patricia Glam Studio"
    div.field
      span { font-size:12px; font-weight:600; color:#3A3A3A }  "Category"
      div.input { justify-content:space-between }  "Makeup"
        <svg>
      span { font-size:10.5px; color:#9A9A9A }  "Independent stylists and mobile providers welcome, no shop front re…"
    div.field
      span { font-size:12px; font-weight:600; color:#3A3A3A }  "Phone number"
      div.input  "+256 7…"
    div.field
      span { font-size:12px; font-weight:600; color:#3A3A3A }  "Identity verification"
      div { display:flex; gap:10px; align-items:center; padding:16px; border:1.5px dashed #D7D1C2; border-radius:10px }
        <svg>
        span { font-size:12px; color:#8A8A8A }  "Upload national ID or passport"
    div { display:flex; align-items:center; justify-content:center; height:48px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); border-radius:24px }
      span { font-size:14px; font-weight:700; color:#6B3F3A }  "Continue"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/business/onboarding/data/fixtures.dart` verbatim.

- `Appointex for Business`
- `Join Appointex`
- `Free to join. You only pay when a booking happens.`
- `1`
- `Details`
- `2`
- `Verify`
- `3`
- `Services`
- `Business or provider name`
- `e.g. Patricia Glam Studio`
- `Category`
- `Makeup`
- `Independent stylists and mobile providers welcome, no shop front required.`
- `Phone number`
- `+256 7…`
- `Identity verification`
- `Upload national ID or passport`
- `Continue`

## Tokens on this screen

**Colours** — #FFFFFF (8) · #9A9A9A (7) · #6B3F3A (6) · #FEC89A (4) · #3A3A3A (4) · #E0DBCF (3) · #FFB5A7 (2) · #A66A5D (2) · #EDEAE2 (2) · #F8EDEB (1) · #F9DCC4 (1) · #7A7A7A (1) · #D7D1C2 (1) · #8A8A8A (1)

**Font sizes** — 12px (5) · 11px (3) · 11.5px (3) · 13px (2) · 14px (2) · 23px (1) · 10.5px (1)

**Radii** — 9px (1) · 18px (1) · 8px (1) · 10px (1) · 24px (1)

**Gradients**

- `linear-gradient(135deg,#F8EDEB 0%,#F9DCC4 45%,#FEC89A 100%)`
- `linear-gradient(135deg,#6B3F3A,#A66A5D)`
- `linear-gradient(135deg,#FEC89A,#FFB5A7)`

## Artboard-local CSS classes

`.field`

```css
display:flex; flex-direction:column; gap:6px;
```

`.input`

```css
height:44px; border-radius:9px; border:1px solid #E0DBCF; display:flex; align-items:center; padding:0 14px; font-size:13px; color:#9A9A9A;
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

# Client · Onboarding

| | |
|---|---|
| **Artboard** | [`.design-src/Client_Onboarding.dc.html`](../../../.design-src/Client_Onboarding.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/onboarding` |
| **Widget** | `lib/features/client/onboarding/presentation/onboarding_screen.dart` |
| **Build order** | client #1 |
| **Icons on screen** | 1 |

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
position: relative
overflow: hidden
```

Per [Rule 1](../../03-RESPONSIVE-RULES.md): drop `width`, `height` and
`overflow`; keep the background; wrap in `SafeArea`.

## Layout tree

```
div { display:flex; flex-direction:column; width:390px; height:844px; background:#FFFFFF; position:relative; overflow:hidden }
  div { display:flex; flex-direction:column; flex:1 1 62%; align-items:center; justify-content:center; background:#F8EDEB; position:relative; overflow:hidden }
    div { width:280px; height:280px; background:radial-gradient(circle,#FFB5A7,transparent 70%); border-radius:50%; position:absolute; top:-90px; right:-90px; opacity:0.28 }
    div { width:260px; height:260px; background:radial-gradient(circle,#D98B96,transparent 70%); border-radius:50%; position:absolute; bottom:-90px; left:-100px; opacity:0.30 }
    div { width:170px; height:170px; background:radial-gradient(circle,#FEC89A,transparent 70%); border-radius:50%; position:absolute; right:10px; bottom:30px; opacity:0.45 }
    div { width:120px; height:120px; background:radial-gradient(circle,#FFB5A7,transparent 70%); border-radius:50%; position:absolute; top:60px; left:30px; opacity:0.22 }
    div { display:flex; flex-direction:column; gap:14px; align-items:center; padding:0 40px }
      div { display:flex; align-items:center; justify-content:center; width:64px; height:64px; background:linear-gradient(135deg,#6B3F3A,#A66A5D); border-radius:18px }
        <svg>
      span.head { font-size:26px; font-weight:800; color:#6B3F3A; letter-spacing:-0.01em }  "Appointex"
      span { font-size:14px; color:#7A4F48; line-height:1.6; text-align:center }  "Book hair, makeup, nails, spa, massage and photography, all in one …"
  div { display:flex; flex-direction:column; flex:1 1 38%; gap:12px; justify-content:center; padding:28px 28px 40px }
    div.btn { background:linear-gradient(135deg,#FEC89A,#FFB5A7); color:#6B3F3A }  "Create account"
    div.btn { background:#FFFFFF; border:1.5px solid #6B3F3A; color:#6B3F3A }  "Log in"
    span { font-size:12.5px; color:#8A8A8A; text-align:center }  "or"
      a  "continue browsing as a guest"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/onboarding/data/fixtures.dart` verbatim.

- `Appointex`
- `Book hair, makeup, nails, spa, massage and photography, all in one app.`
- `Create account`
- `Log in`
- `or`
- `continue browsing as a guest`

## Tokens on this screen

**Colours** — #FFFFFF (8) · #6B3F3A (5) · #FFB5A7 (3) · #FEC89A (3) · #A66A5D (2) · #4A2B27 (1) · #F8EDEB (1) · #D98B96 (1) · #7A4F48 (1) · #8A8A8A (1)

**Font sizes** — 15px (1) · 26px (1) · 14px (1) · 12.5px (1)

**Radii** — 25px (1) · 18px (1)

**Gradients**

- `linear-gradient(135deg,#6B3F3A,#A66A5D)`
- `linear-gradient(135deg,#FEC89A,#FFB5A7)`

## Artboard-local CSS classes

`.btn`

```css
border-radius: 25px; height: 50px; display:flex; align-items:center; justify-content:center; font-size:15px; font-weight:700; box-sizing:border-box;
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

# Client · Chat

| | |
|---|---|
| **Artboard** | [`.design-src/Client_Chat.dc.html`](../../../.design-src/Client_Chat.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/chat/:threadId` |
| **Widget** | `lib/features/client/chat/presentation/chat_screen.dart` |
| **Build order** | client #12 |
| **Icons on screen** | 5 |

> Everything above the HANDWRITTEN marker is generated from the artboard by
> `node tool/design/specgen.mjs`. Do not edit it — edit the artboard, or add
> your notes below the marker.

## Root container

```
width: 390px
height: 844px
background: #FDFCFA
display: flex
flex-direction: column
overflow: hidden
```

Per [Rule 1](../../03-RESPONSIVE-RULES.md): drop `width`, `height` and
`overflow`; keep the background; wrap in `SafeArea`.

## Layout tree

```
div { display:flex; flex-direction:column; width:390px; height:844px; background:#FDFCFA; overflow:hidden }
  div { display:flex; flex-shrink:0; gap:12px; align-items:center; height:60px; padding:0 16px; background:#FFFFFF; border-bottom:1px solid #ECE7DC }
    <svg>
    div { display:flex; align-items:center; justify-content:center; width:34px; height:34px; background:linear-gradient(135deg,#F8EDEB,#FFB5A7); border-radius:50% }
      <svg>
    div { display:flex; flex-direction:column }
      span { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Patricia Glam Studio"
      span { font-size:11px; color:#5FA777 }  "Online"
  div { display:flex; flex-direction:column; flex:1; gap:10px; padding:16px; overflow:hidden }
    div.bubble.bg
      div.bubble { background:#F0EEE9; color:#2A2A2A }  "Hi! Do you have anything free on the 26th for bridal makeup?"
    div
      div.bubble { background:#6B3F3A; color:#FFFFFF }  "Yes, 12:00 pm is open. I can also do a trial the week before if you…"
    div
      div.bubble { background:#F0EEE9; color:#2A2A2A }  "That'd be great. Easier if we just sort the rest on WhatsApp, call …"
    div { display:flex; gap:7px; align-items:center; max-width:88%; padding:8px 14px; margin:4px 0; background:#FBF3E7; border:1px solid #FFB5A7; border-radius:20px }
      <svg>
      span { font-size:11px; color:#A66A5D; line-height:1.4; text-align:center }  "Message blocked — phone numbers and contact details are shared auto…"
    div
      div.bubble { background:#F0EEE9; color:#2A2A2A }  "Ah okay, makes sense. I'll just book it here then."
  div { display:flex; flex-direction:column; flex-shrink:0; gap:8px; padding:8px 16px 16px; background:#FFFFFF; border-top:1px solid #ECE7DC }
    span { display:flex; gap:5px; align-items:center; font-size:10.5px; color:#9A9A9A }  "Numbers and contact info are blocked before checkout"
      <svg>
    div { display:flex; gap:10px; align-items:center }
      div { display:flex; flex:1; align-items:center; height:42px; padding:0 16px; background:#F0EEE9; border-radius:21px }
        span { font-size:12.5px; color:#9A9A9A }  "Message Patricia…"
      div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:42px; height:42px; background:#FFB5A7; border-radius:50% }
        <svg>
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/chat/data/fixtures.dart` verbatim.

- `Patricia Glam Studio`
- `Online`
- `Hi! Do you have anything free on the 26th for bridal makeup?`
- `Yes, 12:00 pm is open. I can also do a trial the week before if you'd like.`
- `That'd be great. Easier if we just sort the rest on WhatsApp, call me on 0772…`
- `Message blocked — phone numbers and contact details are shared automatically once your deposit is paid`
- `Ah okay, makes sense. I'll just book it here then.`
- `Numbers and contact info are blocked before checkout`
- `Message Patricia…`

## Tokens on this screen

**Colours** — #FFFFFF (5) · #6B3F3A (4) · #F0EEE9 (4) · #FFB5A7 (3) · #2A2A2A (3) · #9A9A9A (3) · #ECE7DC (2) · #FDFCFA (1) · #F8EDEB (1) · #5FA777 (1) · #FBF3E7 (1) · #9A6B1E (1) · #A66A5D (1)

**Font sizes** — 11px (2) · 13px (1) · 13.5px (1) · 10.5px (1) · 12.5px (1)

**Radii** — 15px (1) · 20px (1) · 21px (1)

**Gradients**

- `linear-gradient(135deg,#F8EDEB,#FFB5A7)`

## Artboard-local CSS classes

`.bubble`

```css
max-width:78%; padding:10px 13px; border-radius:15px; font-size:13px; line-height:1.45;
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

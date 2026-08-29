# Client · Register

| | |
|---|---|
| **Artboard** | [`.design-src/Client_Register.dc.html`](../../../.design-src/Client_Register.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/register` |
| **Widget** | `lib/features/client/register/presentation/register_screen.dart` |
| **Build order** | client #2 |
| **Icons on screen** | 2 |

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
  div { display:flex; flex-shrink:0; gap:14px; align-items:center; height:56px; padding:0 16px }
    <svg>
  div { display:flex; flex-direction:column; flex:1; gap:22px; padding:6px 24px 0; overflow:hidden }
    div { display:flex; flex-direction:column; gap:6px }
      h1.head { margin:0; font-size:23px; font-weight:800; color:#6B3F3A }  "Create your account"
      span { font-size:13px; color:#7A7A7A; line-height:1.5 }  "Just a few details and you're ready to book."
    div { display:flex; gap:8px; align-items:center }
      div { display:flex; gap:6px; align-items:center }
        div { display:flex; align-items:center; justify-content:center; width:22px; height:22px; background:#6B3F3A; border-radius:50%; font-size:11px; font-weight:700; color:#FFFFFF }  "1"
        span { font-size:11.5px; font-weight:700; color:#6B3F3A }  "Your details"
      div { flex:1; height:1px; background:#E0DBCF }
      div { display:flex; gap:6px; align-items:center }
        div { display:flex; align-items:center; justify-content:center; width:22px; height:22px; background:#EDEAE2; border-radius:50%; font-size:11px; font-weight:700; color:#9A9A9A }  "2"
        span { font-size:11.5px; color:#9A9A9A }  "Verify phone"
    div { display:flex; flex-direction:column; gap:16px }
      div.field
        span { font-size:12px; font-weight:600; color:#3A3A3A }  "Full name"
        div.input  "e.g. Aisha Kirabo"
      div.field
        span { font-size:12px; font-weight:600; color:#3A3A3A }  "Phone number"
        div.input  "+256 7…"
      div.field
        span { font-size:12px; font-weight:600; color:#3A3A3A }  "Email address"
          span { font-weight:500; color:#B3ADA0 }  "(optional)"
        div.input  "you@example.com"
      div.field
        span { font-size:12px; font-weight:600; color:#3A3A3A }  "Password"
        div.input { justify-content:space-between }
          span  "••••••••"
          <svg>
    span { font-size:11px; color:#9A9A9A; line-height:1.6 }  "By creating an account you agree to Appointex's Terms of Service an…"
  div { display:flex; flex-direction:column; flex-shrink:0; gap:14px; padding:14px 24px 26px }
    div { display:flex; align-items:center; justify-content:center; height:50px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); border-radius:25px }
      span { font-size:14.5px; font-weight:700; color:#6B3F3A }  "Create account"
    span { font-size:12.5px; color:#8A8A8A; text-align:center }  "Already have an account?"
      a  "Log in"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/register/data/fixtures.dart` verbatim.

- `Create your account`
- `Just a few details and you're ready to book.`
- `1`
- `Your details`
- `2`
- `Verify phone`
- `Full name`
- `e.g. Aisha Kirabo`
- `Phone number`
- `+256 7…`
- `Email address`
- `(optional)`
- `you@example.com`
- `Password`
- `••••••••`
- `By creating an account you agree to Appointex's Terms of Service and Privacy Policy.`
- `Create account`
- `Already have an account?`
- `Log in`

## Tokens on this screen

**Colours** — #9A9A9A (5) · #6B3F3A (5) · #3A3A3A (4) · #E0DBCF (2) · #FFFFFF (2) · #A66A5D (1) · #7A7A7A (1) · #EDEAE2 (1) · #B3ADA0 (1) · #FEC89A (1) · #FFB5A7 (1) · #8A8A8A (1)

**Font sizes** — 12px (4) · 11px (3) · 11.5px (2) · 13.5px (1) · 23px (1) · 13px (1) · 14.5px (1) · 12.5px (1)

**Radii** — 12px (1) · 25px (1)

**Gradients**

- `linear-gradient(135deg,#FEC89A,#FFB5A7)`

## Artboard-local CSS classes

`.field`

```css
display:flex; flex-direction:column; gap:6px;
```

`.input`

```css
height:48px; border-radius:12px; border:1px solid #E0DBCF; display:flex; align-items:center; padding:0 14px; font-size:13.5px; color:#9A9A9A; box-sizing:border-box;
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

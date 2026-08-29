# Client · My bookings

| | |
|---|---|
| **Artboard** | [`.design-src/Client_MyBookings.dc.html`](../../../.design-src/Client_MyBookings.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/bookings` |
| **Widget** | `lib/features/client/my_bookings/presentation/my_bookings_screen.dart` |
| **Build order** | client #11 |
| **Icons on screen** | 4 |

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
  div { flex-shrink:0; padding:20px 18px 8px }
    span.head { font-size:19px; font-weight:800; color:#6B3F3A }  "My bookings"
  div { display:flex; flex-shrink:0; gap:22px; padding:10px 18px 0 }
    div { border-bottom:2.5px solid #FFB5A7 }
      span { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Upcoming"
    div
      span { font-size:13.5px; font-weight:600; color:#9A9A9A }  "Past"
  div { display:flex; flex-direction:column; flex:1; gap:12px; padding:14px 18px; overflow:hidden }
    div { display:flex; gap:12px; padding:13px; border:1px solid #ECE7DC; border-radius:14px }
      div { display:flex; flex-direction:column; flex-shrink:0; align-items:center; justify-content:center; width:46px; padding:8px 0; background:#6B3F3A; border-radius:10px }
        span { font-size:10px; font-weight:700; color:#FEC89A }  "AUG"
        span { font-size:16px; font-weight:800; color:#FFFFFF }  "26"
      div { display:flex; flex-direction:column; flex:1; gap:3px }
        span { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Patricia Glam Studio"
        span { font-size:12px; color:#8A8A8A }  "Bridal makeup, full glam · 12:00 pm"
      div { padding:4px 9px; background:#EAF3EC; border-radius:8px }
        span { font-size:10.5px; font-weight:700; color:#2E8B57 }  "Confirmed"
    div { display:flex; gap:12px; padding:13px; border:1px solid #ECE7DC; border-radius:14px }
      div { display:flex; flex-direction:column; flex-shrink:0; align-items:center; justify-content:center; width:46px; padding:8px 0; background:#6B3F3A; border-radius:10px }
        span { font-size:10px; font-weight:700; color:#FEC89A }  "SEP"
        span { font-size:16px; font-weight:800; color:#FFFFFF }  "12"
      div { display:flex; flex-direction:column; flex:1; gap:3px }
        span { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Event: Wedding team"
        span { font-size:12px; color:#8A8A8A }  "Hair, makeup & photography · from 9:00 am"
      div { padding:4px 9px; background:#EAF3EC; border-radius:8px }
        span { font-size:10.5px; font-weight:700; color:#2E8B57 }  "Confirmed"
    span { font-size:11.5px; font-weight:700; color:#9A9A9A; letter-spacing:0.05em; text-transform:uppercase }  "Past"
    div { display:flex; flex-direction:column; gap:9px; padding:13px; border:1px solid #ECE7DC; border-radius:14px; opacity:0.85 }
      div { display:flex; gap:12px }
        div { display:flex; flex-direction:column; flex-shrink:0; align-items:center; justify-content:center; width:46px; padding:8px 0; background:#F0EEE9; border-radius:10px }
          span { font-size:10px; font-weight:700; color:#9A9A9A }  "JUL"
          span { font-size:16px; font-weight:800; color:#5B5B5B }  "14"
        div { display:flex; flex-direction:column; flex:1; gap:3px }
          span { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Grace Nabbosa Braids"
          span { font-size:12px; color:#8A8A8A }  "Box braids · Completed"
      div { display:flex; gap:8px }
        div { padding:8px 14px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); border-radius:16px }
          span { font-size:12px; font-weight:700; color:#6B3F3A }  "Rebook"
        div { padding:8px 14px; border:1px solid #E0DBCF; border-radius:16px }
          span { font-size:12px; font-weight:600; color:#3A3A3A }  "Leave a review"
  div { display:flex; flex-shrink:0; height:64px; border-top:1px solid #ECE7DC }
    div.navicon
      <svg>
      span { font-size:10px; color:#B3B3B3 }  "Home"
    div.navicon
      <svg>
      span { font-size:10px; font-weight:700; color:#6B3F3A }  "Bookings"
    div.navicon
      <svg>
      span { font-size:10px; color:#B3B3B3 }  "Chat"
    div.navicon
      <svg>
      span { font-size:10px; color:#B3B3B3 }  "Profile"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/my_bookings/data/fixtures.dart` verbatim.

- `My bookings`
- `Upcoming`
- `Past`
- `AUG`
- `26`
- `Patricia Glam Studio`
- `Bridal makeup, full glam · 12:00 pm`
- `Confirmed`
- `SEP`
- `12`
- `Event: Wedding team`
- `Hair, makeup & photography · from 9:00 am`
- `Confirmed`
- `Past`
- `JUL`
- `14`
- `Grace Nabbosa Braids`
- `Box braids · Completed`
- `Rebook`
- `Leave a review`
- `Home`
- `Bookings`
- `Chat`
- `Profile`

## Tokens on this screen

**Colours** — #6B3F3A (10) · #B3B3B3 (6) · #ECE7DC (4) · #FFFFFF (3) · #9A9A9A (3) · #FEC89A (3) · #8A8A8A (3) · #FFB5A7 (2) · #EAF3EC (2) · #2E8B57 (2) · #F0EEE9 (1) · #5B5B5B (1) · #E0DBCF (1) · #3A3A3A (1)

**Font sizes** — 10px (7) · 13.5px (5) · 12px (5) · 16px (3) · 10.5px (2) · 19px (1) · 11.5px (1)

**Radii** — 14px (3) · 10px (3) · 8px (2) · 16px (2)

**Gradients**

- `linear-gradient(135deg,#FEC89A,#FFB5A7)`

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

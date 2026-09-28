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

The Bookings tab: the client reviews their upcoming appointments (date badge,
provider/service, confirmed status) and their history — each past booking
offering Rebook and Leave-a-review actions. The tabs imply filtering between
upcoming and past; the artboard shows both sections in one list.

## Components used

- [x] `AxBottomNav` — embedded as `Scaffold.bottomNavigationBar`, Bookings tab
  active (artboard lines 72–89); taps route via `context.go`
- [x] `AxSpace` / `AxType` / `AxColors` / `AxRadius` tokens, and
      `AxGradients.avatarPeach` for the Rebook pill (artboard line 66)

Screen-local widgets (none appear on another screen, so none promoted):

- `_BookingTab` — 13.5/700 vs 13.5/600 label with a 2.5 px salmon
  `border-bottom` on the active tab only
- `_DateBadge` — the 46 px date tile; `active` picks brand/white vs the muted
  `panelNeutral`/grey past look
- `_StatusPill` — the `#EAF3EC`/`#2E8B57` confirmed chip
- `_UpcomingBookingCard`, `_PastBookingCard` — the two card bodies
- `_GradientActionPill`, `_OutlineActionPill` — Rebook / Leave a review

No `AxMobileHeader` — this screen's header is a bare 19/800 Manrope title with
`padding:20px 18px 8px`, not the standard bar; simpler inline than
parameterising the header widget for one screen.

## Data model

```dart
// lib/features/client/my_bookings/data/fixtures.dart
class Booking { month, day, title, detail, status?, past }
const kMyBookingsUpcoming   // 2 bookings (AUG 26, SEP 12) with status 'Confirmed'
const kMyBookingsPast       // 1 booking (JUL 14) with past: true
// plus k-prefixed constants for title, tabs, section label, action labels
```

The eyebrow fixture keeps the DOM casing (`'Past'`); the call site applies
`.toUpperCase()` per Rule 8 (no `text-transform` in Flutter).

## Interactions & states

The artboards are static frames, so everything in this section is an extension
of the design rather than a transcription of it. Decide it deliberately.

| Element | Interaction | Result |
|---|---|---|
| Bottom nav | tap | `context.go` to /home, /bookings, /chat, /profile |
| Upcoming / Past tabs | tap | **Phase 4** — filter the list (currently visual; the artboard itself shows both sections under one list, which is what renders) |
| Rebook | tap | **Phase 4** — route into the provider's book flow |
| Leave a review | tap | **Phase 4** — review composer |

**States not in the artboard** — specify each, or explicitly say "out of scope":

- Loading: out of scope (fixtures only, Phase 4)
- Empty: out of scope (Phase 4)
- Error: out of scope (Phase 4)
- Pressed / hover: Phase 4
- Disabled: n/a

## Responsive notes

Per-screen deviations from [03-RESPONSIVE-RULES.md](../../03-RESPONSIVE-RULES.md).
Which fixed dimensions were kept and why; which became flexible; where the
scroll boundary sits.

- Scroll region: `Expanded > SingleChildScrollView` over the whole list
  (cards + PAST section), padding `14px 18px` on the scroller (Rule 3).
- Kept fixed: 46 px date-badge width, 64 px nav (via `AxBottomNav`), radii
  10/14/8/16, 2.5 px tab underline — intrinsic element sizes.
- Made flexible: cards stretch full width; the middle title/detail column is
  `Expanded` and wraps; the status pill sits top-aligned (the artboard's
  `align-self:flex-start` rendered as `CrossAxisAlignment.start` —
  pixel-identical, since the date badge is the tallest row child at 1.0 scale).
- The past-card action row uses `Wrap(spacing: 8, runSpacing: 8)` instead of
  the artboard's `Row(gap:8)` (line 65): at 320 px × 1.3 text scale the two
  pills overflow a `Row`. `runSpacing` mirrors the artboard's 8 px gap; at
  390/1.0 the pills sit on one line exactly as drawn.
- Behaviour at 320 px / 900 px: cards compress via the `Expanded` middle column;
  long titles/details wrap inside the column. Verified at 320/390/430 and at
  `textScaler` 1.3 — no overflow.

## Open questions

_Things the artboard does not answer. Raise them rather than inventing an answer
silently._

- [ ] Tab filtering (Upcoming/Past) is visual-only this phase — confirm the
      Phase 4 behaviour (filter vs scroll-to-section).
- [ ] Rebook destination (provider page vs book flow) is not specified by any
      artboard.
- [ ] The header uses 18 px horizontal padding where most screens use `pageH`
      (20). Kept 18 verbatim; flag if the design intended `pageH`.

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes
- [x] No literal colours or font sizes outside `design/tokens/`
- [ ] Layer-2 side-by-side reviewed and signed off

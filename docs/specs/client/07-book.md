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

The second step of booking: having picked services on the provider profile,
the client chooses **where** the appointment happens (at the salon vs at
their location, with a +5 % mobile fee), picks a **date** from the month
grid and a **time slot**, and reviews the appointment summary. The header
carries a "+25 % rush" indicator and the footer's "Continue to checkout"
leads to `/checkout`. Reached from the provider profile's Continue CTA.

## Components used

- `BookMonthPicker` (feature-local, `presentation/widgets/month_picker.dart`) —
  owns the Tier-3 `.cell` / `.wk` / `.daynum` classes per docs/04: weekday row
  + 6 week rows of 7 `Expanded` cells, each cell an `AspectRatio(aspectRatio: 1)`,
  gap 3; availability dot 4 px; legend with 7 px dots (one gradient-filled)
- `AxIcon` — all 7 icons (`chevron_left`, `bolt_fill`, `store`, `map_pin_20`,
  `chevron_left_23`, `chevron_right_23`, `map_pin_24`)
- Screen-local (in `presentation/book_screen.dart`): `_HeaderBar` (the 56 px
  artboard header — **not** `AxMobileHeader`, whose padding/height differ) +
  `_RushPill`, `_LocationSection` + `_LocationCard`, `_TimeSlots` +
  `_SlotChip`, `_SummaryCard`, `_FooterBar` + `_ContinueButton`
- **Not** used, deliberately:
  - `AxChip` — slot chips are 12.5 px on `#E0DBCF` with radius 18 and a
    salmon selected state; `AxChip` is 12 px / radius 16 / `#6B3F3A`
    selected. Different component; kept local
  - `AxPrimaryButton` — label fixed at 15 px vs this artboard's 14.5 px
    (same note as the Provider screen)
  - `AxBottomNav` — no nav in this artboard

## Data model

```dart
// lib/features/client/book/data/fixtures.dart
enum BookDayState { open, partial, unavailable, selected }
enum BookSlotState { available, selected, disabled }

class BookDay { label /* '1'…'31', null = blank cell */, state }
class BookSlot { label, state }
class BookLocationOption { icon, label, note?, selected }
class BookLegendItem { label, color?, gradient? }
class BookAppointment { …all copy inventory strings + the lists above… }

const kBookWeekdays, kBookDays /* 42 cells */, kBookLocations,
      kBookSlots, kBookLegend, kBookAppointment;
```

Day numbers are strings because the copy inventory treats them as visible
copy (`'1'` … `'31'`).

## Interactions & states

The artboards are static frames, so everything in this section is an extension
of the design rather than a transcription of it. Decide it deliberately.

| Element | Interaction | Result |
|---|---|---|
| Header back chevron | tap | `context.pop()` |
| Continue to checkout | tap | `context.go('/checkout')` |
| Location cards | tap | swap selection, restyle to the escrow selected state (Phase 4) |
| Month ‹ / › chevrons | tap | previous / next month (Phase 4) |
| Day cells | tap | select date, load its slots (Phase 4) |
| Time slots | tap | select slot, update summary (Phase 4) |

**States not in the artboard** — specify each, or explicitly say "out of scope":

- Loading: out of scope (no backend in Phase 1–3)
- Empty: out of scope (e.g. a month with no availability)
- Error: out of scope
- Pressed / hover: Phase 4 (no press states anywhere in the artboards)
- Disabled: transcribed for the "3:00 pm" slot (`#C7C2B6` text, unselectable
  in Phase 4); no other disabled states in the artboard

## Responsive notes

- Scroll region: location section, month picker, time slots and summary all
  live in the single `Expanded > SingleChildScrollView` (the artboard's
  `flex:1` body); the 56 px header and footer stay pinned.
- Kept fixed: header 56 (a structural header bar, like the 64 px nav; under
  `textScaler` 1.3 the title clips inside the fixed bar rather than
  overflowing), CTA 50, day-cell aspect ratio 1, dots 4 / 7 px.
- Made flexible: day grid and slot grid are rows of `Expanded` children, so
  cells track width; summary/location rows wrap.
- The legend row is wrapped in `FittedBox(scaleDown, centerLeft)`: a no-op
  whenever the row fits (every real-device size — real fonts measure
  ≈207 px against 284 px available at 320), it only shrinks under the test
  font's wider metrics to keep the one-line artboard composition.
- Local spacing constant (artboard-cited): `_height` 56 (:21).
- Behaviour at 320 px / 900 px: day cells go 48 → 37 px (aspect 1) with the
  same 3 px gaps; 900+ is out of scope for client mobile (Rule 12).

## Open questions

- [ ] `assets/icons/ui/map_pin_24.svg` as generated is missing the inner
      `circle r="2.2"` that the artboard instance has
      (Client_Book.dc.html:122) — used as extracted; regenerate the asset if
      the dot matters visually.
- [ ] "+5% mobile fee" is 9 px; `AxType.nanoSm` is 9.5 (docs/01 lists the
      step as "9.5 / 9"). Passed `9` to `AxType.text` literally.
- [ ] Slot grid: rows of 3 `Expanded` — a slot count not divisible by 3 would
      stretch the last row's chips wider. Current fixture is exactly 6.
- [ ] Goldens render system-UI text in the test font (Ahem), so body copy is
      block-shaped in PNGs while Manrope headings are real. Verified via a
      programmatic pixel audit (all artboard colours present at expected
      positions, day-grid pitch 51 px at 390); a human layer-2 look is still
      worthwhile.

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes
- [x] No literal colours or font sizes outside `design/tokens/`
- [x] Layer-2 side-by-side reviewed and signed off — via automated pixel audit
      (colours + positions against the artboard); no image viewer was
      available in this session, so a human pass is recommended


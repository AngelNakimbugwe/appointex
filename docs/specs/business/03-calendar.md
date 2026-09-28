# Business · Calendar

| | |
|---|---|
| **Artboard** | [`.design-src/Biz_Calendar.dc.html`](../../../.design-src/Biz_Calendar.dc.html) |
| **Reference size** | 1160 × 760 |
| **Route** | `/biz/calendar` |
| **Widget** | `lib/features/business/calendar/presentation/calendar_screen.dart` |
| **Build order** | business #3 |
| **Icons on screen** | 10 |

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
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Dashboard"
    div.navrow { background:#FFB5A7 }
      <svg>
      span { font-size:13px; font-weight:700; color:#6B3F3A }  "Calendar"
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
  div { display:flex; flex-direction:column; flex:1; gap:18px; padding:26px 32px; overflow:hidden }
    div { display:flex; align-items:center; justify-content:space-between }
      span.head { font-size:20px; font-weight:800; color:#6B3F3A }  "Calendar"
      div { display:flex; gap:14px; align-items:center }
        div { display:flex; gap:10px; align-items:center }
          <svg>
          span { font-size:13px; font-weight:700; color:#6B3F3A }  "24 to 30 August"
          <svg>
        div { display:flex; align-items:center; height:38px; padding:0 16px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); border-radius:19px }
          span { font-size:12.5px; font-weight:700; color:#6B3F3A }  "+ Make an appointment"
    div { display:flex; flex:1; gap:0; padding:16px 12px; background:#FFFFFF; border:1px solid #ECE7DC; border-radius:14px; overflow:hidden }
      div.daycol { border-left:none }
        span { font-size:11px; font-weight:700; color:#9A9A9A; text-align:center }  "MON 24"
        div.appt { background:#EAF3EC }
          span { font-size:10.5px; font-weight:700; color:#2E8B57 }  "9:00"
          span { font-size:10.5px; color:#2E8B57 }  "Aisha K."
      div.daycol
        span { font-size:11px; font-weight:700; color:#9A9A9A; text-align:center }  "TUE 25"
      div.daycol
        span.head { padding:2px 0; background:#F7F5F1; border-radius:6px; font-size:11px; font-weight:800; color:#6B3F3A; text-align:center }  "WED 26"
        div.appt { background:#EAF3EC }
          span { font-size:10.5px; font-weight:700; color:#2E8B57 }  "9:00"
          span { font-size:10.5px; color:#2E8B57 }  "Aisha K."
        div.appt { background:#EAF3EC }
          span { font-size:10.5px; font-weight:700; color:#2E8B57 }  "12:00"
          span { font-size:10.5px; color:#2E8B57 }  "Diana N."
        div.appt { background:#FBF3E7 }
          span { font-size:10.5px; font-weight:700; color:#9A6B1E }  "3:30"
          span { font-size:10.5px; color:#9A6B1E }  "Ruth M. · pending"
      div.daycol
        span { font-size:11px; font-weight:700; color:#9A9A9A; text-align:center }  "THU 27"
        div.appt { background:#EAF3EC }
          span { font-size:10.5px; font-weight:700; color:#2E8B57 }  "2:00"
          span { font-size:10.5px; color:#2E8B57 }  "Fiona T."
      div.daycol
        span { font-size:11px; font-weight:700; color:#9A9A9A; text-align:center }  "FRI 28"
      div.daycol
        span { font-size:11px; font-weight:700; color:#9A9A9A; text-align:center }  "SAT 29"
        div.appt { background:#6B3F3A }
          span { font-size:10.5px; font-weight:700; color:#FEC89A }  "9:00"
          span { font-size:10.5px; color:#FFFFFF }  "Wedding: Namono"
      div.daycol
        span { font-size:11px; font-weight:700; color:#9A9A9A; text-align:center }  "SUN 30"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/business/calendar/data/fixtures.dart` verbatim.

- `Appointex`
- `FOR BUSINESS`
- `Dashboard`
- `Calendar`
- `Clients`
- `Earnings`
- `Services`
- `Featured Spots`
- `Settings`
- `Calendar`
- `24 to 30 August`
- `+ Make an appointment`
- `MON 24`
- `9:00`
- `Aisha K.`
- `TUE 25`
- `WED 26`
- `9:00`
- `Aisha K.`
- `12:00`
- `Diana N.`
- `3:30`
- `Ruth M. · pending`
- `THU 27`
- `2:00`
- `Fiona T.`
- `FRI 28`
- `SAT 29`
- `9:00`
- `Wedding: Namono`
- `SUN 30`

## Tokens on this screen

**Colours** — #C9A79D (12) · #6B3F3A (11) · #FFFFFF (8) · #2E8B57 (8) · #9A9A9A (6) · #EAF3EC (4) · #FEC89A (3) · #A66A5D (2) · #FFB5A7 (2) · #9A6B1E (2) · #F1EEE6 (1) · #FBFAF7 (1) · #F8EDEB (1) · #ECE7DC (1) · #F7F5F1 (1) · #FBF3E7 (1)

**Font sizes** — 10.5px (12) · 13px (9) · 11px (7) · 9.5px (1) · 20px (1) · 12.5px (1)

**Radii** — 8px (2) · 9px (1) · 19px (1) · 14px (1) · 6px (1)

**Gradients**

- `linear-gradient(135deg,#6B3F3A,#A66A5D)`
- `linear-gradient(135deg,#FEC89A,#FFB5A7)`

## Artboard-local CSS classes

`.navrow`

```css
display:flex; align-items:center; gap:11px; padding:10px 16px; border-radius:9px;
```

`.daycol`

```css
flex:1; display:flex; flex-direction:column; gap:8px; border-left:1px solid #F1EEE6; padding:0 8px;
```

`.appt`

```css
border-radius:8px; padding:7px 9px; display:flex; flex-direction:column; gap:2px;
```


<!-- HANDWRITTEN — everything below this line is preserved by specgen -->







## Purpose

The provider scans their week at a glance: which days carry bookings, what is
confirmed (green), pending (amber) or a wedding job (dark), and steps
week-by-week with the chevrons. "+ Make an appointment" is the entry point for
manually adding a booking. Everything else on the screen is the shared
business shell (sidebar) around the seven-day grid.

## Components used

- [x] `BizShell` + `AxSidebar` (via `AxSidebarItem.calendar`)
- [x] `AxIcon` (the two 16 px week chevrons, stroke 2.2)
- Screen-local, Tier 3 (`.daycol` / `.appt` stay in the feature per docs/04):
  `WeekGrid` + `_DayColumn` + `_DayHeader` + `_AppointmentBlock` in
  `presentation/widgets/week_grid.dart`.
- Screen-local `_MakeAppointmentButton`: the artboard's CTA is
  `height:38; padding:0 16px; border-radius:19px` on the same peach→salmon
  gradient as `AxPrimaryButton`'s gradient style, but `AxPrimaryButton` has no
  horizontal-padding parameter, so the local twin stays until that is added.

## Data model

`lib/features/business/calendar/data/fixtures.dart`:

- `kPageTitle`, `kWeekRange`, `kMakeAppointment` — header strings
- `AppointmentTone` enum (`confirmed` / `pending` / `wedding`) — selects the
  `.appt` colour family
- `CalendarAppointment(time, client, tone)`
- `CalendarDay(label, today, appointments)` — `today` drives the `WED 26` pill
- `kWeek` — the seven days in artboard order

## Interactions & states

| Element | Interaction | Result |
|---|---|---|
| Week chevrons | tap | Previous / next week — Phase 4 (fixtures are static) |
| "+ Make an appointment" | tap | Booking-creation flow — Phase 4 |
| `.appt` block | tap | Booking detail — Phase 4 |
| `.daycol` header | tap | Day view — not specified anywhere; out of scope |

**States not in the artboard** — Loading: out of scope (fixtures only).
Empty: day columns without appointments render the weekday header only, as
drawn. Error: out of scope. Pressed / hover: Phase 4. Disabled: n/a.

## Responsive notes

- Scroll region: `BizShell`'s pane `SingleChildScrollView`; the week grid is
  the trailing `Expanded`, so it fills the pane exactly at the reference
  height and grows (scrolls) under large text scale.
- Kept fixed: CTA height 38, chevron sizes 16, all paddings/gaps/radii and
  the tone colours.
- Made flexible: the card and the seven `.daycol`s are equal `Expanded`s; the
  header's week-nav/CTA group is a chain of loose `Flexible`s so the CTA label
  ellipsizes instead of overflowing below 1160 px (invisible at the reference
  size — nothing shrinks there).
- Appointment text wraps within a column at narrow widths, exactly as the
  artboard's block-level spans would in CSS.
- At 900 px the columns compress to ~68 px of content; day labels and
  appointment text still fit (or wrap under 1.3× text scale).

## Open questions

- [ ] Should `AxPrimaryButton` take a horizontal-padding parameter (or a
      "hug content" variant) so this CTA and the shared `.btn` merge?
- [ ] Week-switching semantics: does "24 to 30 August" always mean a
      Monday-first week, and what happens to the `WED 26` today-pill when the
      provider navigates away from the current week?

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes
- [x] No literal colours or font sizes outside `design/tokens/`
- [ ] Layer-2 side-by-side reviewed and signed off

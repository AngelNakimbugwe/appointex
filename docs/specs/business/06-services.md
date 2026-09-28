# Business · Services & pricing

| | |
|---|---|
| **Artboard** | [`.design-src/Biz_Services.dc.html`](../../../.design-src/Biz_Services.dc.html) |
| **Reference size** | 1160 × 760 |
| **Route** | `/biz/services` |
| **Widget** | `lib/features/business/services/presentation/services_screen.dart` |
| **Build order** | business #6 |
| **Icons on screen** | 8 |

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
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Calendar"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Clients"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Earnings"
    div.navrow { background:#FFB5A7 }
      <svg>
      span { font-size:13px; font-weight:700; color:#6B3F3A }  "Services"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Featured Spots"
    div.navrow
      <svg>
      span { font-size:13px; font-weight:600; color:#C9A79D }  "Settings"
  div { display:flex; flex-direction:column; flex:1; gap:16px; padding:26px 32px; overflow:hidden }
    div { display:flex; align-items:center; justify-content:space-between }
      span.head { font-size:20px; font-weight:800; color:#6B3F3A }  "Services"
      div { display:flex; align-items:center; height:38px; padding:0 16px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); border-radius:19px }
        span { font-size:12.5px; font-weight:700; color:#6B3F3A }  "+ Add service"
    div { display:flex; flex-direction:column; flex:1; padding:6px 22px; background:#FFFFFF; border:1px solid #ECE7DC; border-radius:14px; overflow:hidden }
      div.row { border-bottom:1px solid #E8E3D8 }
        span.th { flex:1.8 }  "Service"
        span.th { flex:1 }  "Category"
        span.th { flex:0.8 }  "Duration"
        span.th { flex:1 }  "Price"
        span.th { flex:0.8 }  "Active"
      div.row
        span { flex:1.8; font-size:13px; font-weight:700; color:#6B3F3A }  "Everyday glam"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "Makeup"
        span { flex:0.8; font-size:12.5px; color:#5B5B5B }  "45 min"
        span { flex:1; font-size:12.5px; font-weight:700; color:#6B3F3A }  "UGX 120,000"
        div.toggle { flex:0.8 }
          div.knob
      div.row
        span { flex:1.8; font-size:13px; font-weight:700; color:#6B3F3A }  "Bridal makeup, full glam"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "Makeup"
        span { flex:0.8; font-size:12.5px; color:#5B5B5B }  "90 min"
        span { flex:1; font-size:12.5px; font-weight:700; color:#6B3F3A }  "UGX 350,000"
        div.toggle { flex:0.8 }
          div.knob
      div.row
        span { flex:1.8; font-size:13px; font-weight:700; color:#6B3F3A }  "Photoshoot makeup"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "Makeup"
        span { flex:0.8; font-size:12.5px; color:#5B5B5B }  "60 min"
        span { flex:1; font-size:12.5px; font-weight:700; color:#6B3F3A }  "UGX 160,000"
        div.toggle { flex:0.8 }
          div.knob
      div.row
        span { flex:1.8; font-size:13px; font-weight:700; color:#6B3F3A }  "Makeup trial session"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "Makeup"
        span { flex:0.8; font-size:12.5px; color:#5B5B5B }  "45 min"
        span { flex:1; font-size:12.5px; font-weight:700; color:#6B3F3A }  "UGX 90,000"
        div.toggle { flex:0.8 }
          div.knob
      div.row { border-bottom:none }
        span { flex:1.8; font-size:13px; font-weight:700; color:#6B3F3A }  "Wedding party glam (group)"
        span { flex:1; font-size:12.5px; color:#5B5B5B }  "Makeup"
        span { flex:0.8; font-size:12.5px; color:#5B5B5B }  "3 to 5 hrs"
        span { flex:1; font-size:12.5px; font-weight:700; color:#6B3F3A }  "From UGX 600,000"
        div.toggle { flex:0.8 }
          div.knob
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/business/services/data/fixtures.dart` verbatim.

- `Appointex`
- `FOR BUSINESS`
- `Dashboard`
- `Calendar`
- `Clients`
- `Earnings`
- `Services`
- `Featured Spots`
- `Settings`
- `Services`
- `+ Add service`
- `Service`
- `Category`
- `Duration`
- `Price`
- `Active`
- `Everyday glam`
- `Makeup`
- `45 min`
- `UGX 120,000`
- `Bridal makeup, full glam`
- `Makeup`
- `90 min`
- `UGX 350,000`
- `Photoshoot makeup`
- `Makeup`
- `60 min`
- `UGX 160,000`
- `Makeup trial session`
- `Makeup`
- `45 min`
- `UGX 90,000`
- `Wedding party glam (group)`
- `Makeup`
- `3 to 5 hrs`
- `From UGX 600,000`

## Tokens on this screen

**Colours** — #6B3F3A (20) · #C9A79D (12) · #5B5B5B (10) · #FFFFFF (8) · #A66A5D (2) · #FEC89A (2) · #FFB5A7 (2) · #F1EEE6 (1) · #9A9A9A (1) · #FBFAF7 (1) · #F8EDEB (1) · #ECE7DC (1) · #E8E3D8 (1) · #D7D1C2 (1)

**Font sizes** — 12.5px (16) · 13px (13) · 11px (1) · 9.5px (1) · 20px (1)

**Radii** — 9px (1) · 10px (1) · 8px (1) · 19px (1) · 14px (1)

**Gradients**

- `linear-gradient(135deg,#6B3F3A,#A66A5D)`
- `linear-gradient(135deg,#FEC89A,#FFB5A7)`

## Artboard-local CSS classes

`.navrow`

```css
display:flex; align-items:center; gap:11px; padding:10px 16px; border-radius:9px;
```

`.row`

```css
display:flex; align-items:center; gap:14px; padding:12px 6px; border-bottom:1px solid #F1EEE6;
```

`.th`

```css
font-size:11px; font-weight:700; color:#9A9A9A; text-transform:uppercase; letter-spacing:0.03em;
```

`.toggle`

```css
width:36px; height:20px; border-radius:10px; display:flex; align-items:center; padding:2px;
```

`.knob`

```css
width:16px; height:16px; border-radius:50%; background:#FFFFFF;
```


<!-- HANDWRITTEN — everything below this line is preserved by specgen -->







## Purpose

The business owner manages their service menu and pricing: each service's category, duration, price and whether it is bookable (the Active toggle), plus the "+ Add service" action. The only navigation onward is the shell sidebar; within the screen, toggling availability is live and adding a service is a Phase 4 flow.

## Components used

- `BizShell` (sidebar + scrolling pane; sidebar taps already wired by the shell)
- `AxToggle` — Active column, `value`/`onChanged`
- Screen-local: `ServicesTable` (`presentation/widgets/services_table.dart`, state held by the table card in the screen file) and the "+ Add service" chip (gradient stadium, height 38 — the gradient is `AxGradients.avatarPeach`, whose documented stops are the artboard's `135deg, #FEC89A → #FFB5A7`). **Recommendation:** extend the shared `AxDataTable` with per-cell builders (toggle cells, per-column weights); its `List<List<String>>` rows cannot express either. If another screen needs a gradient stadium chip, promote it next to `AxPrimaryButton`.

## Data model

`lib/features/business/services/data/fixtures.dart` — `ServiceRow {name, category, duration, price, active}` as `kServices`, plus `kPageTitle`, `kAddServiceLabel`, `kColumns`. All values verbatim from the copy inventory above; the `active` flags are the artboard's toggle states (rows 1-3 and 5 on, row 4 off).

## Interactions & states

| Element | Interaction | Result |
|---|---|---|
| Active toggle | tap | flips that row's toggle (state lives in the screen; persists for the session) |
| "+ Add service" chip | none | display only; the add-service flow is Phase 4 |
| Sidebar rows | tap | navigate via BizShell (already wired) |

**States not in the artboard** — loading / empty / error are out of scope (static port; Phase 4 wires the API). Pressed / hover / disabled on the chip and toggles are Phase 4.

## Responsive notes

- Scroll region: the whole content pane (`BizShell`'s `SingleChildScrollView`, Rule 3); the table card is the `flex:1` body via a trailing `Expanded`.
- Kept fixed: chip height 38, toggle 36×20, row padding `12 6`, sidebar 220, all font sizes/radii/colours.
- Made flexible: table columns are proportional flexes `9, 5, 4, 5, 4` (×5 of `1.8, 1, 0.8, 1, 0.8`); every cell text ellipsizes (`maxLines: 1`); the toggle sits left-aligned in its cell like the artboard's flex item.
- 900 px: columns compress, cell text ellipsizes; 1440 px: the card stretches with the pane. `textScaler 1.3` — the 38 px chip still holds the 16.25 px label; verified no overflow.

## Open questions

- [ ] `lib/app/router.dart` still routes `/biz/services` to the Phase 0 placeholder (outside this task's file set) — needs wiring.
- [ ] The artboard's toggle markup carries duplicate `style` attributes; the visual intent (`#6B3F3A` on, `#D7D1C2` off, knob 16 px) is unambiguous and matches §AxToggle, but the file's own rendering may differ.
- [ ] What happens to booked appointments when a service is switched off — hidden from booking only, or cancelled? Product question for Phase 4.

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes (content pane has no icons; sidebar renders via `AxIcon`)
- [x] No literal colours or font sizes outside `design/tokens/`
- [ ] Layer-2 side-by-side reviewed and signed off

# 04 — Component Inventory

Extracted from the artboards, not invented. Two sources of evidence:

1. **Declared CSS classes** in each artboard's `<helmet>` block — the designer
   already factored these out, so they are components by intent.
2. **Repeated inline markup** across screens — components by accident, which
   still need to be factored out.

Build order: everything in "Tier 1" during Phase 1, before any screen work.

---

## Tier 1 — build first, used by 3+ screens

### `AxIcon`
Wraps `SvgPicture.asset`. See [05-ICON-CATALOG.md](05-ICON-CATALOG.md).

```dart
AxIcon(AxIcons.bell, size: 21, color: AxColors.brand)
```

Sizes in the design: 10, 12, 14, 15, 16, 17, 19, 20, 21. Stroke widths: 2, 2.2,
2.3, 2.4, 2.5, 2.6. Stroke width is baked into the extracted SVG — do not try to
override it at the call site.

### `AxMobileHeader`
Present on **9 of 12** client screens, always the same shape: back arrow
(`M15 18l-6-6 6-6`), a title, optional trailing action.

- Padding `20, 20, 20, 14` (Home) or `18, 20, 14` (inner pages — check the spec)
- Title: Manrope 700, 17 px, `AxColors.brand`
- `flex-shrink: 0` — sits above the scrolling body, never inside it

Home is the exception: no back arrow, a two-line greeting block instead, plus a
location pill and a bell. Model that as `AxMobileHeader.home(...)`.

### `AxBottomNav`
Home and MyBookings declare `.navicon`:

```css
display:flex; flex-direction:column; align-items:center; gap:4px; flex:1;
```

- Bar: `height: 64`, `border-top: 1px solid #ECE7DC`, background `#FFFFFF`
- Four items: **Home, Bookings, Chat, Profile** — each `Expanded`
- Icon 19 px; active `#6B3F3A` at stroke-width 2.2, inactive `#B3B3B3` at 2.0
- Label 10 px; active weight 700 `#6B3F3A`, inactive weight 400 `#B3B3B3`

Note the active icon is drawn at a *heavier stroke*, not just recoloured. That
means two SVG variants per nav icon, not one tinted asset.

Do not use Flutter's `NavigationBar` — it enforces its own 80 px height, indicator
pill and Material 3 shadow, none of which the design has.

### `AxSidebar` (business)
`.navrow` — identical across all 7 dashboard screens:

```css
display:flex; align-items:center; gap:11px; padding:10px 16px; border-radius:9px;
```

- Sidebar: `width: 220`, background `#F8EDEB`, padding `22, 14`
- Brand block at top: 28 px logo mark (gradient `#6B3F3A→#A66A5D`, radius 8),
  "Appointex" Manrope 800 13 px, "FOR BUSINESS" 9.5 px 700 `#A66A5D`,
  `letter-spacing: 0.05em`, padding `0, 8, 0, 24`
- Active row: background `#FFB5A7`, label 13 px **700** `#6B3F3A`, icon `#6B3F3A`
- Inactive row: no background, label 13 px **600** `#C9A79D`, icon `#C9A79D`
- Order is fixed: Dashboard, Calendar, Clients, Earnings, Services,
  Featured Spots, Settings

### `AxAvatar`
30 instances. A square, rounded, gradient-filled box holding a decorative SVG
sized at 52–55% of the box.

- Sizes seen: 34, 36, 40, 44, 56
- Radius: 8, 10, 12 depending on size
- Gradient: one of the six `AxGradients.avatars`, chosen by stable provider hash
- `flex-shrink: 0` → never let it compress in a `Row`

```dart
AxAvatar(size: 56, radius: 10, art: AxIcons.artBraids, gradient: ...)
```

### `AxVerifiedBadge`
8 instances, always immediately after a provider name in a `Row` with `gap: 5`.
A 12 px filled `#2E8B57` circle with a white check
(`M8 12l2.5 2.5L16 9`, stroke-width 2.6).

This is a product concept ("ID-verified providers"), so give it a real widget
rather than dropping a raw icon inline.

### `AxRating`
11 instances. A 12 px filled star `#A66A5D` + text like `4.9 · from UGX 25,000`
at 11.5 px `#5B5B5B`, `gap: 4`.

### `AxProviderRow`
The single most reused composite — Home "Featured near you", Search results,
Urgent matches, EventBundle picks.

```
padding:10; border:1px solid #ECE7DC; border-radius:12px; gap:12; align-items:center
  AxAvatar(56, radius 10)
  Expanded > Column(gap:3)
      Row(gap:5)[ name 13.5px/700 brand, AxVerifiedBadge ]
      "Hair · Ntinda" 11.5px #8A8A8A
      AxRating
```

Variants to support via named constructors, not booleans: `.featured` (adds an
AD badge), `.urgent` (adds a slot-time pill and rush fee), `.compact`.

### `AxCard`
19 uses at radius 14, 5 at radius 12.

```css
background:#FFFFFF; border:1px solid #ECE7DC; border-radius:14px; padding:18px 20px;
```

Parameterise radius and padding; default to the 14 / `18,20` form from
`.card` in Biz_Settings.

### `AxChip`
`.chip` (Search) and `.etype` (EventBundle) are the same component:

```css
font-size:12px; font-weight:600; border-radius:16px; border:1px solid #E0DBCF;
color:#3A3A3A; white-space:nowrap;
padding: 7px 13px   (.chip)  |  8px 14px  (.etype)
```

Selected state (read from the markup, not the class): background `#6B3F3A`,
text `#FFFFFF`, no border.

`white-space: nowrap` → `softWrap: false`, and the chip row must scroll
horizontally rather than wrap. Use `ListView` with `scrollDirection: Axis.horizontal`.

### `AxField`
`.field` + `.input`, on Register and Biz_Onboarding.

```css
.field { display:flex; flex-direction:column; gap:6px; }
.input { border:1px solid #E0DBCF; display:flex; align-items:center; padding:0 14px; color:#9A9A9A; }
```

Two sizes — keep both, they are per-form-factor:

| | height | radius | font |
|---|---|---|---|
| `AxField.mobile` (Register) | 48 | 12 | 13.5 |
| `AxField.desktop` (Biz_Onboarding) | 44 | 9 | 13 |

`#9A9A9A` is the **placeholder** colour. Entered text should be `#3A3A3A` —
the static artboard can only show the empty state, so this is a deliberate
extension. Note it in the screen spec.

### `AxPrimaryButton`
`.btn` from Client_Onboarding:

```css
border-radius:25px; height:50px; font-size:15px; font-weight:700;
display:flex; align-items:center; justify-content:center;
```

Radius 25 on height 50 is a **stadium** shape. Use `StadiumBorder`, not
`BorderRadius.circular(25)` — they agree at this height but the stadium survives
text scaling.

Filled: `#6B3F3A` bg, `#FFFFFF` text. Outline: `1px solid #E0DBCF`, `#6B3F3A` text.

---

## Tier 2 — business dashboard, build during Phase 3

### `AxStatTile`
`.stat`, two variants:

| Screen | Top accent |
|---|---|
| Biz_Dashboard | `border-top: 3px solid #FFB5A7` |
| Biz_Earnings | none |

```css
flex:1; background:#FFFFFF; border:1px solid #ECE7DC; border-radius:14px;
padding:16px 18px; display:flex; flex-direction:column; gap:6px;
```

**Implementation warning:** Flutter cannot render a `Border` with one differing
side *and* a `borderRadius` — it throws. Build the accent as a 3 px child inside
a `ClipRRect`. See [03-RESPONSIVE-RULES.md](03-RESPONSIVE-RULES.md) Rule 11.

### `AxDataTable`
`.th` + `.row`, carrying Clients, Earnings, Services and part of FeaturedSpots.

```css
.th  { font-size:11px; font-weight:700; color:#9A9A9A; text-transform:uppercase; letter-spacing:0.03em; }
.row { display:flex; align-items:center; gap:14px; border-bottom:1px solid #F1EEE6; }
```

Row padding varies by screen — `13px 6px` (Clients), `12px 6px` (Earnings,
Services), `10px 0` (FeaturedSpots). Make it a parameter.

Header `letter-spacing: 0.03em` at 11 px → `letterSpacing: 0.33`.

Do **not** use Flutter's `DataTable` — its row height, divider colour and
padding defaults all differ from this and are awkward to override. Build it from
`Column` + `Row(Expanded)` with explicit flex weights per column.

### `AxToggle`
`.toggle` + `.knob`, Biz_Services.

```css
.toggle { width:36px; height:20px; border-radius:10px; padding:2px; align-items:center; }
.knob   { width:16px; height:16px; border-radius:50%; background:#FFFFFF; }
```

Flutter's `Switch` is 59×40 with a Material ripple. It cannot be made to match
36×20. Build this from a `Container` + `AnimatedAlign`.

### `AxPill`
`.pill` (Biz_Earnings): `padding:3px 9px; border-radius:7px; font-size:10.5px; font-weight:700`.
Status colours come from the semantic tokens — `verified`/`verifiedBg` for paid,
`pending`/`pendingBg` for pending.

### `AxTierCard`
`.tier` (Biz_FeaturedSpots): `flex:1; border:1px solid #ECE7DC; border-radius:14px; padding:16px 18px; gap:8`.

### `AxPlanCard`
`.plan` (Biz_Settings): `flex:1; border-radius:12px; padding:14px 16px; gap:6`.

---

## Tier 3 — single-screen, keep local

Do not promote these to `design/widgets/`. They live in the owning feature.

| Class | Screen | Notes |
|---|---|---|
| `.daycol`, `.appt` | Biz_Calendar | Week grid column + appointment block |
| `.daynum`, `.cell`, `.wk` | Client_Book | Month picker. `.cell` uses `aspect-ratio:1` → `AspectRatio(aspectRatio: 1)` |
| `.bubble` | Client_Chat | `max-width:78%` → `ConstrainedBox` with `maxWidth: constraints.maxWidth * 0.78` |
| `.catchip` | Client_Urgent | Fixed `width:58px`, `flex-shrink:0`, in a horizontal scroller |

---

## Anti-patterns for this design

Flutter's Material defaults actively fight this design. Explicitly avoid:

| Don't use | Because | Use instead |
|---|---|---|
| `Card` | Adds elevation + shadow; design has none | `Container` + `BoxDecoration` |
| `NavigationBar` | 80 px tall, M3 indicator pill | `AxBottomNav` |
| `DataTable` | Row height & dividers don't match | `AxDataTable` |
| `Switch` | 59×40, ripple | `AxToggle` |
| `AppBar` | Elevation, 56 px, centred-title rules | `AxMobileHeader` |
| `ListTile` | Opinionated 16 px padding & 56 px min height | `AxProviderRow` |
| `Divider` | Default 16 px indent + 0.5 opacity colour | `Container(height: 1, color: AxColors.border)` |
| `GridView` in a Column | Scrolls, is a sliver | `Row`/`Expanded` per Rule 6 |

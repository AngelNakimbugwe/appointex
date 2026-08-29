# 05 — Icon Catalog

## The numbers

| | Count |
|---|---|
| `<svg>` instances across all 21 artboards | 186 |
| …minus 4 decorative confetti circles (see below) | **182** |
| Emitted assets | **60** — 52 `ui`, 2 `duo`, 6 `art` |
| Distinct icons | **44** |

Eight icons appear at more than one stroke-width: `calendar` (2.0 / 2.2),
`check_circle` (2.4 / 2.6), `chevron_left` (2.2 / 2.3 / 2.4), `chevron_right`
(2.2 / 2.3 / 2.5), `lock` (2.0 / 2.2 / 2.4), `map_pin` (2.2 / 2.3 / 2.4 / 2.6),
`plus` (2.4 / 2.5) and `shield` (2.0 / 2.2).

**This matters.** `flutter_svg` can recolour an SVG (via `colorFilter`) but it
cannot restroke one. So each stroke-width is its own asset — 60 files for 44
icons. Sharing one asset across stroke-widths is the first thing that will make
the port read subtly soft or heavy in places.

Naming: within an icon, the most-used stroke-width takes the bare filename and
the rest get a suffix.

```
assets/icons/ui/chevron_left.svg       stroke-width 2.2  (8 uses)
assets/icons/ui/chevron_left_23.svg    stroke-width 2.3
assets/icons/ui/chevron_left_24.svg    stroke-width 2.4
```

Regenerate at any time:

```
$ node tool/design/icons.mjs
182 instances -> 60 assets (52 ui, 2 duo, 6 art), 44 distinct names
```

The script fails loudly if it meets a shape it has no name for, so a redesigned
artboard cannot silently ship an unnamed icon. The full per-asset breakdown is
generated to [`generated/icon-usage.md`](generated/icon-usage.md).

## Three classes of SVG, handled differently

### 1. UI icons — `viewBox="0 0 24 24"`
Monochrome, Lucide-style, stroked or filled with a single colour. These are true
icons: extract, recolour at the call site with `colorFilter`.

### 2. Two-tone UI icons — `AxDuoIcons`
Two of them, and they are the reason this classification exists at all:

| Asset | Colours | What tinting would do |
|---|---|---|
| `check_circle.svg` | `#2E8B57` disc + `#FFFFFF` tick | Tick vanishes — a solid green disc |
| `logo_mark.svg` | white petals + `#FEC89A` centre | Centre disappears into the petals |

The extractor classifies **by counting distinct hex colours in the SVG**, not by
name. One colour → tintable `ui`. More than one → `duo`, copied verbatim.
`AxDuoIcon` deliberately exposes no `color` parameter, so this cannot be got
wrong at a call site.

`check_circle` is the verified badge — one of the most-used marks in the app.
Blanket-tinting it is the single highest-impact mistake available in this port.

### 3. Illustrative art — `viewBox="0 0 48 48"`
Multi-colour decorative drawings that sit inside `AxAvatar` gradients — braids, a
makeup palette, a spa bottle, a camera. **These carry their own colours** (`#C97A5D`,
`#C15B6B`, `#6B3F3A`, `#FFB5A7`, opacity stops) and must **not** be recoloured.

Keep them in a separate folder and a separate Dart class so nobody accidentally
tints one:

```
assets/icons/ui/      -> AxIcons.*      (monochrome, recolourable)
assets/icons/duo/     -> AxDuoIcons.*   (two-tone, never tinted)
assets/icons/art/     -> AxArt.*        (48x48 illustrations, never tinted)
```

### Not icons at all
Four entries in the raw extraction are decorative confetti dots on
Client_Confirmation — plain filled circles at `viewBox="0 0 10 10"`, `8 8`,
`12 12`, `9 9`. Do not make these SVG assets. They are
`Container(decoration: BoxDecoration(shape: BoxShape.circle, color: …))`.

---

## Naming table

Icons ordered by usage. `x` = instances across all artboards.

### Navigation & chrome

| Name | x | Where | Path signature |
|---|---|---|---|
| `chevron_left` | 10 | Back button, 9 screens | `M15 18l-6-6 6-6` |
| `chevron_right` | 3 | Forward, list affordance | `M9 6l6 6-6 6` |
| `chevron_down` | 2 | Location pill, select | `M6 9l6 6 6-6` |
| `home` | 2 | Bottom nav tab 0 | `M3 11l9-7 9 7` + roof |
| `calendar` | 10 | Bottom nav tab 1, biz sidebar | `M16 3v4M8 3v4M3 10h18` |
| `chat` | 2 | Bottom nav tab 2 | `M21 11.5a8.5 8.5 0 01-8.5 8.5H5l-2 2…` |
| `user` | 9 | Bottom nav tab 3, biz sidebar | `circle 12,8 r4` + `M4 21c0-4 4-6 8-6s8 2 8 6` |
| `grid` | 7 | Biz sidebar, Dashboard | four `rect`s |
| `card` | 7 | Biz sidebar, Earnings | `rect 3,6 18x13` + `M3 10h18` |
| `list` | 7 | Biz sidebar, Services | `M8 6h13M8 12h13M8 18h13…` |
| `star_outline` | 8 | Biz sidebar, Featured Spots | `M12 3l2.9 5.9 6.5.9…` |
| `settings` | 7 | Biz sidebar | gear, `circle r3` + `M19.4 15a1.7…` |
| `logo_mark` | 10 | Logo, all headers — two-tone, `AxDuoIcons` | six rotated `ellipse` + `circle r2.4` |

### Content & status

| Name | x | Where | Path signature |
|---|---|---|---|
| `star_fill` | 11 | Ratings — always `#A66A5D` | `M12 2l3.1 6.3 6.9 1-5 4.9…` |
| `check_circle` | 9 | **Verified badge** — two-tone, `AxDuoIcons` | `circle r10` + `M8 12l2.5 2.5L16 9` |
| `bolt_fill` | 8 | **Urgent booking** | `M13 2 4 14h6l-1 8 9-12h-6l1-8z` |
| `bell` | 2 | Home header, Biz Dashboard | `M18 8a6 6 0 00-12 0c0 7-3 9-3 9h18…` |
| `search` | 2 | Home search field, Biz Clients | `circle 11,11 r7` + `M21 21l-4.3-4.3` |
| `map_pin` | 6 | Location — 4 stroke variants | `M12 21c-4-4.3-7-8.3-7-11.8a7 7 0 0114 0…` |
| `check` | 3 | Inline confirm | `M5 13l4 4 10-10` |
| `check_bold` | 1 | Emphasis, sw 3 | `M6 12l4 4 8-8` |
| `plus` | 4 | Add service / add to bundle | `M5 12h14M12 5v14` |
| `lock` | 3 | **Escrow / held payment** | `rect 4,10 16x10` + `M8 10V7a4 4 0 018 0v3` |
| `shield` | 2 | Secure payment, Checkout | `M12 2l7 4v6c0 5-3.5 8-7 10…` |
| `send` | 1 | Chat composer | `M22 2L11 13M22 2l-7 20-4-9-9-4z` |
| `clock` | 1 | Duration | `M12 7v5l3.5 2` |
| `eye` | 1 | Impressions, Featured Spots | `M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z` |
| `filter` | 1 | Search filters | `M4 6h16M7 12h10M10 18h4` |
| `image` | 1 | Photo upload, Biz Onboarding | `M21 15V6a2 2 0 00-2-2H5…` |
| `briefcase` | 1 | Business, canvas map | `M8 7V5a2 2 0 012-2h4a2 2 0 012 2v2` |
| `store` | 1 | Salon location, Book | `M4 9l1-5h14l1 5` |
| `play_fill` | 1 | Media | `M8 5v14l11-7z` |
| `person_fill` | 8 | Client avatars in tables | `circle 12,9 r4` + `M4.5 20c0-4.2 3.4-7 7.5-7…` |

### Category icons — mobile browse grid

Each pairs with its category colours from
[01-DESIGN-TOKENS.md](01-DESIGN-TOKENS.md).

| Name | x | Category | Path signature |
|---|---|---|---|
| `cat_hair` | 2 | Hair | comb — `rect 4,5 16x4` + `M6 9v10M9.5 9v8…` |
| `cat_makeup` | 2 | Makeup | droplet — `M12 3s6 7 6 11a6 6 0 01-12 0…` |
| `cat_nails` | 2 | Nails | polish — `rect 9,3 6x4` + `M8 7h8l1 3v9…` |
| `cat_spa` | 2 | Spa & massage | flower — `M12 3c-4 3-4 8 0 11…` |
| `cat_photography` | 1 | Photography | camera — `M4 8h3l2-2h6l2 2h3v11H4z` |

### Illustrative art — `AxArt`, 48×48, never tinted

| Name | x | Subject | Appears in |
|---|---|---|---|
| `art_makeup` | 8 | Brush + palette + compact | FeaturedSpots, Settings, EventBundle, Home, Provider, Search, Urgent |
| `art_nails` | 5 | Polish rack | FeaturedSpots, Provider, Search, Urgent |
| `art_spa` | 4 | Bottle + waves | FeaturedSpots, Provider, Search |
| `art_braids` | 3 | Braid strands + comb | EventBundle, Home |
| `art_photography` | 1 | Camera body + lens | EventBundle |
| `art_person` | 1 | Figure | Provider |

---

## Extraction pipeline

`tool/design/icons.mjs` reads `.design-src/*.dc.html`, deduplicates on
(normalised shape + stroke-width), and writes:

- `assets/icons/ui/*.svg`, `assets/icons/duo/*.svg`, `assets/icons/art/*.svg`
- `lib/design/icons/ax_icons.dart` — generated constants
- `docs/generated/icon-usage.md` — which screen uses which icon

Each emitted UI icon is normalised so it can be tinted:

```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
     stroke="currentColor" stroke-width="2.2"
     stroke-linecap="round" stroke-linejoin="round">
  <path d="M15 18l-6-6 6-6"/>
</svg>
```

`stroke="currentColor"` plus `SvgPicture.asset(..., colorFilter:
ColorFilter.mode(color, BlendMode.srcIn))` is how the tint is applied.

For **filled** icons (`star_fill`, `bolt_fill`, `play_fill`) the `fill`
attribute becomes `currentColor` instead of `stroke`.

For **art**, nothing is normalised — the file is copied verbatim.

## The `AxIcon` widget

```dart
class AxIcon extends StatelessWidget {
  const AxIcon(this.asset, {super.key, this.size = 20, this.color});

  final String asset;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        asset,
        width: size,
        height: size,
        colorFilter: color == null
            ? null
            : ColorFilter.mode(color!, BlendMode.srcIn),
      );
}
```

`AxDuoIcon` and `AxArt` are the same widget minus the `color` parameter, so
tinting them is not expressible.

The generated `ax_icons.dart` carries a usage comment on every constant, e.g.

```dart
/// 8 uses · Biz_Settings, Client_Book, Client_Checkout, Client_Home, Client_Urgent
static const String boltFill = 'assets/icons/ui/bolt_fill.svg';
```

## Rules

1. **Never substitute a Material or Lucide icon.** Every glyph is drawn by hand
   and small differences read as sloppiness. If an icon is missing from
   `AxIcons`, extract it from the artboard.
2. **Never override stroke-width at the call site.** It cannot be done, and
   trying produces a silently wrong result. Add a variant asset instead.
3. **Never tint `AxDuoIcons` or `AxArt`.** Its colours are part of the design.
4. **Sizes are exact.** The design uses 10, 12, 14, 15, 16, 17, 19, 20, 21 —
   these are not on a scale, they are per-context choices. Copy them.
5. **Preload before goldens.** `SvgPicture` decodes asynchronously; a golden
   test that pumps once will capture blank icons. Use `precachePicture` in the
   test harness, or `await tester.runAsync(...)` then `pumpAndSettle`.
6. **Add `assets/icons/` to `pubspec.yaml`** as a directory entry, not 66
   individual lines.

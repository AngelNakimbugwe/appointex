# 01 — Design Tokens

Every value below was read out of the artboard markup, not chosen. The counts are
occurrences across all 21 `.dc.html` files, so they also tell you what matters.

Tokens live in `lib/design/tokens/`. **A literal `Color(0xFF…)`, `fontSize:` or
`BorderRadius.circular(n)` anywhere outside that folder is a bug.**

---

## Colours — `lib/design/tokens/ax_colors.dart`

### Brand ramp

The identity colour. `brand` alone is 290 of ~1,140 colour occurrences.

| Token | Hex | Uses | Role |
|---|---|---|---|
| `AxColors.brand` | `#6B3F3A` | 290 | Primary. Headings, active nav, primary buttons, logo. |
| `AxColors.brandMid` | `#A66A5D` | 51 | Links, secondary labels, "See all", gradient end. |
| `AxColors.brandDark` | `#4A2B27` | 3 | Link hover / pressed. |
| `AxColors.brandMuted` | `#C9A79D` | 85 | Inactive sidebar nav labels + icons (business only). |
| `AxColors.brandDeepAlt` | `#5A3A33` | 11 | Photography category label, dark-on-salmon text. |

### Accent ramp (the warm "salon" palette)

| Token | Hex | Uses | Role |
|---|---|---|---|
| `AxColors.salmon` | `#FFB5A7` | 76 | Active sidebar row bg, card top-border, AD badge bg. |
| `AxColors.peach` | `#FEC89A` | 54 | Category tile bg, on-brand accent text. |
| `AxColors.sand` | `#F9DCC4` | 16 | Category tile bg, callout panel bg. |
| `AxColors.blush` | `#FCD5CE` | 15 | Avatar gradients. |
| `AxColors.blushPale` | `#F8EDEB` | 30 | Business sidebar bg, avatar gradient start. |
| `AxColors.pinkPale` | `#F5DEE0` | 2 | Nails category tile. |

### Surfaces & borders

| Token | Hex | Uses | Role |
|---|---|---|---|
| `AxColors.surface` | `#FFFFFF` | 144 | Card and mobile page background. |
| `AxColors.canvas` | `#FBFAF7` | 7 | Business dashboard page background. |
| `AxColors.surfaceWarm` | `#F7F5F1` | 16 | Search field, chips, inset panels (mobile). |
| `AxColors.border` | `#ECE7DC` | 40 | **The** border. `1px solid` on cards, table rows, nav bars. |
| `AxColors.borderStrong` | `#E0DBCF` | 19 | Dividers needing more weight. |
| `AxColors.borderSoft` | `#E8E3D8` | 8 | Callout panel borders. |

Also present and mapped 1:1: `#F1EEE6`, `#F0EEE9`, `#EDEAE2`, `#D7D1C2`,
`#C7C2B6`, `#B3ADA0`, `#FDFCFA`, `#EFEFEF`, `#D9BFB8`.

### Text ramp

| Token | Hex | Uses | Role |
|---|---|---|---|
| `AxColors.textStrong` | `#2A2A2A` | 3 | Emphasised numerals. |
| `AxColors.textPrimary` | `#3A3A3A` | 32 | Body copy in callouts. |
| `AxColors.textBody` | `#5B5B5B` | 55 | Standard body / metadata. |
| `AxColors.textMuted` | `#7A7A7A` | 14 | Tertiary. |
| `AxColors.textSubtle` | `#8A8A8A` | 55 | Captions, "Hair · Ntinda". |
| `AxColors.textFaint` | `#9A9A9A` | 49 | Placeholder text, section eyebrows. |
| `AxColors.textDisabled` | `#B3B3B3` | 12 | Inactive bottom-nav labels + icons. |

Note: headings are **never** grey. Every heading is `brand` (`#6B3F3A`).

### Semantic

| Token | Hex | Role |
|---|---|---|
| `AxColors.verified` | `#2E8B57` | ID-verified badge fill. 17 uses — a core product concept. |
| `AxColors.verifiedSoft` | `#5FA777` | Lighter verified variant. |
| `AxColors.verifiedBg` | `#EAF3EC` | Verified pill background. |
| `AxColors.urgentFrom` | `#FF7A4D` | Urgent-booking gradient start. |
| `AxColors.urgentTo` | `#E8433D` | Urgent gradient end; urgent text/price. |
| `AxColors.urgentBgSoft` | `#FFF3EF` | Urgent panel background. |
| `AxColors.urgentTextSoft` | `#FFE4DA` | Subtitle text on the urgent gradient. |
| `AxColors.escrow` | `#3D8B85` | Held-payment / secure indicator. On Provider, Book, Checkout, Biz Settings. |
| `AxColors.escrowMid` | `#4E827E` | |
| `AxColors.escrowDeep` | `#2E6864` | |
| `AxColors.escrowBg` | `#EAF4F3` | |
| `AxColors.escrowBorder` | `#BFDCDA` | |
| `AxColors.pending` | `#9A6B1E` | Pending-state badge text. |
| `AxColors.pendingBg` | `#FBF3E7` | Pending badge background. |

### Category colours

Each browse category owns a background plus a label and icon colour. Keep them
paired — they are used as a set on Home and Search.

| Category | Tile bg | Label | Icon |
|---|---|---|---|
| Hair | `#F9DCC4` | `#B3654A` | `#C97A5D` |
| Makeup | `#FEC89A` | `#A84658` | `#C15B6B` |
| Nails | `#F5DEE0` | `#855868` | `#9C6B7A` |
| Spa & massage | `#F8EDEB` | `#9C6539` | `#B37B4E` |
| Photography | `#FFB5A7` | `#5A3A33` | `#6B4A42` |
| Plan an event | `linear-gradient(135deg,#6B3F3A,#A66A5D)` | `#F9DCC4` | — |

### Payment-brand colours

`#FFCC08` MTN yellow, `#ED1C24` Airtel red — used once each, on Checkout. These
are external brand values: keep them as `AxColors.mtn` / `AxColors.airtel` and do
not fold them into the palette ramps.

### Gradients — `AxGradients`

All are `135deg` except the urgent banner. CSS `135deg` maps to Flutter
`begin: Alignment.topLeft, end: Alignment.bottomRight`.

| Token | Stops | Uses | Where |
|---|---|---|---|
| `avatarPeach` | `#FEC89A → #FFB5A7` | 13 | Provider avatars |
| `logo` | `#6B3F3A → #A66A5D` | 11 | Logo mark, "Plan an event" tile |
| `avatarBlush` | `#F8EDEB → #FFB5A7` | 11 | Provider avatars |
| `avatarSand` | `#F9DCC4 → #FEC89A` | 8 | Provider avatars |
| `avatarPale` | `#F8EDEB → #FCD5CE` | 8 | Provider avatars |
| `avatarRose` | `#FCD5CE → #FFB5A7` | 4 | Provider avatars |
| `avatarSandBlush` | `#F9DCC4 → #FCD5CE` | 2 | Provider avatars |
| `urgent` | `120deg, #FF7A4D → #E8433D` | 2 | Urgent CTA banner |
| `onboardingHero` | `#F8EDEB 0% → #F9DCC4 45% → #FEC89A 100%` | 1 | Client onboarding |

The six `avatar*` gradients rotate per provider. Put them in a
`static const List<Gradient> avatars` and index by a stable hash of the provider
id, so a given provider always renders the same gradient.

---

## Typography — `lib/design/tokens/ax_type.dart`

Two families, and the split is strict:

- **Manrope** — applied via the `.head` class and `h1`/`h2`. Weights **500, 600,
  700, 800**. Bundle the four `.ttf` files under `assets/fonts/` rather than
  fetching at runtime: golden tests are non-deterministic against a network font.
- **System UI** — everything else (`system-ui, -apple-system, "Segoe UI",
  sans-serif`). In Flutter that is simply the platform default, so leave
  `fontFamily` null. Do not substitute Manrope here — the two-family contrast is
  a real part of how the design reads.

### Weight distribution

`700` ×192 · `600` ×95 · `800` ×61 · `500` ×1.

Treat `700` as the default for any label; `800` is reserved for headings and
emphatic numerals.

### The scale

Sizes are dense and include half-steps. The half-steps are deliberate — keep them.

| Token | px | Uses | Typical role |
|---|---|---|---|
| `AxType.display` | 34 | 1 | Canvas map title only |
| `AxType.h1` | 26 | 1 | Onboarding headline |
| `AxType.h2` | 24 | 4 | Screen titles, big numerals |
| `AxType.h3` | 23 / 22 | 5 | Stat values |
| `AxType.h4` | 20 | 10 | Section values, prices |
| `AxType.h5` | 19 / 18 | 3 | |
| `AxType.titleLg` | 17 | 3 | Mobile header title |
| `AxType.title` | 16 | 8 | Card titles |
| `AxType.bodyLg` | 15 | 3 | Paragraphs |
| `AxType.body` | 14.5 / 14 | 35 | Section headers (`.head`, 700) |
| `AxType.bodySm` | 13.5 | 22 | Provider names, list rows |
| `AxType.label` | 13 | 96 | Nav labels, buttons, table cells |
| `AxType.labelSm` | 12.5 | 110 | **Most common.** Metadata, table body |
| `AxType.caption` | 12 | 39 | Captions |
| `AxType.captionSm` | 11.5 | 63 | Sub-metadata |
| `AxType.micro` | 11 | 48 | Badges, chips |
| `AxType.microSm` | 10.5 | 32 | Dense badges |
| `AxType.nano` | 10 | 24 | Bottom-nav labels |
| `AxType.nanoSm` | 9.5 / 9 | 9 | Eyebrows |
| `AxType.tiny` | 8.5 / 8 | 2 | "AD" badge |

Half-pixel sizes are legal in Flutter — pass them through unrounded.

### Letter-spacing & line-height

- Uppercase eyebrows use `letter-spacing: 0.05em–0.08em`. Flutter's
  `letterSpacing` is **logical pixels, not em** — convert with
  `letterSpacing = fontSize * em`. Example: `11.5px` at `0.06em` → `0.69`.
- Headings use `letter-spacing: -0.01em` → a small negative value.
- `line-height: 1.6`–`1.7` on body copy, `1.3` on labels. Flutter's `height:`
  takes the same multiplier directly, so these copy across unchanged.

---

## Radii — `lib/design/tokens/ax_radius.dart`

| Token | px | Uses | Role |
|---|---|---|---|
| `AxRadius.card` | 12 | 34 | Cards, search field, inset panels |
| `AxRadius.tile` | 14 | 32 | Category tiles, stat tiles, banners |
| `AxRadius.md` | 10 | 26 | Avatars, small thumbs |
| `AxRadius.sm` | 8 | 17 | Badges, small chips |
| `AxRadius.xs` | 9 | 14 | Sidebar nav rows, logo mark |
| `AxRadius.lg` | 16 | 9 | Carousel cards |
| `AxRadius.xl` | 18 | 8 | Large panels |
| `AxRadius.pill` | 25 / 24 / 21 / 20 / 19 | 12 | Pills & chips — prefer `StadiumBorder` |
| `AxRadius.dot` | 3 | 3 | Carousel indicator dots |

`border-radius: 50%` on a square element means a circle — use `BoxShape.circle`,
never a radius value.

---

## Spacing — `lib/design/tokens/ax_space.dart`

The design does not use a strict 4/8 grid; it uses a warm, slightly irregular
rhythm. **Do not round these onto a grid** — that is exactly the drift that makes
a port look "close, but off".

Recurring values: `4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 20, 22, 26, 28, 32`.

Structural constants worth naming explicitly:

| Constant | Value |
|---|---|
| Mobile page horizontal padding | `20` |
| Mobile header padding | `20, 20, 20, 14` |
| Mobile bottom nav height | `64`, with `border-top: 1px solid #ECE7DC` |
| Business sidebar width | `220`, padding `22, 14` |
| Business content padding | `26, 32` |
| Business section gap | `22` |
| Stat-tile inner padding | `16, 18` |
| List-row inner padding | `10` |

---

## Elevation

There is **no `box-shadow` anywhere in the design.** Depth is expressed purely
through `1px` borders and background tint.

Set `elevation: 0` and `shadowColor: Colors.transparent` globally in the theme —
otherwise Flutter's Material defaults will silently add shadows to `Card`,
`AppBar`, `NavigationBar` and `Dialog` that the design does not have. This is the
single most common way a Flutter port of a flat design goes wrong.

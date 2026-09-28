# Client · Home

| | |
|---|---|
| **Artboard** | [`.design-src/Client_Home.dc.html`](../../../.design-src/Client_Home.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/home` |
| **Widget** | `lib/features/client/home/presentation/home_screen.dart` |
| **Build order** | client #3 |
| **Icons on screen** | 21 |

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
  div { display:flex; flex-shrink:0; align-items:center; justify-content:space-between; padding:20px 20px 14px }
    div { display:flex; flex-direction:column }
      span { font-size:12px; color:#8A8A8A }  "Good morning"
      span.head { font-size:17px; font-weight:700; color:#6B3F3A }  "Where to today?"
    div { display:flex; gap:10px; align-items:center }
      div { display:flex; gap:4px; align-items:center; padding:7px 12px; background:#F7F5F1; border-radius:20px; font-size:12.5px; font-weight:600; color:#6B3F3A }  "Kampala"
        <svg>
      <svg>
  div { flex-shrink:0; padding:0 20px 18px }
    div { display:flex; gap:10px; align-items:center; padding:12px 14px; background:#F7F5F1; border-radius:12px }
      <svg>
      span { font-size:13.5px; color:#9A9A9A }  "Search stylists, makeup artists, spas…"
  div { display:flex; flex-direction:column; flex:1; gap:22px; padding:0 20px; overflow:hidden }
    div { display:flex; flex-direction:column; gap:8px }
      div { display:flex; gap:12px; overflow:hidden }
        div { display:flex; flex-shrink:0; align-items:center; width:300px; height:112px; padding:0 20px; background:#6B3F3A; border-radius:16px; position:relative; overflow:hidden }
          span { padding:2px 7px; background:#FFB5A7; border-radius:6px; position:absolute; top:10px; right:12px; font-size:8.5px; font-weight:800; color:#6B3F3A; letter-spacing:0.03em }  "AD"
          div { width:140px; height:140px; background:#FFB5A7; border-radius:50%; position:absolute; top:-40px; right:-50px; opacity:0.15 }
          div { display:flex; gap:12px; align-items:center }
            div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:44px; height:44px; background:linear-gradient(135deg,#F8EDEB,#FFB5A7); border-radius:10px }
              <svg>
            div { display:flex; flex-direction:column; gap:4px }
              span.head { font-size:14.5px; font-weight:800; color:#FFFFFF; line-height:1.3 }  "Grace Nabbosa Braids"
              span { font-size:11.5px; color:#FEC89A }  "20% off box braids this week"
              span { font-size:11px; font-weight:700; color:#FEC89A }  "Book now →"
        div { flex-shrink:0; width:40px; height:112px; background:#FFB5A7; border-radius:16px; opacity:0.35 }
      div { display:flex; gap:6px; justify-content:center }
        div { width:16px; height:6px; background:#6B3F3A; border-radius:3px }
        div { width:6px; height:6px; background:#D7D1C2; border-radius:3px }
        div { width:6px; height:6px; background:#D7D1C2; border-radius:3px }
    div { display:flex; flex-direction:column; gap:10px }
      span.head { font-size:14.5px; font-weight:700; color:#6B3F3A }  "Browse by category"
      div { display:grid; grid-template-columns:repeat(3, minmax(0,1fr)); gap:10px }
        div { display:flex; flex-direction:column; gap:6px; align-items:center; padding:14px 6px; background:#F9DCC4; border-radius:14px }
          <svg>
          span { font-size:11.5px; font-weight:700; color:#B3654A }  "Hair"
        div { display:flex; flex-direction:column; gap:6px; align-items:center; padding:14px 6px; background:#FEC89A; border-radius:14px }
          <svg>
          span { font-size:11.5px; font-weight:700; color:#A84658 }  "Makeup"
        div { display:flex; flex-direction:column; gap:6px; align-items:center; padding:14px 6px; background:#F5DEE0; border-radius:14px }
          <svg>
          span { font-size:11.5px; font-weight:700; color:#855868 }  "Nails"
        div { display:flex; flex-direction:column; gap:6px; align-items:center; padding:14px 6px; background:#F8EDEB; border-radius:14px }
          <svg>
          span { font-size:11.5px; font-weight:700; color:#9C6539; text-align:center }  "Spa & massage"
        div { display:flex; flex-direction:column; gap:6px; align-items:center; padding:14px 6px; background:#FFB5A7; border-radius:14px }
          <svg>
          span { font-size:11.5px; font-weight:700; color:#5A3A33 }  "Photography"
        div { display:flex; flex-direction:column; gap:6px; align-items:center; justify-content:center; padding:14px 6px; background:linear-gradient(135deg,#6B3F3A,#A66A5D); border-radius:14px }
          span { font-size:11px; font-weight:700; color:#F9DCC4; line-height:1.3; text-align:center }  "Plan an event"
            br
    div { display:flex; flex-shrink:0; gap:12px; align-items:center; padding:13px 15px; background:linear-gradient(120deg,#FF7A4D,#E8433D); border-radius:14px }
      div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:34px; height:34px; background:rgba(255,255,255,0.22); border-radius:10px }
        <svg>
      div { display:flex; flex-direction:column; flex:1; gap:1px }
        span.head { font-size:13px; font-weight:800; color:#FFFFFF }  "Need it today? Book urgent"
        span { font-size:10.5px; color:#FFE4DA }  "Get matched fast, for a small rush fee"
      <svg>
    div { display:flex; flex-direction:column; gap:10px }
      div { display:flex; align-items:center; justify-content:space-between }
        span.head { font-size:14.5px; font-weight:700; color:#6B3F3A }  "Featured near you"
        span { font-size:12px; font-weight:600; color:#A66A5D }  "See all"
      div { display:flex; gap:12px; align-items:center; padding:10px; border:1px solid #ECE7DC; border-radius:12px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:56px; height:56px; background:linear-gradient(135deg,#F8EDEB,#FCD5CE); border-radius:10px }
          <svg>
        div { display:flex; flex-direction:column; flex:1; gap:3px }
          div { display:flex; gap:5px; align-items:center }
            span { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Grace Nabbosa Braids"
            <svg>
          span { font-size:11.5px; color:#8A8A8A }  "Hair · Ntinda"
          div { display:flex; gap:4px; align-items:center }
            <svg>
            span { font-size:11.5px; color:#5B5B5B }  "4.9 · from UGX 25,000"
      div { display:flex; gap:12px; align-items:center; padding:10px; border:1px solid #ECE7DC; border-radius:12px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:56px; height:56px; background:linear-gradient(135deg,#F9DCC4,#FEC89A); border-radius:10px }
          <svg>
        div { display:flex; flex-direction:column; flex:1; gap:3px }
          div { display:flex; gap:5px; align-items:center }
            span { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Patricia Glam Studio"
            <svg>
          span { font-size:11.5px; color:#8A8A8A }  "Makeup · Kololo"
          div { display:flex; gap:4px; align-items:center }
            <svg>
            span { font-size:11.5px; color:#5B5B5B }  "5.0 · from UGX 60,000"
  div { display:flex; flex-shrink:0; height:64px; border-top:1px solid #ECE7DC }
    div.navicon
      <svg>
      span { font-size:10px; font-weight:700; color:#6B3F3A }  "Home"
    div.navicon
      <svg>
      span { font-size:10px; color:#B3B3B3 }  "Bookings"
    div.navicon
      <svg>
      span { font-size:10px; color:#B3B3B3 }  "Chat"
    div.navicon
      <svg>
      span { font-size:10px; color:#B3B3B3 }  "Profile"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/home/data/fixtures.dart` verbatim.

- `Good morning`
- `Where to today?`
- `Kampala`
- `Search stylists, makeup artists, spas…`
- `AD`
- `Grace Nabbosa Braids`
- `20% off box braids this week`
- `Book now →`
- `Browse by category`
- `Hair`
- `Makeup`
- `Nails`
- `Spa & massage`
- `Photography`
- `Plan an event`
- `Need it today? Book urgent`
- `Get matched fast, for a small rush fee`
- `Featured near you`
- `See all`
- `Grace Nabbosa Braids`
- `Hair · Ntinda`
- `4.9 · from UGX 25,000`
- `Patricia Glam Studio`
- `Makeup · Kololo`
- `5.0 · from UGX 60,000`
- `Home`
- `Bookings`
- `Chat`
- `Profile`

## Tokens on this screen

**Colours** — #6B3F3A (19) · #FFFFFF (7) · #C97A5D (7) · #FFB5A7 (6) · #B3B3B3 (6) · #A66A5D (5) · #C15B6B (5) · #8A8A8A (4) · #FEC89A (4) · #F8EDEB (3) · #F9DCC4 (3) · #ECE7DC (3) · #F7F5F1 (2) · #D7D1C2 (2) · #2E8B57 (2) · #5B5B5B (2) · #4A2B27 (1) · #9A9A9A (1) · #B3654A (1) · #A84658 (1) · #F5DEE0 (1) · #9C6B7A (1) · #855868 (1) · #B37B4E (1) · #9C6539 (1) · #6B4A42 (1) · #5A3A33 (1) · #FF7A4D (1) · #E8433D (1) · #FFE4DA (1) · #FCD5CE (1)

**Font sizes** — 11.5px (10) · 10px (4) · 13.5px (3) · 14.5px (3) · 12px (2) · 11px (2) · 17px (1) · 12.5px (1) · 8.5px (1) · 13px (1) · 10.5px (1)

**Radii** — 14px (7) · 10px (4) · 12px (3) · 3px (3) · 16px (2) · 20px (1) · 6px (1)

**Gradients**

- `linear-gradient(135deg,#F8EDEB,#FFB5A7)`
- `linear-gradient(135deg,#6B3F3A,#A66A5D)`
- `linear-gradient(120deg,#FF7A4D,#E8433D)`
- `linear-gradient(135deg,#F8EDEB,#FCD5CE)`
- `linear-gradient(135deg,#F9DCC4,#FEC89A)`

## Artboard-local CSS classes

`.navicon`

```css
display:flex; flex-direction:column; align-items:center; gap:4px; flex:1;
```


<!-- HANDWRITTEN — everything below this line is preserved by specgen -->







## Purpose

The client's landing tab. Greets the user with location context ("Good morning / Where to today?" + Kampala pill), routes them into search, surfaces a promo carousel, a category browse grid, an urgent-booking banner, and two featured providers. Everything except the header, search bar and bottom nav scrolls.

## Components used

- [x] `AxMobileHeader.home` — greeting block, location pill and bell passed as `actions`
- [x] `AxBottomNav` — in `Scaffold.bottomNavigationBar`, wrapped in `MediaQuery.withClampedTextScaling(1.2)` per Rule 13
- [x] `AxAvatar` — carousel (44/r10) and provider rows (56/r10) via the local row below
- [x] `AxVerifiedBadge`, `AxIcon` — direct
- [ ] `AxProviderRow` / `AxRating` — **not used; local fork instead** (see Open questions)
- Screen-local widgets in `presentation/widgets/`: `HomeCarousel` (full-width snap pages + tracking dots + AD badge), `HomeCategoryGrid` (3-across `Row` of `Expanded` per Rule 6, last cell is the gradient event tile), `HomeUrgentBanner`, `FeaturedProviderRow`

## Data model

`lib/features/client/home/data/fixtures.dart` — plain const model classes, no Riverpod yet:

- `HomePromo` → `kHomePromos` (badge, title, subtitle, cta, avatarArt, avatarGradient)
- `HomeCategory` → `kHomeCategories` (label, icon, background, iconColor, labelColor — the documented category colour sets)
- `HomeProvider` → `kHomeFeaturedProviders` (id, name, subtitle, rating, avatarArt, avatarGradient, `avatarArtScale` — 0.55 for Grace / 0.52 for Patricia, artboard lines 110/121)
- Plain strings: `kHomeGreeting`, `kHomeTitle`, `kHomeLocation`, `kHomeSearchPlaceholder`, `kHomeCategoriesHeading`, `kHomeEventTileLabel` (`'Plan an\nevent'`), `kHomeUrgentTitle`, `kHomeUrgentSubtitle`, `kHomeFeaturedHeading`, `kHomeSeeAll`

## Interactions & states

| Element | Interaction | Result |
|---|---|---|
| Search bar | tap | `context.go('/search')` |
| Urgent banner | tap | `context.go('/home/urgent')` |
| Event tile ("Plan an event") | tap | `context.go('/event')` |
| Featured provider rows | tap | `context.go('/provider/:id')` (`grace-nabbosa`, `patricia-glam`) |
| "See all" | tap | `context.go('/search')` |
| Bottom nav | tap | Home `/home`, Bookings `/bookings`, Chat `/chat`, Profile `/profile` |

Not wired (no destination specified in the design — Phase 4): location pill, bell, carousel card, the five category tiles.

**States not in the artboard** — the artboards are static frames:

- Loading: out of scope (fixtures only; no repository yet)
- Empty: out of scope
- Error: out of scope
- Pressed / hover: Phase 4 (design has no pressed states; theme already strips ripples)
- Disabled: out of scope

## Responsive notes

- Scroll region: `Expanded > SingleChildScrollView` holding carousel, categories, urgent banner, featured list with the artboard's 22px section gap. Header block + search bar and bottom nav stay fixed (Rule 3).
- Kept fixed (intrinsic, Rule 4/5): carousel height 112, banner icon box 34, dots 16/6/6, avatar sizes. (The card itself is now flexible — see the deviation note below.)
- Made flexible: category grid = `Row`s of `Expanded` inside `IntrinsicHeight` (Rule 6) so "Spa & massage" wraps to two lines and stretches its row; search bar, banner, rows and carousel cards stretch full width; every section except the carousel carries the 20px horizontal padding — the carousel's `PageView` carries its own edge padding (Rule 7).
- At 320px / 1.3 textScaler: names and labels wrap, tiles grow — no overflow (verified in the matrix test).
- **Deliberate product deviation (post-artboard call):** the carousel is now a snapping `PageView` of **full-width cards** (viewport minus the 20px page padding) that **auto-advances every 2 s** (wrapping around, rescheduling on any manual interaction, skipping a tick while a scroll is in flight) with dots that track and jump to pages. This replaces the artboard's static 300px card + 40px peek teaser (Client_Home.dc.html lines 48-49, 59); the golden was regenerated accordingly and no longer matches those two lines. Fixture note: the artboard supplies copy for one promo only, so it rotates through all three dot-slots (`kHomeCarouselPromos`) until real campaign data exists.
- Urgent banner's 120deg gradient uses `AxGradients.urgent` (Rule 9 shallow-diagonal approximation, decided in tokens).
- Local non-token constants, each citing the artboard line: location pill radius 20 (line 26), AD badge radius 6 (line 44), urgent title/subtitle gap 1 (line 97).

## Open questions

- [ ] `AxRating`'s text is not in a `Flexible`, so its min-size `Row` overflows (2.8px at 390×1.0, 75px at 1.3 under the test font) — the shared widget needs the same treatment as `AxProviderRow`'s name. Until then this screen uses a local `FeaturedProviderRow` that mirrors `AxProviderRow.standard` exactly but ellipsizes the rating line. Delete the local row once `AxRating`/`AxProviderRow` are fixed.
- [ ] The artboard's featured rows carry **no** AD badge, so the standard (not `.featured`) row variant is the faithful one — the `.featured` constructor appears to target other screens. Confirm.
- [ ] `AxAvatar` draws art at a fixed 55%; artboard line 121 draws Patricia's art at 52%. The local row honours the per-provider scale; the shared widget should grow a scale/child parameter before `AxProviderRow` can be reused here.
- [ ] `pubspec.yaml` asset entry `- assets/icons/` bundles nothing — Flutter directory entries are non-recursive, so `assets/icons/ui|duo|art/` were added (report to lead; docs/05 guidance needs updating).
- [ ] Destinations for location pill, bell, carousel cards and category tiles are unspecified in the design.
- [ ] The test environment's fallback font (Ahem, 1em advance) renders body copy as boxes and wraps strings a real font would not; goldens are deterministic but text-shape comparison needs the real font (CI / Layer-2 review).

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes
- [x] No literal colours or font sizes outside `design/tokens/`
- [x] Layer-2 side-by-side reviewed — verified programmatically (widget-geometry probe + ~70 pixel samples against artboard literals: all backgrounds, gradients incl. the decor-circle and peek blends, borders, dots, glyph and icon colours match); model cannot view images, so human eyeball sign-off is still pending

# Client · Search results

| | |
|---|---|
| **Artboard** | [`.design-src/Client_Search.dc.html`](../../../.design-src/Client_Search.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/search` |
| **Widget** | `lib/features/client/search/presentation/search_screen.dart` |
| **Build order** | client #5 |
| **Icons on screen** | 14 |

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
    span.head { flex:1; font-size:16px; font-weight:700; color:#6B3F3A }  "Makeup artists"
    <svg>
  div { display:flex; flex-shrink:0; gap:8px; padding:14px 16px; overflow:hidden }
    div.chip { background:#6B3F3A; color:#FFFFFF }  "Kampala"
    div.chip  "Price"
    div.chip  "Rating 4.5+"
    div.chip  "Available today"
  div { display:flex; flex-direction:column; flex:1; gap:16px; padding:2px 16px 16px; overflow:hidden }
    div { display:flex; flex-direction:column; gap:8px }
      span.head { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Featured in Makeup"
      div { display:flex; gap:10px; overflow:hidden }
        div { display:flex; flex-direction:column; flex-shrink:0; gap:6px; width:108px }
          div { display:flex; align-items:center; justify-content:center; width:108px; height:80px; background:linear-gradient(135deg,#F8EDEB,#FFB5A7); border-radius:12px }
            <svg>
          span { font-size:11.5px; font-weight:700; color:#6B3F3A; line-height:1.25 }  "Patricia Glam Studio"
          span { font-size:10.5px; color:#8A8A8A }  "5.0 ★ · Kololo"
        div { display:flex; flex-direction:column; flex-shrink:0; gap:6px; width:108px }
          div { display:flex; align-items:center; justify-content:center; width:108px; height:80px; background:linear-gradient(135deg,#F8EDEB,#FCD5CE); border-radius:12px }
            <svg>
          span { font-size:11.5px; font-weight:700; color:#6B3F3A; line-height:1.25 }  "Faces by Immaculate"
          span { font-size:10.5px; color:#8A8A8A }  "4.8 ★ · Ntinda"
        div { display:flex; flex-direction:column; flex-shrink:0; gap:6px; width:108px }
          div { display:flex; align-items:center; justify-content:center; width:108px; height:80px; background:linear-gradient(135deg,#F9DCC4,#FEC89A); border-radius:12px }
            <svg>
          span { font-size:11.5px; font-weight:700; color:#6B3F3A; line-height:1.25 }  "Glow by Sandra"
          span { font-size:10.5px; color:#8A8A8A }  "4.9 ★ · Muyenga"
    div { display:flex; flex-direction:column; gap:10px; overflow:hidden }
      span.head { font-size:13.5px; font-weight:700; color:#6B3F3A }  "All makeup artists · 28"
      div { display:flex; gap:12px; padding:12px; border:1px solid #ECE7DC; border-radius:14px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:68px; height:68px; background:linear-gradient(135deg,#FCD5CE,#FFB5A7); border-radius:12px }
          <svg>
        div { display:flex; flex-direction:column; flex:1; gap:4px }
          div { display:flex; gap:5px; align-items:center }
            span { font-size:14px; font-weight:700; color:#6B3F3A }  "Ritah's Touch Makeup"
            <svg>
          div { display:flex; gap:4px; align-items:center }
            <svg>
            span { font-size:11.5px; color:#5B5B5B }  "4.9 (74) · Naguru"
          span { font-size:12.5px; color:#7A7A7A }  "Editorial & soft glam"
          span { font-size:13px; font-weight:700; color:#6B3F3A }  "from UGX 50,000"
      div { display:flex; gap:12px; padding:12px; border:1px solid #ECE7DC; border-radius:14px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:68px; height:68px; background:linear-gradient(135deg,#F9DCC4,#FCD5CE); border-radius:12px }
          <svg>
        div { display:flex; flex-direction:column; flex:1; gap:4px }
          div { display:flex; gap:5px; align-items:center }
            span { font-size:14px; font-weight:700; color:#6B3F3A }  "Nina's Beauty Bar"
            <svg>
          div { display:flex; gap:4px; align-items:center }
            <svg>
            span { font-size:11.5px; color:#5B5B5B }  "4.7 (63) · Bugolobi"
          span { font-size:12.5px; color:#7A7A7A }  "Everyday glam & makeovers"
          span { font-size:13px; font-weight:700; color:#6B3F3A }  "from UGX 35,000"
      div { display:flex; gap:12px; padding:12px; border:1px solid #ECE7DC; border-radius:14px }
        div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:68px; height:68px; background:linear-gradient(135deg,#F8EDEB,#FCD5CE); border-radius:12px }
          <svg>
        div { display:flex; flex-direction:column; flex:1; gap:4px }
          div { display:flex; gap:5px; align-items:center }
            span { font-size:14px; font-weight:700; color:#6B3F3A }  "Comfort Namutebi Makeup"
            <svg>
          div { display:flex; gap:4px; align-items:center }
            <svg>
            span { font-size:11.5px; color:#5B5B5B }  "4.6 (21) · Kansanga"
          span { font-size:12.5px; color:#7A7A7A }  "New to Appointex"
          span { font-size:13px; font-weight:700; color:#6B3F3A }  "from UGX 30,000"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/search/data/fixtures.dart` verbatim.

- `Makeup artists`
- `Kampala`
- `Price`
- `Rating 4.5+`
- `Available today`
- `Featured in Makeup`
- `Patricia Glam Studio`
- `5.0 ★ · Kololo`
- `Faces by Immaculate`
- `4.8 ★ · Ntinda`
- `Glow by Sandra`
- `4.9 ★ · Muyenga`
- `All makeup artists · 28`
- `Ritah's Touch Makeup`
- `4.9 (74) · Naguru`
- `Editorial & soft glam`
- `from UGX 50,000`
- `Nina's Beauty Bar`
- `4.7 (63) · Bugolobi`
- `Everyday glam & makeovers`
- `from UGX 35,000`
- `Comfort Namutebi Makeup`
- `4.6 (21) · Kansanga`
- `New to Appointex`
- `from UGX 30,000`

## Tokens on this screen

**Colours** — #6B3F3A (22) · #C15B6B (12) · #FFB5A7 (8) · #FFFFFF (5) · #A66A5D (4) · #ECE7DC (4) · #FCD5CE (4) · #5A3A33 (4) · #F8EDEB (3) · #8A8A8A (3) · #FEC89A (3) · #2E8B57 (3) · #5B5B5B (3) · #7A7A7A (3) · #D98B96 (2) · #C97A5D (2) · #9C6B7A (2) · #F9DCC4 (2) · #E0DBCF (1) · #3A3A3A (1)

**Font sizes** — 11.5px (6) · 10.5px (3) · 14px (3) · 12.5px (3) · 13px (3) · 13.5px (2) · 12px (1) · 16px (1)

**Radii** — 12px (6) · 14px (3) · 16px (1)

**Gradients**

- `linear-gradient(135deg,#F8EDEB,#FFB5A7)`
- `linear-gradient(135deg,#F8EDEB,#FCD5CE)`
- `linear-gradient(135deg,#F9DCC4,#FEC89A)`
- `linear-gradient(135deg,#FCD5CE,#FFB5A7)`
- `linear-gradient(135deg,#F9DCC4,#FCD5CE)`

## Artboard-local CSS classes

`.chip`

```css
font-size:12px; font-weight:600; padding:7px 13px; border-radius:16px; border:1px solid #E0DBCF; color:#3A3A3A; white-space:nowrap;
```


<!-- HANDWRITTEN — everything below this line is preserved by specgen -->







## Purpose

Search results for a category ("Makeup artists"). The user reviews active filter chips, a "Featured in Makeup" carousel and the full result list with ratings and from-prices, and drills into any provider (featured card or result row) to view detail and book.

## Components used

- [x] `AxChip` — exact `.chip` match (7/13 padding, radius 16, `#E0DBCF` border, `softWrap: false`)
- [x] `AxAvatar` — result rows 68px radius 12, art via `child` at the artboard's 52% (35.36)
- [x] `AxRating` — wrapped in `FittedBox(fit: scaleDown)` because its internal `Row` cannot wrap; a no-op whenever the line fits (see Open questions)
- [x] `AxVerifiedBadge`
- [x] `AxIcon` — `chevronLeft`, `filter`, `starFill` (via `AxRating`), `artMakeup`/`artNails`/`artSpa` via `AxArt`
- [ ] `AxMobileHeader` — **not used**: artboard header is the 56px `0 16` bordered bar (line 20); local `_Header` (same as Client_Urgent — see that spec's Open questions).
- [ ] `AxProviderRow` — **not used**: no variant matches this artboard's row (padding 12, radius 14, avatar 68/r12, name 14/700, column gap 4, service line, price line with `margin-top:2`). Local `SearchResultRow`.
- Local: `_FilterChipRow`, `_FeaturedSection`, `FeaturedCard` (108px fixed-width card with 108×80 gradient tile) — `FeaturedCard`/`SearchResultRow` live in `presentation/widgets/`.

## Data model

`lib/features/client/search/data/fixtures.dart` — `SearchChip`,
`SearchFeaturedProvider`, `SearchResult` (id, name, rating, service, price,
art, gradient) plus `kSearchChips`, `kSearchFeatured`, `kSearchResults` and the
`kSearch*` copy constants. Featured sublines carry the literal `★` character
(`5.0 ★ · Kololo`), not an icon.

## Interactions & states

| Element | Interaction | Result |
|---|---|---|
| Back arrow | tap | `context.pop()` |
| Featured card | tap | `context.go('/provider/:id')` (fixture ids) |
| Result row | tap | `context.go('/provider/:id')` (fixture ids) |
| Filter chip | tap | Phase 4 — toggle selected state |
| Filter icon (header) | tap | Phase 4 — filter sheet not specified by artboard |

- Loading: out of scope (fixtures only)
- Empty: out of scope
- Error: out of scope
- Pressed / hover: Phase 4
- Disabled: n/a

## Responsive notes

- Scroll region: body below the fixed 56px header and the fixed chip row (Rule 3).
- Kept fixed: header 56; featured card 108 wide, tile 80 tall, radius 12; result avatar 68 (art 35.36).
- The chip row and the featured carousel are horizontal scrollers — `SingleChildScrollView` + `Row`, not `ListView`: a horizontal `ListView` requires a bounded cross-axis height that the artboard does not specify (chips are content-sized), and inventing one would break at `textScaler 1.3`. Cards never wrap.
- Featured names wrap at `line-height` 1.25; result names wrap in `Flexible` (CSS-equivalent span wrapping).
- Result-row name is 14px, which has no `AxType` token — passed as a local const citing artboard line 69.
- Behaviour at 320 px / 900 px: verified no overflow at 320/390/430 and textScaler 1.3; at 320 the chip row and carousel scroll. 900 px is out of scope (client mobile).

## Open questions

- [ ] Same 56px bordered header as Client_Urgent (and Book/Checkout/EventBundle) — candidate for a shared `AxMobileHeader` variant.
- [ ] `AxRating`'s internal `Row(mainAxisSize: min)` cannot wrap; this screen wraps it in `FittedBox(scaleDown)`, which is a no-op at real-font metrics but shrinks the line under the test font at 320×1.3. A `Flexible`-friendly AxRating would remove the guard.
- [ ] `AxProviderRow` has no search-result variant (padding 12, radius 14, 68px avatar, 14px name, service + price lines) — shared widget could grow one.
- [ ] Chip toggling, the header filter icon and the `· 28` result count are static fixture data; wiring is Phase 4.
- [ ] No bottom nav on this artboard — confirmed absent, none embedded.

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes
- [x] No literal colours or font sizes outside `design/tokens/`
- [ ] Layer-2 side-by-side reviewed and signed off

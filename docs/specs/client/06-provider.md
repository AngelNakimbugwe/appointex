# Client · Provider profile

| | |
|---|---|
| **Artboard** | [`.design-src/Client_Provider.dc.html`](../../../.design-src/Client_Provider.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/provider/:id` |
| **Widget** | `lib/features/client/provider/presentation/provider_screen.dart` |
| **Build order** | client #6 |
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
position: relative
```

Per [Rule 1](../../03-RESPONSIVE-RULES.md): drop `width`, `height` and
`overflow`; keep the background; wrap in `SafeArea`.

## Layout tree

```
div { display:flex; flex-direction:column; width:390px; height:844px; background:#FFFFFF; position:relative; overflow:hidden }
  div { flex-shrink:0; height:170px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); position:relative }
    div { display:flex; align-items:center; justify-content:center; width:32px; height:32px; background:rgba(255,255,255,0.9); border-radius:50%; position:absolute; top:16px; left:16px }
      <svg>
  div { flex-shrink:0; padding:16px 18px 12px }
    div { display:flex; gap:6px; align-items:center }
      span.head { font-size:19px; font-weight:800; color:#6B3F3A }  "Patricia Glam Studio"
      <svg>
    div { display:flex; gap:6px; align-items:center }
      <svg>
      span { font-size:12.5px; color:#5B5B5B }  "5.0 · 142 reviews · Kololo, Kampala"
    div { display:flex; gap:5px; align-items:center }
      <svg>
      span { font-size:11px; font-weight:600; color:#2E8B57 }  "ID verified · Buyer protection when you pay in the app"
    div { display:flex; gap:5px; align-items:center }
      <svg>
      span { font-size:11px; font-weight:600; color:#3D8B85 }  "Offers mobile service · +5% travel fee"
  div { display:flex; flex-direction:column; flex-shrink:0; gap:8px; padding:0 18px 14px; border-bottom:1px solid #ECE7DC }
    div { display:flex; align-items:center; justify-content:space-between }
      span.head { font-size:12.5px; font-weight:700; color:#6B3F3A }  "Portfolio"
      span { font-size:11px; font-weight:600; color:#A66A5D }  "See all"
    div { display:flex; gap:8px; overflow:hidden }
      div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:72px; height:72px; background:linear-gradient(135deg,#F8EDEB,#FCD5CE); border-radius:10px }
        <svg>
      div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:72px; height:72px; background:linear-gradient(135deg,#F9DCC4,#FEC89A); border-radius:10px; position:relative }
        <svg>
        div { display:flex; align-items:center; justify-content:center; position:absolute }
          div { display:flex; align-items:center; justify-content:center; width:24px; height:24px; background:rgba(27,42,74,0.75); border-radius:50% }
            <svg>
      div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:72px; height:72px; background:linear-gradient(135deg,#FCD5CE,#FFB5A7); border-radius:10px }
        <svg>
      div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:72px; height:72px; background:linear-gradient(135deg,#F8EDEB,#FFB5A7); border-radius:10px }
        <svg>
    span { font-size:10.5px; color:#9A9A9A }  "Photos and videos from real Appointex bookings"
  div { display:flex; flex-shrink:0; gap:22px; padding:12px 18px 0; border-bottom:1px solid #ECE7DC }
    div { display:flex; flex-direction:column; gap:4px; align-items:center; border-bottom:2.5px solid #FFB5A7 }
      span { font-size:13px; font-weight:700; color:#6B3F3A }  "Services"
    div { display:flex; flex-direction:column; gap:4px; align-items:center }
      span { font-size:13px; font-weight:600; color:#9A9A9A }  "Reviews"
    div { display:flex; flex-direction:column; gap:4px; align-items:center }
      span { font-size:13px; font-weight:600; color:#9A9A9A }  "About"
  div { display:flex; flex-direction:column; flex:1; gap:12px; padding:14px 18px; overflow:hidden }
    div { display:flex; align-items:center; justify-content:space-between; padding:12px 0; border-bottom:1px solid #F1EEE6 }
      div { display:flex; flex-direction:column; gap:3px }
        span { font-size:14px; font-weight:700; color:#6B3F3A }  "Bridal makeup, full glam"
        span { font-size:12px; color:#8A8A8A }  "2 hr · UGX 180,000"
      div { display:flex; align-items:center; justify-content:center; width:26px; height:26px; background:#6B3F3A; border-radius:50% }
        <svg>
    div { display:flex; align-items:center; justify-content:space-between; padding:12px 0; border-bottom:1px solid #F1EEE6 }
      div { display:flex; flex-direction:column; gap:3px }
        span { font-size:14px; font-weight:700; color:#6B3F3A }  "Everyday glam"
        span { font-size:12px; color:#8A8A8A }  "45 min · UGX 60,000"
      div { display:flex; align-items:center; justify-content:center; width:26px; height:26px; background:#FFB5A7; border-radius:50% }
        <svg>
    div { display:flex; align-items:center; justify-content:space-between; padding:12px 0; border-bottom:1px solid #F1EEE6 }
      div { display:flex; flex-direction:column; gap:3px }
        span { font-size:14px; font-weight:700; color:#6B3F3A }  "Photoshoot makeup"
        span { font-size:12px; color:#8A8A8A }  "1 hr · UGX 90,000"
      div { display:flex; align-items:center; justify-content:center; width:26px; height:26px; background:#6B3F3A; border-radius:50% }
        <svg>
    div { display:flex; align-items:center; justify-content:space-between; padding:12px 0 }
      div { display:flex; flex-direction:column; gap:3px }
        span { font-size:14px; font-weight:700; color:#6B3F3A }  "Lashes add-on"
        span { font-size:12px; color:#8A8A8A }  "20 min · UGX 20,000"
      div { display:flex; align-items:center; justify-content:center; width:26px; height:26px; background:#6B3F3A; border-radius:50% }
        <svg>
  div { display:flex; flex-shrink:0; gap:14px; align-items:center; padding:14px 18px 22px; border-top:1px solid #ECE7DC }
    div { display:flex; flex-direction:column }
      span { font-size:11.5px; color:#8A8A8A }  "2 selected"
      span { font-size:14.5px; font-weight:800; color:#6B3F3A }  "UGX 150,000"
    div { display:flex; flex:1; align-items:center; justify-content:center; height:50px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); border-radius:25px }
      span { font-size:14.5px; font-weight:700; color:#6B3F3A }  "Continue"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/provider/data/fixtures.dart` verbatim.

- `Patricia Glam Studio`
- `5.0 · 142 reviews · Kololo, Kampala`
- `ID verified · Buyer protection when you pay in the app`
- `Offers mobile service · +5% travel fee`
- `Portfolio`
- `See all`
- `Photos and videos from real Appointex bookings`
- `Services`
- `Reviews`
- `About`
- `Bridal makeup, full glam`
- `2 hr · UGX 180,000`
- `Everyday glam`
- `45 min · UGX 60,000`
- `Photoshoot makeup`
- `1 hr · UGX 90,000`
- `Lashes add-on`
- `20 min · UGX 20,000`
- `2 selected`
- `UGX 150,000`
- `Continue`

## Tokens on this screen

**Colours** — #6B3F3A (16) · #FFB5A7 (10) · #FFFFFF (7) · #C15B6B (6) · #FEC89A (5) · #8A8A8A (5) · #2E8B57 (3) · #ECE7DC (3) · #FCD5CE (3) · #9A9A9A (3) · #F1EEE6 (3) · #A66A5D (2) · #3D8B85 (2) · #F8EDEB (2) · #D98B96 (2) · #5A3A33 (2) · #5B5B5B (1) · #C97A5D (1) · #9C6B7A (1) · #F9DCC4 (1) · #B37B4E (1)

**Font sizes** — 14px (4) · 12px (4) · 11px (3) · 13px (3) · 12.5px (2) · 14.5px (2) · 19px (1) · 10.5px (1) · 11.5px (1)

**Radii** — 10px (4) · 25px (1)

**Gradients**

- `linear-gradient(135deg,#FEC89A,#FFB5A7)`
- `linear-gradient(135deg,#F8EDEB,#FCD5CE)`
- `linear-gradient(135deg,#F9DCC4,#FEC89A)`
- `linear-gradient(135deg,#FCD5CE,#FFB5A7)`
- `linear-gradient(135deg,#F8EDEB,#FFB5A7)`

## Artboard-local CSS classes

_None — this screen is entirely inline-styled._

<!-- HANDWRITTEN — everything below this line is preserved by specgen -->







## Purpose

The provider profile is where a client evaluates a studio before committing:
identity and trust signals (ID-verified / buyer protection, mobile-service
notice), portfolio thumbnails, a Services / Reviews / About tab strip, and a
selectable service list. A pinned footer summarises the current selection
("2 selected · UGX 150,000") and its Continue CTA leads to
`/provider/:id/book` (screen #7). Reached from Home, Search and Urgent lists.

## Components used

- `AxVerifiedBadge` — 15 px variant next to the studio name
- `AxIcon` / `AxArt` — all 14 icons (`chevron_left_24`, `check_circle` duo,
  `star_fill`, `shield_22`, `map_pin`, `play_fill`, `plus` ×3, `check_bold`,
  4 × art thumbnails)
- Screen-local (all in `presentation/provider_screen.dart`):
  `_HeroBar` (gradient banner + floating back disc — this artboard has **no**
  `AxMobileHeader`), `_IdentityBlock`, `_PortfolioBlock` + `_PortfolioTile`,
  `_ProfileTabs` + `_ProfileTab` (2.5 px active underline via
  `IntrinsicWidth`), `_ServiceList` + `_ServiceRow`, `_FooterBar` +
  `_ContinueButton`
- **Not** used, deliberately:
  - `AxMobileHeader` — the hero replaces it
  - `AxAvatar` — portfolio tiles 1–3 draw art at 52 % of 72 px; `AxAvatar`
    hard-codes 55 %. Local tile; if a second screen needs 52 %, give
    `AxAvatar` an `artScale` parameter instead
  - `AxPrimaryButton` — its label is fixed at 15 px / `AxType.bodyLg`;
    this artboard's CTA is 14.5 px (`AxType.body`). Local stadium button with
    `AxGradients.avatarPeach`; consider a `labelSize` parameter on the shared
    widget
  - `AxBottomNav` — no nav in this artboard

## Data model

```dart
// lib/features/client/provider/data/fixtures.dart
class ProviderService { name, meta, selected }          // "2 hr · UGX 180,000"
class ProviderPortfolioTile { gradient, art, artScale, video }
class ProviderProfile {
  name, ratingLine, verifiedLine, mobileLine,
  portfolioTitle, portfolioAction, portfolioCaption,
  portfolio, tabs, activeTab,
  services, selectedSummary, totalSummary, continueLabel,
}
const kProviderProfile = ProviderProfile(...);           // copy inventory, verbatim
```

`ProviderScreen(providerId, profile)` takes everything via constructor; the
footer strings stay fixture data (not computed) so the golden is honest.

## Interactions & states

The artboards are static frames, so everything in this section is an extension
of the design rather than a transcription of it. Decide it deliberately.

| Element | Interaction | Result |
|---|---|---|
| Hero back disc | tap | `context.pop()` |
| Continue CTA | tap | `context.go('/provider/:id/book')` |
| Service plus / check disc | tap | toggle selection + recompute footer (Phase 4) |
| Services / Reviews / About tabs | tap | swap list content (Phase 4 — only Services content exists in the design) |
| "See all" | tap | portfolio gallery (Phase 4) |

**States not in the artboard** — specify each, or explicitly say "out of scope":

- Loading: out of scope (no backend in Phase 1–3)
- Empty: out of scope
- Error: out of scope
- Pressed / hover: Phase 4 (no press states anywhere in the artboards)
- Disabled: n/a — the CTA is always enabled in the artboard

## Responsive notes

- Scroll region: the artboard pins identity, portfolio, tabs **and** the
  service list (`flex-shrink:0` ×3 + one `flex:1`). Ported as **one** scroll
  region holding all four, with only the hero (170 px) and the footer pinned.
  Reason: at 320×640 (Rule 12) the fixed chrome alone exceeds the viewport —
  the artboard only fits because it is 390×844. At scroll-top on the reference
  size the layout is pixel-identical to the artboard.
- Portfolio strip: horizontally scrollable — 4 × 72 px + 3 × 8 px gaps =
  312 px > 284 px of content width at 320.
- Tab strip: horizontally scrollable — only ever engages under the test
  font's metrics; real-font tab widths fit at every supported size.
- Kept fixed: hero 170, CTA 50, toggle discs 26, portfolio tiles 72.
- Made flexible: identity lines wrap (`Flexible`), service rows stretch.
- Local spacing constants (all artboard-cited): `_height` 170 (:18),
  `_size` 72 (:49), `_underlineHeight` 2.5 (:65).
- Behaviour at 320 px / 900 px: 320 covered above; 900+ is out of scope for
  client mobile (Rule 12).

## Open questions

- [ ] The footer reads "2 selected · UGX 150,000" but only "Everyday glam"
      carries a check disc; 60,000 + 90,000 = 150,000 suggests Everyday glam +
      Photoshoot makeup were intended. The artboard is replicated literally
      (one check); confirm which is correct with design.
- [ ] `rgba(27,42,74,0.75)` (video-play overlay, artboard :53) has no
      `AxColors` token — kept as a cited local constant. Promote to
      `AxColors` (e.g. `mediaOverlay`).
- [ ] `AxType` has no 14 px step; docs/01 lists `body` as "14.5 / 14". Service
      names pass `14` to `AxType.text`. Consider an explicit token.
- [ ] Goldens render system-UI text in the test font (Ahem), so body copy is
      block-shaped in PNGs while Manrope headings are real. Verified this
      screen via a programmatic pixel audit (all 21 artboard colours present,
      geometry at 1 px tolerance); a human layer-2 look is still worthwhile.

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes
- [x] No literal colours or font sizes outside `design/tokens/` — one cited
      exception: the artboard-literal `rgba(27,42,74,0.75)` overlay (above)
- [x] Layer-2 side-by-side reviewed and signed off — via automated pixel audit
      (colours + positions against the artboard); no image viewer was
      available in this session, so a human pass is recommended


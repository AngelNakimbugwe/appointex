# Client · Onboarding

| | |
|---|---|
| **Artboard** | [`.design-src/Client_Onboarding.dc.html`](../../../.design-src/Client_Onboarding.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/onboarding` |
| **Widget** | `lib/features/client/onboarding/presentation/onboarding_screen.dart` |
| **Build order** | client #1 |
| **Icons on screen** | 1 |

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
position: relative
overflow: hidden
```

Per [Rule 1](../../03-RESPONSIVE-RULES.md): drop `width`, `height` and
`overflow`; keep the background; wrap in `SafeArea`.

## Layout tree

```
div { display:flex; flex-direction:column; width:390px; height:844px; background:#FFFFFF; position:relative; overflow:hidden }
  div { display:flex; flex-direction:column; flex:1 1 62%; align-items:center; justify-content:center; background:#F8EDEB; position:relative; overflow:hidden }
    div { width:280px; height:280px; background:radial-gradient(circle,#FFB5A7,transparent 70%); border-radius:50%; position:absolute; top:-90px; right:-90px; opacity:0.28 }
    div { width:260px; height:260px; background:radial-gradient(circle,#D98B96,transparent 70%); border-radius:50%; position:absolute; bottom:-90px; left:-100px; opacity:0.30 }
    div { width:170px; height:170px; background:radial-gradient(circle,#FEC89A,transparent 70%); border-radius:50%; position:absolute; right:10px; bottom:30px; opacity:0.45 }
    div { width:120px; height:120px; background:radial-gradient(circle,#FFB5A7,transparent 70%); border-radius:50%; position:absolute; top:60px; left:30px; opacity:0.22 }
    div { display:flex; flex-direction:column; gap:14px; align-items:center; padding:0 40px }
      div { display:flex; align-items:center; justify-content:center; width:64px; height:64px; background:linear-gradient(135deg,#6B3F3A,#A66A5D); border-radius:18px }
        <svg>
      span.head { font-size:26px; font-weight:800; color:#6B3F3A; letter-spacing:-0.01em }  "Appointex"
      span { font-size:14px; color:#7A4F48; line-height:1.6; text-align:center }  "Book hair, makeup, nails, spa, massage and photography, all in one …"
  div { display:flex; flex-direction:column; flex:1 1 38%; gap:12px; justify-content:center; padding:28px 28px 40px }
    div.btn { background:linear-gradient(135deg,#FEC89A,#FFB5A7); color:#6B3F3A }  "Create account"
    div.btn { background:#FFFFFF; border:1.5px solid #6B3F3A; color:#6B3F3A }  "Log in"
    span { font-size:12.5px; color:#8A8A8A; text-align:center }  "or"
      a  "continue browsing as a guest"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/onboarding/data/fixtures.dart` verbatim.

- `Appointex`
- `Book hair, makeup, nails, spa, massage and photography, all in one app.`
- `Create account`
- `Log in`
- `or`
- `continue browsing as a guest`

## Tokens on this screen

**Colours** — #FFFFFF (8) · #6B3F3A (5) · #FFB5A7 (3) · #FEC89A (3) · #A66A5D (2) · #4A2B27 (1) · #F8EDEB (1) · #D98B96 (1) · #7A4F48 (1) · #8A8A8A (1)

**Font sizes** — 15px (1) · 26px (1) · 14px (1) · 12.5px (1)

**Radii** — 25px (1) · 18px (1)

**Gradients**

- `linear-gradient(135deg,#6B3F3A,#A66A5D)`
- `linear-gradient(135deg,#FEC89A,#FFB5A7)`

## Artboard-local CSS classes

`.btn`

```css
border-radius: 25px; height: 50px; display:flex; align-items:center; justify-content:center; font-size:15px; font-weight:700; box-sizing:border-box;
```


<!-- HANDWRITTEN — everything below this line is preserved by specgen -->

## Purpose

Entry screen of the client app. Presents the brand mark, name and one-line value
proposition over a tinted hero, then three ways in: create an account (goes to
`/register`), log in (no route yet), or continue as a guest (goes to `/home`).

## Components used

- [x] `AxPrimaryButton` (gradient + outline styles)
- [x] `AxDuoIcon` / `AxDuoIcons.logoMark`
- [ ] `AxMobileHeader` — not used; the artboard has no header
- Screen-local: `_HeroBlob` (a `RadialGradient` circle with element opacity).
  The same CSS shape (soft radial circle behind a hero) appears on Provider,
  Search, Urgent and Confirmation per the colour census — promote to
  `design/widgets/` when those screens are built.

## Data model

No model classes — the screen is static copy. `k`-prefixed string constants in
`lib/features/client/onboarding/data/fixtures.dart`, values from the copy
inventory above.

## Interactions & states

| Element | Interaction | Result |
|---|---|---|
| Create account button | tap | `context.go('/register')` |
| Log in button | tap | inert — no `/login` route exists (kept enabled so it renders at full opacity as the artboard shows) |
| "continue browsing as a guest" link | tap | `context.go('/home')` |

**States not in the artboard** — out of scope until Phase 4: loading, empty,
error, pressed/hover, disabled.

## Responsive notes

- Scroll region: none — nothing is clipped at the reference size. The 62/38
  hero/actions split is preserved with `Expanded(flex: 62/38)`. The actions
  section uses the fill-viewport pattern (`LayoutBuilder >
  SingleChildScrollView > ConstrainedBox(minHeight)`) so it scrolls instead of
  overflowing if the content ever outgrows its 38% — it never activates at the
  tested sizes/`1.3×`.
- Kept fixed: logo box 64 (radius 18), `logo_mark` 34, blob sizes/offsets
  (280/260/170/120), button height 50, hero content horizontal padding 40
  (`_heroContentHPad`, artboard line 24), actions bottom padding 40
  (`_actionsBottomPad`, artboard line 32).
- Made flexible: root 390×844 dropped; `SafeArea`; buttons stretch full width
  (CSS `align-items: stretch` default).
- Behaviour at 320 px / 900 px: tagline wraps to more lines within the same
  centered column; blobs stay anchored to the hero's corners and the hero grows.
- Transcription decisions:
  - CSS `radial-gradient(circle,#X,transparent 70%)` on a square element becomes
    Flutter `RadialGradient(radius: 0.7071067811865476, stops: [0, 0.7])`
    (sqrt(2)/2: CSS farthest-corner equals the half-diagonal of the square), end
    colour the same hue at alpha 0, inside an `Opacity` matching the element
    opacity.
  - The artboard's `box-shadow` on the logo box (line 25) is **omitted** —
    01-DESIGN-TOKENS.md §Elevation says there is no box-shadow anywhere and the
    build bans shadows. Flagged below.
  - `margin-top: 6px` on the "or" span is rendered as a top `Padding` on top of
    the 12 px column gap (total 18 px between button and line).

## Open questions

- [ ] `#D98B96` (hero blob) and `#7A4F48` (tagline text) are literals in the
      artboard but have no `AxColors` tokens; the screen holds them as local
      constants with the exact values. `AxColors` should adopt them (the same
      blob rose recurs on Provider/Search/Urgent/Confirmation/FeaturedSpots).
- [ ] The tagline's 14 px font size has no `AxType` token (`AxType.body` is
      14.5). Held locally as `_taglineSize = 14`.
- [ ] No `/login` route exists — the Log in button is inert.
- [ ] pubspec.yaml declares only `assets/icons/`, which excludes the
      `ui/`/`duo/`/`art/` subdirectories from the asset bundle, so `AxIcon`
      assets fail to load at runtime and in tests. Screen tests work around it
      by mocking the `flutter/assets` channel; pubspec.yaml needs the three
      subdirectory entries (or one `assets/icons/**`).
- [ ] In widget tests/goldens, body text (`fontFamily: null`) renders with
      FlutterTest's fixed-width font (~1.0×fontSize advance vs ~0.5× for real
      fonts), so goldens show wider, blockier body text than production. Affects
      every screen; the harness only bundles Manrope.

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes
- [x] No literal colours or font sizes outside `design/tokens/`
      (two artboard-exact local colour constants and one local font-size
      constant are documented under Open questions — no tokens exist for them)
- [ ] Layer-2 side-by-side reviewed and signed off

Golden verification note: the golden was verified programmatically (geometry
probes + pixel sampling) because the shared harness renders body text with the
FlutterTest font; see the last open question. Manrope headings, all colours,
gradients, blob falloffs and layout metrics match the artboard to the pixel.

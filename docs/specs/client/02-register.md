# Client · Register

| | |
|---|---|
| **Artboard** | [`.design-src/Client_Register.dc.html`](../../../.design-src/Client_Register.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/register` |
| **Widget** | `lib/features/client/register/presentation/register_screen.dart` |
| **Build order** | client #2 |
| **Icons on screen** | 2 |

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
  div { display:flex; flex-shrink:0; gap:14px; align-items:center; height:56px; padding:0 16px }
    <svg>
  div { display:flex; flex-direction:column; flex:1; gap:22px; padding:6px 24px 0; overflow:hidden }
    div { display:flex; flex-direction:column; gap:6px }
      h1.head { margin:0; font-size:23px; font-weight:800; color:#6B3F3A }  "Create your account"
      span { font-size:13px; color:#7A7A7A; line-height:1.5 }  "Just a few details and you're ready to book."
    div { display:flex; gap:8px; align-items:center }
      div { display:flex; gap:6px; align-items:center }
        div { display:flex; align-items:center; justify-content:center; width:22px; height:22px; background:#6B3F3A; border-radius:50%; font-size:11px; font-weight:700; color:#FFFFFF }  "1"
        span { font-size:11.5px; font-weight:700; color:#6B3F3A }  "Your details"
      div { flex:1; height:1px; background:#E0DBCF }
      div { display:flex; gap:6px; align-items:center }
        div { display:flex; align-items:center; justify-content:center; width:22px; height:22px; background:#EDEAE2; border-radius:50%; font-size:11px; font-weight:700; color:#9A9A9A }  "2"
        span { font-size:11.5px; color:#9A9A9A }  "Verify phone"
    div { display:flex; flex-direction:column; gap:16px }
      div.field
        span { font-size:12px; font-weight:600; color:#3A3A3A }  "Full name"
        div.input  "e.g. Aisha Kirabo"
      div.field
        span { font-size:12px; font-weight:600; color:#3A3A3A }  "Phone number"
        div.input  "+256 7…"
      div.field
        span { font-size:12px; font-weight:600; color:#3A3A3A }  "Email address"
          span { font-weight:500; color:#B3ADA0 }  "(optional)"
        div.input  "you@example.com"
      div.field
        span { font-size:12px; font-weight:600; color:#3A3A3A }  "Password"
        div.input { justify-content:space-between }
          span  "••••••••"
          <svg>
    span { font-size:11px; color:#9A9A9A; line-height:1.6 }  "By creating an account you agree to Appointex's Terms of Service an…"
  div { display:flex; flex-direction:column; flex-shrink:0; gap:14px; padding:14px 24px 26px }
    div { display:flex; align-items:center; justify-content:center; height:50px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); border-radius:25px }
      span { font-size:14.5px; font-weight:700; color:#6B3F3A }  "Create account"
    span { font-size:12.5px; color:#8A8A8A; text-align:center }  "Already have an account?"
      a  "Log in"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/register/data/fixtures.dart` verbatim.

- `Create your account`
- `Just a few details and you're ready to book.`
- `1`
- `Your details`
- `2`
- `Verify phone`
- `Full name`
- `e.g. Aisha Kirabo`
- `Phone number`
- `+256 7…`
- `Email address`
- `(optional)`
- `you@example.com`
- `Password`
- `••••••••`
- `By creating an account you agree to Appointex's Terms of Service and Privacy Policy.`
- `Create account`
- `Already have an account?`
- `Log in`

## Tokens on this screen

**Colours** — #9A9A9A (5) · #6B3F3A (5) · #3A3A3A (4) · #E0DBCF (2) · #FFFFFF (2) · #A66A5D (1) · #7A7A7A (1) · #EDEAE2 (1) · #B3ADA0 (1) · #FEC89A (1) · #FFB5A7 (1) · #8A8A8A (1)

**Font sizes** — 12px (4) · 11px (3) · 11.5px (2) · 13.5px (1) · 23px (1) · 13px (1) · 14.5px (1) · 12.5px (1)

**Radii** — 12px (1) · 25px (1)

**Gradients**

- `linear-gradient(135deg,#FEC89A,#FFB5A7)`

## Artboard-local CSS classes

`.field`

```css
display:flex; flex-direction:column; gap:6px;
```

`.input`

```css
height:48px; border-radius:12px; border:1px solid #E0DBCF; display:flex; align-items:center; padding:0 14px; font-size:13.5px; color:#9A9A9A; box-sizing:border-box;
```


<!-- HANDWRITTEN — everything below this line is preserved by specgen -->

## Purpose

Step 1 of sign-up ("Your details"): collects full name, phone, optional email
and password above a fixed footer with the primary CTA. Reaches back to
`/onboarding` via the chevron, and (for now) completes toward `/home` — the
stepper's step 2 ("Verify phone") has no route yet.

## Components used

- [x] `AxLabeledField` / `AxField` / `AxFieldLabel` (the `.field`/`.input`
      inventory component)
- [x] `AxIcon` / `AxIcons.chevronLeft` (back, 19 px) and `AxIcons.eye`
      (password suffix, 16 px)
- [ ] `AxMobileHeader` — not used; this artboard's bar is 56 px with `0 16px`
      padding and no title, which `AxMobileHeader` (17 px title, 18/20/14
      padding) does not model. Local `_BackBar` instead.
- Screen-local: `_BackBar`, `_Step` (badge + label pair), `_EmailField` (rich
      label), `_PasswordField` (eye overlay via `Positioned.fill` over `AxField`
      — `AxField` has no suffix-icon parameter), `_CtaButton`.
- `_CtaButton` exists because the artboard CTA is 14.5 px/700 while
  `AxPrimaryButton` (from Client_Onboarding's `.btn`) is 15 px/700. If more
  screens need a 14.5 px variant, give `AxPrimaryButton` a font-size parameter
  and promote.

## Data model

No model classes — the screen holds no state yet. `k`-prefixed string constants
in `lib/features/client/register/data/fixtures.dart`, values from the copy
inventory above. Controllers/validation arrive with the Phase 4 form work.

## Interactions & states

| Element | Interaction | Result |
|---|---|---|
| Back chevron | tap | `context.go('/onboarding')` |
| Create account (footer CTA) | tap | `context.go('/home')` — placeholder until a verify-phone route exists (stepper shows it as step 2) |
| Log in (footer link) | tap | inert — no `/login` route exists |
| Text fields | typing works (real `TextField`s, no controllers) | Phase 4: validation, submission, keyboard focus order |
| Eye icon | none | Phase 4: obscure toggle |

**States not in the artboard** — out of scope until Phase 4: loading, empty,
error, pressed/hover, disabled. (AxField's focused border in `#6B3F3A` is the
widget's documented extension of the artboard's single input state.)

## Responsive notes

- Scroll region: `Expanded > SingleChildScrollView` over the form body
  (padding `6 24 0`, gap 22); the 56 px header and the footer
  (padding `14 24 26`, gap 14) stay fixed outside it, per Rule 3.
- Kept fixed: header 56, step badges 22, divider height 1, field height 48
  (`AxField.mobile`), CTA height 50 (stadium).
- Made flexible: root 390×844 dropped; `SafeArea`; fields and CTA stretch to
  the content width (24 px gutters).
- Behaviour at 320 px / 900 px: subtitle and legal copy wrap; the stepper
  labels are capped by a `LayoutBuilder` + `ConstrainedBox` + `FittedBox
  (BoxFit.scaleDown)` so each stays on one line and the row never overflows
  (labels are the only shrinkable content; the divider takes whatever remains,
  exactly as CSS `flex: 1` does). At real font metrics no scaling ever occurs.
- Keyboard types on name/phone/email are a functional extension with no visual
  footprint; the password field is `obscureText` with the artboard's bullet
  string as its placeholder (the artboard's grey `#9A9A9A` input text is the
  empty state, i.e. all four inputs show placeholders).

## Open questions

- [ ] No `/login` route — the footer Log in link is inert (same gap as
      Onboarding).
- [ ] No verify-phone route — the CTA goes to `/home` as a placeholder; revisit
      when step 2 of the stepper exists.
- [ ] The eye icon's tap target is 16 px; accessibility minimums suggest a
      larger hit area — Phase 4.
- [ ] pubspec.yaml declares only `assets/icons/`, which excludes the
      `ui/`/`duo/`/`art/` subdirectories from the asset bundle, so `AxIcon`
      assets fail to load at runtime and in tests. Screen tests work around it
      by mocking the `flutter/assets` channel; pubspec.yaml needs the three
      subdirectory entries (or one `assets/icons/**`).
- [ ] In widget tests/goldens, body text (`fontFamily: null`) renders with
      FlutterTest's fixed-width font (~1.0×fontSize advance vs ~0.5× for real
      fonts), so goldens show wider, blockier body text than production. Affects
      every screen; the harness only bundles Manrope. On this screen the
      subtitle and legal line wrap in goldens but not in production.

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes
- [x] No literal colours or font sizes outside `design/tokens/`
- [ ] Layer-2 side-by-side reviewed and signed off

Golden verification note: the golden was verified programmatically (geometry
probes + pixel sampling) — header chevron at (16, 18.5), title/subtitle/stepper
offsets, field borders `#E0DBCF`, badge fills, CTA gradient and stadium shape
all match the artboard to the pixel; see the last open question for why body
text metrics differ from production.

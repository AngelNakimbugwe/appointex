# Business · Onboarding & verification

| | |
|---|---|
| **Artboard** | [`.design-src/Biz_Onboarding.dc.html`](../../../.design-src/Biz_Onboarding.dc.html) |
| **Reference size** | 1160 × 760 |
| **Route** | `/biz/onboarding` |
| **Widget** | `lib/features/business/onboarding/presentation/onboarding_screen.dart` |
| **Build order** | business #1 |
| **Icons on screen** | 3 |

> Everything above the HANDWRITTEN marker is generated from the artboard by
> `node tool/design/specgen.mjs`. Do not edit it — edit the artboard, or add
> your notes below the marker.

## Root container

```
width: 1160px
height: 760px
background: linear-gradient(135deg,#F8EDEB 0%,#F9DCC4 45%,#FEC89A 100%)
display: flex
align-items: center
justify-content: center
position: relative
overflow: hidden
```

Per [Rule 1](../../03-RESPONSIVE-RULES.md): drop `width`, `height` and
`overflow`; keep the background; wrap in `SafeArea`.

## Layout tree

```
div { display:flex; align-items:center; justify-content:center; width:1160px; height:760px; background:linear-gradient(135deg,#F8EDEB 0%,#F9DCC4 45%,#FEC89A 100%); position:relative; overflow:hidden }
  div { width:420px; height:420px; background:radial-gradient(circle,#FEC89A,transparent 70%); border-radius:50%; position:absolute; top:-160px; left:-140px; opacity:0.5 }
  div { width:380px; height:380px; background:radial-gradient(circle,#FFB5A7,transparent 70%); border-radius:50%; position:absolute; right:-140px; bottom:-160px; opacity:0.35 }
  div { display:flex; flex-direction:column; gap:22px; width:460px; padding:38px 40px; background:#FFFFFF; border-radius:18px; position:relative }
    div { display:flex; gap:9px; align-items:center }
      div { display:flex; align-items:center; justify-content:center; width:30px; height:30px; background:linear-gradient(135deg,#6B3F3A,#A66A5D); border-radius:8px }
        <svg>
      span.head { font-size:14px; font-weight:700; color:#6B3F3A }  "Appointex for Business"
    div { display:flex; flex-direction:column; gap:6px }
      h1.head { margin:0; font-size:23px; font-weight:800; color:#6B3F3A }  "Join Appointex"
      span { font-size:13px; color:#7A7A7A }  "Free to join. You only pay when a booking happens."
    div { display:flex; gap:8px; align-items:center }
      div { display:flex; gap:6px; align-items:center }
        div { display:flex; align-items:center; justify-content:center; width:22px; height:22px; background:#6B3F3A; border-radius:50%; font-size:11px; font-weight:700; color:#FFFFFF }  "1"
        span { font-size:11.5px; font-weight:700; color:#6B3F3A }  "Details"
      div { flex:1; height:1px; background:#E0DBCF }
      div { display:flex; gap:6px; align-items:center }
        div { display:flex; align-items:center; justify-content:center; width:22px; height:22px; background:#EDEAE2; border-radius:50%; font-size:11px; font-weight:700; color:#9A9A9A }  "2"
        span { font-size:11.5px; color:#9A9A9A }  "Verify"
      div { flex:1; height:1px; background:#E0DBCF }
      div { display:flex; gap:6px; align-items:center }
        div { display:flex; align-items:center; justify-content:center; width:22px; height:22px; background:#EDEAE2; border-radius:50%; font-size:11px; font-weight:700; color:#9A9A9A }  "3"
        span { font-size:11.5px; color:#9A9A9A }  "Services"
    div.field
      span { font-size:12px; font-weight:600; color:#3A3A3A }  "Business or provider name"
      div.input  "e.g. Patricia Glam Studio"
    div.field
      span { font-size:12px; font-weight:600; color:#3A3A3A }  "Category"
      div.input { justify-content:space-between }  "Makeup"
        <svg>
      span { font-size:10.5px; color:#9A9A9A }  "Independent stylists and mobile providers welcome, no shop front re…"
    div.field
      span { font-size:12px; font-weight:600; color:#3A3A3A }  "Phone number"
      div.input  "+256 7…"
    div.field
      span { font-size:12px; font-weight:600; color:#3A3A3A }  "Identity verification"
      div { display:flex; gap:10px; align-items:center; padding:16px; border:1.5px dashed #D7D1C2; border-radius:10px }
        <svg>
        span { font-size:12px; color:#8A8A8A }  "Upload national ID or passport"
    div { display:flex; align-items:center; justify-content:center; height:48px; background:linear-gradient(135deg,#FEC89A,#FFB5A7); border-radius:24px }
      span { font-size:14px; font-weight:700; color:#6B3F3A }  "Continue"
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/business/onboarding/data/fixtures.dart` verbatim.

- `Appointex for Business`
- `Join Appointex`
- `Free to join. You only pay when a booking happens.`
- `1`
- `Details`
- `2`
- `Verify`
- `3`
- `Services`
- `Business or provider name`
- `e.g. Patricia Glam Studio`
- `Category`
- `Makeup`
- `Independent stylists and mobile providers welcome, no shop front required.`
- `Phone number`
- `+256 7…`
- `Identity verification`
- `Upload national ID or passport`
- `Continue`

## Tokens on this screen

**Colours** — #FFFFFF (8) · #9A9A9A (7) · #6B3F3A (6) · #FEC89A (4) · #3A3A3A (4) · #E0DBCF (3) · #FFB5A7 (2) · #A66A5D (2) · #EDEAE2 (2) · #F8EDEB (1) · #F9DCC4 (1) · #7A7A7A (1) · #D7D1C2 (1) · #8A8A8A (1)

**Font sizes** — 12px (5) · 11px (3) · 11.5px (3) · 13px (2) · 14px (2) · 23px (1) · 10.5px (1)

**Radii** — 9px (1) · 18px (1) · 8px (1) · 10px (1) · 24px (1)

**Gradients**

- `linear-gradient(135deg,#F8EDEB 0%,#F9DCC4 45%,#FEC89A 100%)`
- `linear-gradient(135deg,#6B3F3A,#A66A5D)`
- `linear-gradient(135deg,#FEC89A,#FFB5A7)`

## Artboard-local CSS classes

`.field`

```css
display:flex; flex-direction:column; gap:6px;
```

`.input`

```css
height:44px; border-radius:9px; border:1px solid #E0DBCF; display:flex; align-items:center; padding:0 14px; font-size:13px; color:#9A9A9A;
```


<!-- HANDWRITTEN — everything below this line is preserved by specgen -->







## Purpose

A provider signs their business up to Appointex: they enter the business
name, category and phone number, and upload a national ID or passport for
verification. Continue steps the wizard forward; at the last step it hands
the provider over to the business dashboard. The route sits outside
`BizShell` — the artboard has no sidebar here.

## Components used

- `AxLabeledField` / `AxFieldLabel` / `AxField.desktop` (44 px) — name and
  phone fields, placeholder `#9A9A9A`
- `AxDuoIcon(AxDuoIcons.logoMark)` — 30 px brand lockup
- `AxIcon` — `chevronDown` (12), `image` (18)
- Screen-local (single use, Tier 3): `_JoinCard`, `_Stepper`,
  `_CategorySelect` (static select; opening the list is Phase 4),
  `_UploadBox` + `_DashedBorderPainter` (CSS `1.5px dashed #D7D1C2` has no
  Flutter primitive — painted as a 4.5/4.5 dash cycle),
  `_ContinueButton` (48-high stadium, 14/700 label — the artboard's inline
  control, *not* `.btn` 50/25/15, so `AxPrimaryButton` does not apply),
  `_Blob` (radial decorations)
- `AxGradients.onboardingHero` / `.logo` / `.avatarPeach`

## Data model

```dart
// lib/features/business/onboarding/data/fixtures.dart
const String kBrandLine;            // 'Appointex for Business'
const String kHeading;              // 'Join Appointex'
const String kSubheading;           // 'Free to join. You only pay when a booking happens.'
const List<String> kStepLabels;     // ['Details', 'Verify', 'Services']
const String kNameFieldLabel;       // 'Business or provider name'
const String kNameFieldHint;       // 'e.g. Patricia Glam Studio'
const String kCategoryFieldLabel;   // 'Category'
const String kCategoryFieldValue;  // 'Makeup'
const String kCategoryFieldHelper; // 'Independent stylists …'
const String kPhoneFieldLabel;      // 'Phone number'
const String kPhoneFieldHint;       // '+256 7…'
const String kVerificationFieldLabel; // 'Identity verification'
const String kVerificationFieldHint; // 'Upload national ID or passport'
const String kContinueLabel;        // 'Continue'
```

## Interactions & states

| Element | Interaction | Result |
|---|---|---|
| Continue button | tap | advances the stepper (1 → 2 → 3); on step 3 navigates to `/biz/dashboard` |
| Name / phone fields | typing | entered text renders `#3A3A3A` (docs/04 §AxField extension) |
| Category select | tap | none in this port — dropdown is Phase 4 |
| Upload box | tap | none in this port — file picker is Phase 4 |

**States not in the artboard**

- Loading: out of scope (no backend).
- Empty: n/a (static wizard content).
- Error: out of scope; field validation is Phase 4.
- Pressed / hover: Phase 4.
- Disabled: Continue is never disabled in this port; validation gating is Phase 4.

## Responsive notes

- Scroll region: the root `Stack`'s `SingleChildScrollView` wrapping the
  centered card (Rule 3) — the card scrolls when it cannot fit the viewport
  height.
- Kept fixed: card width 460 (Rule 5, intrinsic form card), blob sizes and
  negative offsets (Rule 10, clipped by the Stack), 22 px stepper dots,
  48 px button.
- Made flexible: root `width`/`height`/`overflow` dropped (Rule 1); card
  height is content-driven; the two blobs are background, not scroll content.
- Behaviour at 900 px: the card simply centers in the narrower gradient; this
  route has no shell, so the 900 px "larger screen" rule does not apply.
- The artboard's card `box-shadow: 0 18px 40px rgba(27,42,74,0.1)` is
  omitted — the project bans shadows and no token exists for that value.
- The artboard's 14 px sizes render via `AxType.body` (14.5), per docs/01's
  "14.5 / 14" bucket for `.head` section text.

## Open questions

- [ ] Steps 2 (Verify) and 3 (Services) have no artboard content. The flow
  keeps the step-1 card and only advances the stepper; step bodies need
  design input.
- [ ] Category list contents — only the value 'Makeup' exists in the artboard.
- [ ] Entered data lives in screen-local state only; no draft persistence
  specified.

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes
- [x] No literal colours or font sizes outside `design/tokens/`
- [ ] Layer-2 side-by-side reviewed and signed off

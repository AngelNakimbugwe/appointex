# Client · Chat

| | |
|---|---|
| **Artboard** | [`.design-src/Client_Chat.dc.html`](../../../.design-src/Client_Chat.dc.html) |
| **Reference size** | 390 × 844 |
| **Route** | `/chat/:threadId` |
| **Widget** | `lib/features/client/chat/presentation/chat_screen.dart` |
| **Build order** | client #12 |
| **Icons on screen** | 5 |

> Everything above the HANDWRITTEN marker is generated from the artboard by
> `node tool/design/specgen.mjs`. Do not edit it — edit the artboard, or add
> your notes below the marker.

## Root container

```
width: 390px
height: 844px
background: #FDFCFA
display: flex
flex-direction: column
overflow: hidden
```

Per [Rule 1](../../03-RESPONSIVE-RULES.md): drop `width`, `height` and
`overflow`; keep the background; wrap in `SafeArea`.

## Layout tree

```
div { display:flex; flex-direction:column; width:390px; height:844px; background:#FDFCFA; overflow:hidden }
  div { display:flex; flex-shrink:0; gap:12px; align-items:center; height:60px; padding:0 16px; background:#FFFFFF; border-bottom:1px solid #ECE7DC }
    <svg>
    div { display:flex; align-items:center; justify-content:center; width:34px; height:34px; background:linear-gradient(135deg,#F8EDEB,#FFB5A7); border-radius:50% }
      <svg>
    div { display:flex; flex-direction:column }
      span { font-size:13.5px; font-weight:700; color:#6B3F3A }  "Patricia Glam Studio"
      span { font-size:11px; color:#5FA777 }  "Online"
  div { display:flex; flex-direction:column; flex:1; gap:10px; padding:16px; overflow:hidden }
    div.bubble.bg
      div.bubble { background:#F0EEE9; color:#2A2A2A }  "Hi! Do you have anything free on the 26th for bridal makeup?"
    div
      div.bubble { background:#6B3F3A; color:#FFFFFF }  "Yes, 12:00 pm is open. I can also do a trial the week before if you…"
    div
      div.bubble { background:#F0EEE9; color:#2A2A2A }  "That'd be great. Easier if we just sort the rest on WhatsApp, call …"
    div { display:flex; gap:7px; align-items:center; max-width:88%; padding:8px 14px; margin:4px 0; background:#FBF3E7; border:1px solid #FFB5A7; border-radius:20px }
      <svg>
      span { font-size:11px; color:#A66A5D; line-height:1.4; text-align:center }  "Message blocked — phone numbers and contact details are shared auto…"
    div
      div.bubble { background:#F0EEE9; color:#2A2A2A }  "Ah okay, makes sense. I'll just book it here then."
  div { display:flex; flex-direction:column; flex-shrink:0; gap:8px; padding:8px 16px 16px; background:#FFFFFF; border-top:1px solid #ECE7DC }
    span { display:flex; gap:5px; align-items:center; font-size:10.5px; color:#9A9A9A }  "Numbers and contact info are blocked before checkout"
      <svg>
    div { display:flex; gap:10px; align-items:center }
      div { display:flex; flex:1; align-items:center; height:42px; padding:0 16px; background:#F0EEE9; border-radius:21px }
        span { font-size:12.5px; color:#9A9A9A }  "Message Patricia…"
      div { display:flex; flex-shrink:0; align-items:center; justify-content:center; width:42px; height:42px; background:#FFB5A7; border-radius:50% }
        <svg>
```

## Copy inventory

Every visible string, in document order. These go into
`lib/features/client/chat/data/fixtures.dart` verbatim.

- `Patricia Glam Studio`
- `Online`
- `Hi! Do you have anything free on the 26th for bridal makeup?`
- `Yes, 12:00 pm is open. I can also do a trial the week before if you'd like.`
- `That'd be great. Easier if we just sort the rest on WhatsApp, call me on 0772…`
- `Message blocked — phone numbers and contact details are shared automatically once your deposit is paid`
- `Ah okay, makes sense. I'll just book it here then.`
- `Numbers and contact info are blocked before checkout`
- `Message Patricia…`

## Tokens on this screen

**Colours** — #FFFFFF (5) · #6B3F3A (4) · #F0EEE9 (4) · #FFB5A7 (3) · #2A2A2A (3) · #9A9A9A (3) · #ECE7DC (2) · #FDFCFA (1) · #F8EDEB (1) · #5FA777 (1) · #FBF3E7 (1) · #9A6B1E (1) · #A66A5D (1)

**Font sizes** — 11px (2) · 13px (1) · 13.5px (1) · 10.5px (1) · 12.5px (1)

**Radii** — 15px (1) · 20px (1) · 21px (1)

**Gradients**

- `linear-gradient(135deg,#F8EDEB,#FFB5A7)`

## Artboard-local CSS classes

`.bubble`

```css
max-width:78%; padding:10px 13px; border-radius:15px; font-size:13px; line-height:1.45;
```


<!-- HANDWRITTEN — everything below this line is preserved by specgen -->







## Purpose

One chat thread between the client and a provider: the client negotiates a
booking ("the 26th for bridal makeup"), hits the platform's contact-sharing
block, and settles on booking in-app. The composer is the fixed surface at
the keyboard-safe bottom; the message list scrolls above it. The Chat tab
itself routes to the inbox (see below), which pushes this thread.

## Components used

- [x] `AxAvatar` — 34 px header avatar, `AxGradients.avatarBlush`, circular
      (`radius: size / 2`), white `personFill` art at 55%
- [x] `AxBottomNav` — `Scaffold.bottomNavigationBar`, Chat tab active
- [x] `AxIcon` — `chevronLeft` 19, `lock` 13, `lock24` 11, `send` 16
      (all five icons on screen, no Material substitutes)
- [x] `AxSpace` / `AxType` / `AxColors` tokens

Screen-local widgets (Tier 3, stay in the feature):

- `_ChatHeader` — the 60 px bar (back, avatar, name + presence). Local, not
  `AxMobileHeader`, because the artboard's header is 60 px with a 34 px
  avatar and a presence subline — a different shape than the standard bar.
- `_MessageBubble` — `.bubble` (Tier 3): `ConstrainedBox` with
  `constraints.maxWidth * 0.78`, padding 10/13, radius 15 with the 5 px
  tail corner on the sender's side, system font 13/1.45
- `_BlockedNotice` — the centred `#FBF3E7` escrow strip, max-width 88%
- `_Composer` — note row + stadium input placeholder + circular send button

## Data model

```dart
// lib/features/client/chat/data/fixtures.dart
class ChatEntry { text, outgoing, isNotice }  // message or system notice
class ChatThread { id, name, presenceLabel, gradient, entries }
const kChatThreads  // one thread: 'patricia-glam-studio' with 5 entries
```

`ChatScreen` takes an optional `threadId` constructor arg and resolves it
against `kChatThreads`, falling back to the first thread — the route builder
for `/chat/:threadId` can pass `state.pathParameters['threadId']` straight
through. Deliberate extension (documented gap): **`ChatInboxScreen`** at
`presentation/chat_inbox_screen.dart` is the Chat tab root (`/chat`), a
minimal token-only list of `kChatThreads` rows that navigates to
`/chat/<thread.id>` on tap. It is not pixel-sourced (no artboard — BUILD_PLAN
§Known gaps), so it has responsive tests but no golden.

## Interactions & states

The artboards are static frames, so everything in this section is an extension
of the design rather than a transcription of it. Decide it deliberately.

| Element | Interaction | Result |
|---|---|---|
| Back arrow | tap | `context.pop()` |
| Bottom nav | tap | `context.go` to /home, /bookings, /chat (inbox), /profile |
| Inbox row | tap | `context.go('/chat/<threadId>')` |
| Composer input | tap | **Phase 4** — real text field (currently the artboard's placeholder, matching the AxField empty-state convention) |
| Send button | tap | **Phase 4** — sends a message |
| Message list | scroll | scrolls; content starts top-down as drawn |

**States not in the artboard** — specify each, or explicitly say "out of scope":

- Loading: out of scope (fixtures only, Phase 4)
- Empty: out of scope (Phase 4)
- Error: out of scope (Phase 4)
- Pressed / hover: Phase 4
- Disabled: n/a (send is decorative until Phase 4)

## Responsive notes

Per-screen deviations from [03-RESPONSIVE-RULES.md](../../03-RESPONSIVE-RULES.md).
Which fixed dimensions were kept and why; which became flexible; where the
scroll boundary sits.

- Scroll region: `Expanded > SingleChildScrollView` for the messages only
  (Rule 3); header and composer are fixed outside it, composer above the
  `Scaffold.bottomNavigationBar` (keyboard handled by
  `resizeToAvoidBottomInset`).
- Kept fixed: 60 px header, 42 px composer field/send button (intrinsic
  element sizes, survive 1.3 text scale — verified), 34 px avatar.
- Made flexible: bubble widths up to 78% of the content column via
  `LayoutBuilder` + `ConstrainedBox`; notice up to 88%; provider name
  ellipsises in the header; the composer note wraps in `Expanded`.
- The composer field renders `border-radius:21px` on height 42 as a
  `StadiumBorder` (same reasoning as `AxPrimaryButton`).
- Bubble/message alignment uses `AlignmentDirectional.centerStart/centerEnd`.
- Behaviour at 320 px / 900 px: bubbles re-cap at 78% of the narrower column,
  notice and note wrap to more lines. Verified at 320/390/430 and at
  `textScaler` 1.3 — no overflow.

## Open questions

_Things the artboard does not answer. Raise them rather than inventing an answer
silently._

- [ ] The artboard has **no bottom nav** — the build instruction for this port
      directed embedding `AxBottomNav` (Chat active) on both #11 and #12, so
      it is present in the golden. Confirm this is the intended final state.
- [ ] First bubble's wrapper carries class `bubble bg` (line 29) which would
      literally double its padding; treated as a design-tool artifact — all
      bubbles render one padding layer.
- [ ] Alignment vs. dialogue roles: reading the copy, the left-aligned grey
      bubbles are the client asking and the right-aligned brown bubble is the
      provider answering — the opposite of the usual self-on-right convention
      implied by the "Message Patricia…" composer. Ported literally as drawn;
      the fixture's `outgoing` flag means right-aligned, not "mine".
- [ ] Who authors the blocked notice (client attempt vs system insert) is not
      drawn; modelled as a system entry in the thread fixture.

## Acceptance criteria

- [x] Golden passes at the reference size
- [x] No overflow across the responsive matrix (thread and inbox)
- [x] No overflow at `textScaler: 1.3`
- [x] Every string from the copy inventory present, character for character
- [x] All icons are `AxIcons` / `AxArt`, no Material substitutes
- [x] No literal colours or font sizes outside `design/tokens/`
- [ ] Layer-2 side-by-side reviewed and signed off

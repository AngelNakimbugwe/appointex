# Appointex — Design Implementation Docs

The source of truth for this app's UI is the Claude Design canvas
`appointex-app-pages.html` (21 artboards). It has been unpacked, losslessly,
into [`.design-src/`](../.design-src/) — one `.dc.html` file per screen plus
`canvas.json` describing the canvas layout.

**Never eyeball a screenshot.** Every screen spec in this folder is derived from
the artboard markup, where every colour, size, radius and string is a literal.
When something is ambiguous, open the `.dc.html` and read the style attribute.

## Read in this order

| Doc | What it settles |
|---|---|
| [00-STRATEGY.md](00-STRATEGY.md) | Phases, workflow, definition of done |
| [01-DESIGN-TOKENS.md](01-DESIGN-TOKENS.md) | Every colour, type style, radius, spacing → Dart names |
| [02-ARCHITECTURE.md](02-ARCHITECTURE.md) | Folders, routing, state, naming conventions |
| [03-RESPONSIVE-RULES.md](03-RESPONSIVE-RULES.md) | The CSS→Flutter translation rulebook |
| [04-COMPONENT-INVENTORY.md](04-COMPONENT-INVENTORY.md) | Shared widgets, extracted from repeated markup |
| [05-ICON-CATALOG.md](05-ICON-CATALOG.md) | The 44 icons, extraction pipeline, naming |
| [06-VERIFICATION.md](06-VERIFICATION.md) | How we prove a screen matches |
| [PROGRESS.md](PROGRESS.md) | Live build tracker |

## Screen specs

- [`specs/client/`](specs/client/) — 12 screens, mobile, designed at 390×844
- [`specs/business/`](specs/business/) — 8 screens, desktop/web, designed at 1160×760

Each spec follows [`specs/_TEMPLATE.md`](specs/_TEMPLATE.md).

## Regenerating

The extracted design source and the generated half of each spec come from
scripts in [`tool/design/`](../tool/design/):

```bash
node tool/design/extract.mjs    # artifact HTML -> .design-src/
node tool/design/icons.mjs      # .design-src/ -> assets/icons/ + ax_icons.dart
node tool/design/specgen.mjs    # .design-src/ -> docs/specs/** (generated sections only)
```

Node rather than Dart so the pipeline runs without a Flutter toolchain, and so
regenerating specs never requires the app to compile.

Hand-written sections of a spec live below the `<!-- HANDWRITTEN -->` marker and
are never overwritten.

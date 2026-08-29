// Extracts every <svg> from the artboards into named, tintable assets.
//
//   node tool/design/icons.mjs
//
// Writes:
//   assets/icons/ui/*.svg        monochrome, stroke/fill -> currentColor
//   assets/icons/art/*.svg       48x48 illustrations, copied verbatim
//   lib/design/icons/ax_icons.dart
//   docs/generated/icon-usage.md

import fs from 'node:fs';
import path from 'node:path';

const ROOT = path.resolve(import.meta.dirname, '../..');
const SRC = path.join(ROOT, '.design-src');
const UI_DIR = path.join(ROOT, 'assets', 'icons', 'ui');
const DUO_DIR = path.join(ROOT, 'assets', 'icons', 'duo');
const ART_DIR = path.join(ROOT, 'assets', 'icons', 'art');

// Primary path `d` (or first shape tag) -> semantic name.
// See docs/05-ICON-CATALOG.md for the reasoning behind each name.
const NAMES = new Map(Object.entries({
  'M12 2l3.1 6.3 6.9 1-5 4.9 1.2 6.8L12 17.8 5.8 21l1.2-6.8-5-4.9 6.9-1z': 'star_fill',
  'M16 3v4M8 3v4M3 10h18': 'calendar',
  'M15 18l-6-6 6-6': 'chevron_left',
  'M9 6l6 6-6 6': 'chevron_right',
  'M6 9l6 6 6-6': 'chevron_down',
  'M4 21c0-4 4-6 8-6s8 2 8 6': 'user',
  'M8 12l2.5 2.5L16 9': 'check_circle',
  'M4.5 20c0-4.2 3.4-7 7.5-7s7.5 2.8 7.5 7': 'person_fill',
  'M13 2 4 14h6l-1 8 9-12h-6l1-8z': 'bolt_fill',
  'M12 3l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L12 17.8l-5.8 3.1 1.1-6.5-4.7-4.6 6.5-.9L12 3z': 'star_outline',
  'M3 10h18': 'card',
  'M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01': 'list',
  'M12 21c-4-4.3-7-8.3-7-11.8a7 7 0 0114 0c0 3.5-3 7.5-7 11.8z': 'map_pin',
  'M5 13l4 4 10-10': 'check',
  'M6 12l4 4 8-8': 'check_bold',
  'M5 12h14M12 5v14': 'plus',
  'M12 5v14M5 12h14': 'plus',
  'M8 10V7a4 4 0 018 0v3': 'lock',
  'M18 8a6 6 0 00-12 0c0 7-3 9-3 9h18s-3-2-3-9': 'bell',
  'M6 9v10M9.5 9v8M13 9v10M16.5 9v8': 'cat_hair',
  'M12 3s6 7 6 11a6 6 0 01-12 0c0-4 6-11 6-11z': 'cat_makeup',
  'M8 7h8l1 3v9a2 2 0 01-2 2H9a2 2 0 01-2-2v-9z': 'cat_nails',
  'M12 3c-4 3-4 8 0 11 4-3 4-8 0-11z': 'cat_spa',
  'M4 8h3l2-2h6l2 2h3v11H4z': 'cat_photography',
  'M21 11.5a8.5 8.5 0 01-8.5 8.5H5l-2 2V11.5a8.5 8.5 0 018.5-8.5h1a8.5 8.5 0 018.5 8.5z': 'chat',
  'M21 21l-4.3-4.3': 'search',
  'M12 2l7 4v6c0 5-3.5 8-7 10-3.5-2-7-5-7-10V6z': 'shield',
  'M3 11l9-7 9 7': 'home',
  'M21 15V6a2 2 0 00-2-2H5a2 2 0 00-2 2v9m18 0l-4-4-5 5-3-3-6 6m18-4v4a2 2 0 01-2 2H5a2 2 0 01-2-2v-4': 'image',
  'M4 9l1-5h14l1 5': 'store',
  'M22 2L11 13M22 2l-7 20-4-9-9-4z': 'send',
  'M8 5v14l11-7z': 'play_fill',
  'M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z': 'eye',
  'M4 6h16M7 12h10M10 18h4': 'filter',
  'M12 7v5l3.5 2': 'clock',
  'M8 7V5a2 2 0 012-2h4a2 2 0 012 2v2': 'briefcase',
  'M19.4 15a1.7 1.7 0 00.3 1.9': 'settings',
  // shape-first icons, keyed by a stable prefix of the first tag
  'RECT:3,3,8,8': 'grid',
  'ELLIPSE:12,6.6': 'logo_mark',
  // 48x48 illustrations
  'M20 6c0-3 8-3 8 0': 'art_makeup',
  'M32 12l6 22': 'art_nails',
  'M21 22c0 2 6 2 6 0': 'art_spa',
  'M10 6c6 0 4 8 10 8s4-8 10-8': 'art_braids',
  'M22 26c0 8-2 14-2 18': 'art_person',
  'RECT:7,16,34,24': 'art_photography',
}));

// Plain filled circles used as confetti on Client_Confirmation. Not icons -
// build these as Containers. See docs/05-ICON-CATALOG.md.
const SKIP_VIEWBOXES = new Set(['0 0 10 10', '0 0 8 8', '0 0 12 12', '0 0 9 9']);

function signature(svg) {
  const d = svg.match(/\sd="([^"]*)"/);
  if (d) {
    // `settings` has a very long first path; match on a stable prefix.
    for (const key of NAMES.keys()) {
      if (key.startsWith('M') && d[1].startsWith(key)) return key;
    }
    return d[1];
  }
  const rect = svg.match(/<rect x="([\d.]+)" y="([\d.]+)" width="([\d.]+)" height="([\d.]+)"/);
  if (rect) return `RECT:${rect[1]},${rect[2]},${rect[3]},${rect[4]}`;
  const el = svg.match(/<ellipse cx="([\d.]+)" cy="([\d.]+)"/);
  if (el) return `ELLIPSE:${el[1]},${el[2]}`;
  const c = svg.match(/<circle cx="([\d.]+)" cy="([\d.]+)" r="([\d.]+)"/);
  if (c) return `CIRCLE:${c[1]},${c[2]},${c[3]}`;
  return svg.slice(0, 60);
}

// --- collect -----------------------------------------------------------------

const instances = [];
for (const file of fs.readdirSync(SRC).filter((f) => f.endsWith('.dc.html'))) {
  const body = fs.readFileSync(path.join(SRC, file), 'utf8').split('<x-dc>')[1] || '';
  for (const m of body.matchAll(/<svg[^>]*>[\s\S]*?<\/svg>/g)) {
    const svg = m[0];
    const viewBox = (svg.match(/viewBox="([^"]*)"/) || [])[1] || '0 0 24 24';
    if (SKIP_VIEWBOXES.has(viewBox)) continue;
    instances.push({
      svg,
      viewBox,
      strokeWidth: (svg.match(/stroke-width="([^"]*)"/) || [])[1] || null,
      sig: signature(svg),
      screen: file.replace('.dc.html', ''),
    });
  }
}

// Group by (name, stroke-width): flutter_svg cannot restroke, so each width
// is its own asset. See docs/05-ICON-CATALOG.md.
const variants = new Map();
const unnamed = new Set();
for (const inst of instances) {
  const name = NAMES.get(inst.sig);
  if (!name) { unnamed.add(inst.sig.slice(0, 70)); continue; }
  const key = `${name}::${inst.strokeWidth ?? 'fill'}`;
  if (!variants.has(key)) {
    variants.set(key, { name, strokeWidth: inst.strokeWidth, svg: inst.svg, viewBox: inst.viewBox, uses: [], count: 0 });
  }
  const v = variants.get(key);
  v.count++;
  if (!v.uses.includes(inst.screen)) v.uses.push(inst.screen);
}

// Within a name, the most-used stroke-width takes the bare filename.
const byName = new Map();
for (const v of variants.values()) {
  if (!byName.has(v.name)) byName.set(v.name, []);
  byName.get(v.name).push(v);
}
for (const list of byName.values()) {
  list.sort((a, b) => b.count - a.count);
  list.forEach((v, i) => {
    // Suffix as tenths-of-a-pixel, zero-padded to 2 digits, so "2" -> "_20"
    // and "2.2" -> "_22" rather than colliding-looking "_2" vs "_22".
    const suffix = String(Math.round(parseFloat(v.strokeWidth) * 10)).padStart(2, '0');
    v.file = i === 0 || !v.strokeWidth
      ? `${v.name}.svg`
      : `${v.name}_${suffix}.svg`;
  });
}

// --- normalise & write -------------------------------------------------------

/** Distinct hex colours in an svg. One colour => tintable; more => two-tone. */
function colourCount(svg) {
  return new Set((svg.match(/#[0-9A-Fa-f]{3,8}/g) || []).map((c) => c.toUpperCase())).size;
}

/**
 * Rewrite a MONOCHROME icon so [AxIcon] can tint it.
 * Only ever called when colourCount(svg) <= 1 - blanket-tinting a two-tone icon
 * silently destroys it (check_circle becomes a solid disc, logo_mark loses its
 * peach centre), which is why the classification below is by colour count.
 */
function normalise(svg, viewBox) {
  let inner = svg.replace(/^<svg[^>]*>/, '').replace(/<\/svg>$/, '').trim();
  const rootIsFilled = /^<svg[^>]*\sfill="#/.test(svg);
  inner = inner
    .replace(/stroke="#[0-9A-Fa-f]{3,8}"/g, 'stroke="currentColor"')
    .replace(/fill="#[0-9A-Fa-f]{3,8}"/g, 'fill="currentColor"');
  const rootAttrs = rootIsFilled
    ? 'fill="currentColor"'
    : 'fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"';
  const sw = (svg.match(/\sstroke-width="([^"]*)"/) || [])[1];
  return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="${viewBox}" ${rootAttrs}${sw ? ` stroke-width="${sw}"` : ''}>${inner}</svg>\n`;
}

/** Strip the artboard's inline sizing; the widget sets width/height. */
function verbatim(svg) {
  return svg
    .replace(/\s(width|height)="[^"]*"/g, '')
    .replace(/^<svg/, '<svg xmlns="http://www.w3.org/2000/svg"') + '\n';
}

for (const d of [UI_DIR, DUO_DIR, ART_DIR]) {
  fs.rmSync(d, { recursive: true, force: true });
  fs.mkdirSync(d, { recursive: true });
}

const ui = [], duo = [], art = [];
for (const v of [...variants.values()].sort((a, b) => a.name.localeCompare(b.name))) {
  if (v.name.startsWith('art_')) {
    // 48x48 illustrations: multi-colour by nature, always verbatim.
    v.kind = 'art';
    fs.writeFileSync(path.join(ART_DIR, v.file), verbatim(v.svg));
    art.push(v);
  } else if (colourCount(v.svg) > 1) {
    // Two-tone UI icons (check_circle's white tick, logo_mark's peach centre).
    v.kind = 'duo';
    fs.writeFileSync(path.join(DUO_DIR, v.file), verbatim(v.svg));
    duo.push(v);
  } else {
    v.kind = 'ui';
    fs.writeFileSync(path.join(UI_DIR, v.file), normalise(v.svg, v.viewBox));
    ui.push(v);
  }
}

// --- generate Dart -----------------------------------------------------------

const camel = (s) => s.replace(/_([a-z0-9])/g, (_, c) => c.toUpperCase());
const constLine = (v, dir) => `  /// ${v.count} use${v.count === 1 ? '' : 's'} · ${v.uses.join(', ')}\n` +
  `  static const String ${camel(v.file.replace('.svg', ''))} = 'assets/icons/${dir}/${v.file}';`;

const dart = `// GENERATED by tool/design/icons.mjs - do not edit by hand.
//
// Every glyph here was drawn by hand in the design. Do not substitute a Material
// or Lucide icon: see docs/05-ICON-CATALOG.md.

/// Monochrome UI icons. Tint with [AxIcon]'s \`color\`.
abstract final class AxIcons {
${ui.map((v) => constLine(v, 'ui')).join('\n\n')}
}

/// Two-tone UI icons. They carry their own colours (the verified badge's white
/// tick, the logo's peach centre), so tinting them destroys them. Render with
/// [AxDuoIcon], which exposes no \`color\`.
abstract final class AxDuoIcons {
${duo.map((v) => constLine(v, 'duo')).join('\n\n')}
}

/// Illustrative art used inside [AxAvatar]. These carry their own colours and
/// must never be tinted.
abstract final class AxArt {
${art.map((v) => constLine(v, 'art')).join('\n\n')}
}
`;

const dartDir = path.join(ROOT, 'lib', 'design', 'icons');
fs.mkdirSync(dartDir, { recursive: true });
fs.writeFileSync(path.join(dartDir, 'ax_icons.dart'), dart);

// --- usage report ------------------------------------------------------------

const rows = [...variants.values()]
  .sort((a, b) => b.count - a.count)
  .map((v) => `| \`${v.file}\` | ${v.kind} | ${v.strokeWidth ?? 'filled'} | ${v.count} | ${v.uses.join(', ')} |`);

fs.mkdirSync(path.join(ROOT, 'docs', 'generated'), { recursive: true });
fs.writeFileSync(path.join(ROOT, 'docs', 'generated', 'icon-usage.md'),
  `# Icon usage (generated)\n\nRegenerate with \`node tool/design/icons.mjs\`.\n\n` +
  `${instances.length} instances · ${variants.size} assets · ${byName.size} distinct icons\n\n` +
  `| Asset | Kind | Stroke | Uses | Screens |\n|---|---|---|---|---|\n${rows.join('\n')}\n`);

console.log(`${instances.length} instances -> ${variants.size} assets (${ui.length} ui, ${duo.length} duo, ${art.length} art), ${byName.size} distinct names`);
if (unnamed.size) {
  console.warn(`\n${unnamed.size} unnamed shape(s) - add to NAMES in this file:`);
  for (const s of unnamed) console.warn('  ' + s);
  process.exitCode = 1;
}

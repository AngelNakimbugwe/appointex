// Generates the machine-derived half of every screen spec in docs/specs/.
//
//   node tool/design/specgen.mjs
//
// Everything above the HANDWRITTEN marker is regenerated from the artboard on
// every run. Everything below it is preserved verbatim.

import fs from 'node:fs';
import path from 'node:path';
import { outline, renderOutline, collectText, parseStyle } from './lib/parse.mjs';

const ROOT = path.resolve(import.meta.dirname, '../..');
const SRC = path.join(ROOT, '.design-src');
const SPECS = path.join(ROOT, 'docs', 'specs');
const MARKER = '<!-- HANDWRITTEN — everything below this line is preserved by specgen -->';

/** file -> [row, order, route, feature, title] */
const SCREENS = {
  Client_Onboarding:  ['client', 1,  '/onboarding',        'onboarding',    'Onboarding'],
  Client_Register:    ['client', 2,  '/register',          'register',      'Register'],
  Client_Home:        ['client', 3,  '/home',              'home',          'Home'],
  Client_Urgent:      ['client', 4,  '/home/urgent',       'urgent',        'Urgent booking'],
  Client_Search:      ['client', 5,  '/search',            'search',        'Search results'],
  Client_Provider:    ['client', 6,  '/provider/:id',      'provider',      'Provider profile'],
  Client_Book:        ['client', 7,  '/provider/:id/book', 'book',          'Book service'],
  Client_EventBundle: ['client', 8,  '/event',             'event_bundle',  'Plan an event'],
  Client_Checkout:    ['client', 9,  '/checkout',          'checkout',      'Checkout'],
  Client_Confirmation:['client', 10, '/confirmation',      'confirmation',  'Confirmation'],
  Client_MyBookings:  ['client', 11, '/bookings',          'my_bookings',   'My bookings'],
  Client_Chat:        ['client', 12, '/chat/:threadId',    'chat',          'Chat'],
  Biz_Onboarding:     ['business', 1, '/biz/onboarding',   'onboarding',    'Onboarding & verification'],
  Biz_Dashboard:      ['business', 2, '/biz/dashboard',    'dashboard',     'Dashboard home'],
  Biz_Calendar:       ['business', 3, '/biz/calendar',     'calendar',      'Calendar'],
  Biz_Clients:        ['business', 4, '/biz/clients',      'clients',       'Clients'],
  Biz_Earnings:       ['business', 5, '/biz/earnings',     'earnings',      'Earnings & payouts'],
  Biz_Services:       ['business', 6, '/biz/services',     'services',      'Services & pricing'],
  Biz_FeaturedSpots:  ['business', 7, '/biz/featured',     'featured_spots','Featured Spots'],
  Biz_Settings:       ['business', 8, '/biz/settings',     'settings',      'Settings'],
};

const canvas = JSON.parse(fs.readFileSync(path.join(SRC, 'canvas.json'), 'utf8'));
const dims = Object.fromEntries(canvas.artboards.map((a) => [a.file.replace('.dc.html', ''), a]));

function slug(s) {
  return s.replace(/([a-z0-9])([A-Z])/g, '$1-$2').toLowerCase();
}

function tally(list) {
  const m = new Map();
  for (const x of list) m.set(x, (m.get(x) || 0) + 1);
  return [...m.entries()].sort((a, b) => b[1] - a[1]);
}

for (const [name, [row, order, route, feature, title]] of Object.entries(SCREENS)) {
  const file = path.join(SRC, `${name}.dc.html`);
  if (!fs.existsSync(file)) { console.warn('missing artboard:', name); continue; }
  const html = fs.readFileSync(file, 'utf8');
  const tree = outline(html);
  const d = dims[name] || {};

  const localClasses = [...html.matchAll(/\.([a-zA-Z][\w-]*)\s*\{([^}]*)\}/g)]
    .filter((m) => m[1] !== 'head')
    .map((m) => [m[1], m[2].trim().replace(/\s+/g, ' ')]);

  const colors = tally((html.split('<x-dc>')[1] || '').match(/#[0-9A-Fa-f]{6}/g) || [])
    .map(([c, n]) => `${c.toUpperCase()} (${n})`);
  const px = (re) => tally((html.match(re) || []).map((s) => s.split(':')[1].trim().replace(/px$/, '')));
  const sizes = px(/font-size:\s*[0-9.]+px/g);
  const radii = px(/border-radius:\s*[0-9.]+px/g);
  const gradients = [...new Set((html.match(/linear-gradient\([^)]*\)/g) || []))];
  const svgCount = (html.match(/<svg/g) || []).length;
  const texts = collectText(tree);

  const rootStyle = parseStyle(tree.style);
  const outlineText = renderOutline(tree).join('\n');

  const generated = `# ${row === 'client' ? 'Client' : 'Business'} · ${title}

| | |
|---|---|
| **Artboard** | [\`.design-src/${name}.dc.html\`](../../../.design-src/${name}.dc.html) |
| **Reference size** | ${d.w} × ${d.h} |
| **Route** | \`${route}\` |
| **Widget** | \`lib/features/${row}/${feature}/presentation/${feature}_screen.dart\` |
| **Build order** | ${row} #${order} |
| **Icons on screen** | ${svgCount} |

> Everything above the HANDWRITTEN marker is generated from the artboard by
> \`node tool/design/specgen.mjs\`. Do not edit it — edit the artboard, or add
> your notes below the marker.

## Root container

\`\`\`
${[...rootStyle].map(([k, v]) => `${k}: ${v}`).join('\n')}
\`\`\`

Per [Rule 1](../../03-RESPONSIVE-RULES.md): drop \`width\`, \`height\` and
\`overflow\`; keep the background; wrap in \`SafeArea\`.

## Layout tree

\`\`\`
${outlineText}
\`\`\`

## Copy inventory

Every visible string, in document order. These go into
\`lib/features/${row}/${feature}/data/fixtures.dart\` verbatim.

${texts.map((t) => `- \`${t.replace(/`/g, '\\`')}\``).join('\n') || '_none_'}

## Tokens on this screen

**Colours** — ${colors.join(' · ') || '_none_'}

**Font sizes** — ${sizes.map(([s, n]) => `${s}px (${n})`).join(' · ') || '_none_'}

**Radii** — ${radii.map(([s, n]) => `${s}px (${n})`).join(' · ') || '_none_'}

${gradients.length ? `**Gradients**\n\n${gradients.map((g) => `- \`${g}\``).join('\n')}` : ''}

## Artboard-local CSS classes

${localClasses.length
    ? localClasses.map(([n, css]) => `\`.${n}\`\n\n\`\`\`css\n${css}\n\`\`\`\n`).join('\n')
    : '_None — this screen is entirely inline-styled._'}

${MARKER}
`;

  const outDir = path.join(SPECS, row);
  fs.mkdirSync(outDir, { recursive: true });
  const outFile = path.join(outDir, `${String(order).padStart(2, '0')}-${slug(feature).replace(/_/g, '-')}.md`);

  let handwritten = '';
  if (fs.existsSync(outFile)) {
    const existing = fs.readFileSync(outFile, 'utf8');
    const i = existing.indexOf(MARKER);
    if (i >= 0) handwritten = existing.slice(i + MARKER.length);
  }
  if (!handwritten.trim()) {
    handwritten = fs.readFileSync(path.join(SPECS, '_TEMPLATE.md'), 'utf8')
      .split(MARKER)[1] || '';
  }

  fs.writeFileSync(outFile, generated + handwritten);
  console.log('wrote', path.relative(ROOT, outFile));
}

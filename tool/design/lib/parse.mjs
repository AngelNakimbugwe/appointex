// Minimal HTML outliner for the generated .dc.html artboards.
// These files are machine-generated and well-formed, so a tag-stack parser is
// enough - we deliberately avoid a dependency here.

/** Parse a `style="..."` attribute into an ordered map. */
export function parseStyle(style) {
  const out = new Map();
  for (const decl of (style || '').split(';')) {
    const i = decl.indexOf(':');
    if (i < 0) continue;
    const k = decl.slice(0, i).trim();
    const v = decl.slice(i + 1).trim();
    if (k) out.set(k, v);
  }
  return out;
}

/** Style properties worth showing in a layout tree, in display order. */
const KEEP = [
  'display', 'flex-direction', 'flex', 'flex-shrink', 'grid-template-columns',
  'gap', 'align-items', 'justify-content', 'width', 'height', 'min-height',
  'max-width', 'aspect-ratio', 'padding', 'margin', 'background', 'border',
  'border-top', 'border-bottom', 'border-left', 'border-radius', 'position',
  'top', 'right', 'bottom', 'left', 'opacity', 'overflow', 'font-size',
  'font-weight', 'color', 'line-height', 'letter-spacing', 'text-transform',
  'text-align', 'white-space',
];

export function summariseStyle(style) {
  const m = parseStyle(style);
  const parts = [];
  for (const k of KEEP) if (m.has(k)) parts.push(`${k}:${m.get(k)}`);
  return parts.join('; ');
}

/**
 * Walk the artboard body and yield a node tree.
 * `<svg>` subtrees are collapsed into a single `svg` node - their internals are
 * the icon catalog's business, not the layout's.
 */
export function outline(html) {
  const body = html.split('<x-dc>')[1]?.split('</x-dc>')[0] ?? html;
  const root = { tag: 'root', cls: '', style: '', text: '', children: [] };
  const stack = [root];
  const VOID = new Set(['br', 'hr', 'img', 'input', 'meta', 'link']);

  const re = /<\/?([a-zA-Z][\w-]*)([^>]*?)(\/?)>|([^<]+)/g;
  let m;
  let skipDepth = 0; // inside <svg> or <style>

  while ((m = re.exec(body)) !== null) {
    const [full, tag, attrs = '', selfClose, text] = m;

    if (text !== undefined) {
      if (skipDepth === 0) {
        const t = decodeEntities(text).replace(/\s+/g, ' ').trim();
        if (t) stack[stack.length - 1].text += (stack[stack.length - 1].text ? ' ' : '') + t;
      }
      continue;
    }

    const closing = full.startsWith('</');
    const name = tag.toLowerCase();

    if (skipDepth > 0) {
      if (name === 'svg' || name === 'style' || name === 'helmet') {
        if (closing) skipDepth--;
        else if (!selfClose) skipDepth++;
      }
      continue;
    }

    if (name === 'svg' || name === 'style' || name === 'helmet') {
      if (!closing) {
        if (name === 'svg') stack[stack.length - 1].children.push({ tag: 'svg', cls: '', style: '', text: '', children: [] });
        if (!selfClose) skipDepth = 1;
      }
      continue;
    }

    if (closing) {
      if (stack.length > 1) stack.pop();
      continue;
    }

    const node = {
      tag: name,
      cls: (attrs.match(/class="([^"]*)"/) || [])[1] || '',
      style: (attrs.match(/style="([^"]*)"/) || [])[1] || '',
      text: '',
      children: [],
    };
    stack[stack.length - 1].children.push(node);
    if (!selfClose && !VOID.has(name)) stack.push(node);
  }

  // The artboard root is the single top-level div.
  return root.children.find((c) => c.tag === 'div') ?? root;
}

export function decodeEntities(s) {
  return s
    .replace(/&hellip;/g, '…')
    .replace(/&middot;/g, '·')
    .replace(/&rarr;/g, '→')
    .replace(/&larr;/g, '←')
    .replace(/&times;/g, '×')
    .replace(/&ndash;/g, '–')
    .replace(/&mdash;/g, '—')
    .replace(/&bull;/g, '•')
    .replace(/&nbsp;/g, ' ')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#(\d+);/g, (_, d) => String.fromCharCode(+d));
}

/** Render a node tree as an indented text outline. */
export function renderOutline(node, depth = 0, lines = []) {
  const pad = '  '.repeat(depth);
  if (node.tag === 'svg') {
    lines.push(`${pad}<svg>`);
    return lines;
  }
  const cls = node.cls ? `.${node.cls.split(/\s+/).join('.')}` : '';
  const s = summariseStyle(node.style);
  const text = node.text ? `  "${node.text.length > 70 ? node.text.slice(0, 67) + '…' : node.text}"` : '';
  lines.push(`${pad}${node.tag}${cls}${s ? ` { ${s} }` : ''}${text}`);
  for (const c of node.children) renderOutline(c, depth + 1, lines);
  return lines;
}

/** Collect every visible string, in document order. */
export function collectText(node, out = []) {
  if (node.text) out.push(node.text);
  for (const c of node.children) collectText(c, out);
  return out;
}

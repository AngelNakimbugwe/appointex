// Unpacks the Claude Design canvas artifact into editable per-screen sources.
//
//   node tool/design/extract.mjs [path/to/artifact.html]
//
// The artifact embeds the whole design as JSON in a <script id="appifact-doc">
// tag. This writes each artboard out to .design-src/ so the rest of the
// pipeline - and any human - can read it.

import fs from 'node:fs';
import path from 'node:path';

const ROOT = path.resolve(import.meta.dirname, '../..');
const input = process.argv[2] ?? path.join(ROOT, 'appointex-app-pages.html');
const OUT = path.join(ROOT, '.design-src');

const src = fs.readFileSync(input, 'utf8');
const m = src.match(/<script type="application\/json" id="appifact-doc">\s*([\s\S]*?)\s*<\/script>/);
if (!m) {
  console.error(`No <script id="appifact-doc"> found in ${input}.`);
  console.error('Is this a Claude Design canvas artifact?');
  process.exit(1);
}

const doc = JSON.parse(m[1]);
const files = doc.content?.files ?? {};
if (!Object.keys(files).length) {
  console.error('Artifact contains no files.');
  process.exit(1);
}

fs.mkdirSync(OUT, { recursive: true });
for (const [name, body] of Object.entries(files)) {
  const content = typeof body === 'string' ? body : JSON.stringify(body, null, 2);
  fs.writeFileSync(path.join(OUT, name), content);
}

// Keep the non-file metadata (title, comments) for reference, without
// duplicating the file bodies.
const meta = { ...doc, content: { ...doc.content, files: Object.keys(files) } };
fs.writeFileSync(path.join(OUT, '_doc-meta.json'), JSON.stringify(meta, null, 2));

const canvas = files['canvas.json'] ? JSON.parse(files['canvas.json']) : null;
console.log(`"${doc.title}" -> ${path.relative(ROOT, OUT)}`);
console.log(`${Object.keys(files).length} files, ${canvas?.artboards?.length ?? '?'} artboards`);

// Layer-2 verification (docs/06-VERIFICATION.md): builds a self-contained
// comparison page - the frozen artboard in an iframe above the Flutter golden
// PNG, both at the artboard's reference width - with a golden-opacity slider
// and flip mode (f to flip panes, Esc to show both).
//
//   dart run tool/design/compare.dart Client_Home
//   -> build/compare/Client_Home.html

import 'dart:io';

void main(List<String> arguments) {
  final root = _findProjectRoot();
  if (root == null) {
    stderr.writeln(
      'error: cannot find the project root - no .design-src/ directory '
      'found at or above the current directory. Run from the repo.',
    );
    exit(1);
  }

  final screens = _listScreens(root);
  if (screens.isEmpty) {
    stderr.writeln('error: no *.dc.html artboards found in .design-src/.');
    exit(1);
  }

  if (arguments.isEmpty) {
    _printUsage(screens);
    return;
  }

  final first = arguments.first;
  if (first == '-h' || first == '--help') {
    _printUsage(screens);
    return;
  }

  if (arguments.length > 1) {
    stderr.writeln(
      'error: expected exactly one screen name, got ${arguments.length} '
      'arguments.',
    );
    _printUsage(screens);
    exit(1);
  }

  final wanted = _normalizeName(first);
  final name = _resolveScreen(wanted, screens);
  if (name == null) {
    stderr.writeln('error: no artboard named "$first" in .design-src/.');
    _printUsage(screens);
    exit(1);
  }

  _generate(root, name);
}

Directory? _findProjectRoot() {
  final script = Platform.script;
  final scriptDir = script.isScheme('file')
      ? File.fromUri(script).parent
      : null;
  final starts = <Directory>[Directory.current];
  if (scriptDir != null) {
    starts.add(scriptDir);
  }
  for (final start in starts) {
    for (Directory? dir = start; dir != null; dir = _parentOf(dir)) {
      if (Directory('${dir.path}${Platform.pathSeparator}.design-src')
          .existsSync()) {
        return dir;
      }
    }
  }
  return null;
}

Directory? _parentOf(Directory dir) {
  final parent = dir.parent;
  return parent.path == dir.path ? null : parent;
}

List<String> _listScreens(Directory root) {
  final designSrc = Directory(
    '${root.path}${Platform.pathSeparator}.design-src',
  );
  if (!designSrc.existsSync()) {
    return const <String>[];
  }
  final screens = <String>[];
  for (final entry in designSrc.listSync()) {
    if (entry is File && entry.path.toLowerCase().endsWith('.dc.html')) {
      final fileName = entry.path.split(RegExp(r'[\\/]')).last;
      screens.add(fileName.substring(0, fileName.length - '.dc.html'.length));
    }
  }
  screens.sort();
  return screens;
}

void _printUsage(List<String> screens) {
  stdout.writeln('''
Layer-2 comparison (docs/06-VERIFICATION.md) - artboard vs Flutter golden.

Usage:
  dart run tool/design/compare.dart <ScreenName>

Writes build/compare/<ScreenName>.html - a self-contained page with the
artboard in an iframe above the golden PNG at the same reference width,
a golden-opacity slider, and flip mode (f to flip panes, Esc to show both).

Available screens (${screens.length}):''');
  for (final screen in screens) {
    stdout.writeln('  $screen');
  }
}

String _normalizeName(String raw) {
  var name = raw.trim();
  if (name.toLowerCase().endsWith('.dc.html')) {
    name = name.substring(0, name.length - '.dc.html'.length);
  } else if (name.toLowerCase().endsWith('.html')) {
    name = name.substring(0, name.length - '.html'.length);
  }
  return name;
}

String? _resolveScreen(String wanted, List<String> screens) {
  for (final screen in screens) {
    if (screen == wanted) {
      return screen;
    }
  }
  final lower = wanted.toLowerCase();
  for (final screen in screens) {
    if (screen.toLowerCase() == lower) {
      return screen;
    }
  }
  return null;
}

String _snakeCase(String name) {
  return name
      .split('_')
      .map(
        (part) => part
            .replaceAllMapped(
              RegExp(r'([a-z0-9])([A-Z])'),
              (match) => '${match[1]}_${match[2]}',
            )
            .toLowerCase(),
      )
      .join('_');
}

int? _firstDivIndex(String html, int from) {
  var position = from;
  while (true) {
    final index = html.indexOf('<div', position);
    if (index < 0) {
      return null;
    }
    final after = index + 4 < html.length ? html[index + 4] : '';
    if (after == '' || ' \t\n\r/>'.contains(after)) {
      return index;
    }
    position = index + 1;
  }
}

double? _pxValue(String value) {
  final match = RegExp(r'^(\d+(?:\.\d+)?)px$').firstMatch(value);
  if (match == null) {
    return null;
  }
  return double.parse(match.group(1)!);
}

({double width, double height, bool fromMinHeight})? _parseRootSize(
  String html,
) {
  final helmetEnd = html.indexOf('</helmet>');
  final divStart = _firstDivIndex(html, helmetEnd >= 0 ? helmetEnd : 0);
  if (divStart == null) {
    return null;
  }
  final tagEnd = html.indexOf('>', divStart);
  if (tagEnd < 0) {
    return null;
  }
  final openingTag = html.substring(divStart, tagEnd + 1);
  final styleMatch = RegExp(r'''style\s*=\s*(["'])([\s\S]*?)\1''')
      .firstMatch(openingTag);
  if (styleMatch == null) {
    return null;
  }
  double? width;
  double? height;
  double? minHeight;
  for (final declaration in styleMatch.group(2)!.split(';')) {
    final colon = declaration.indexOf(':');
    if (colon < 0) {
      continue;
    }
    final property = declaration.substring(0, colon).trim().toLowerCase();
    final value = declaration.substring(colon + 1).trim().toLowerCase();
    if (property == 'width') {
      width ??= _pxValue(value);
    } else if (property == 'height') {
      height ??= _pxValue(value);
    } else if (property == 'min-height') {
      minHeight ??= _pxValue(value);
    }
  }
  final resolvedHeight = height ?? minHeight;
  if (width == null || resolvedHeight == null) {
    return null;
  }
  return (
    width: width,
    height: resolvedHeight,
    fromMinHeight: height == null && minHeight != null,
  );
}

String _relativeHref(String fromFile, String toFile) {
  final from = Uri.file(fromFile).pathSegments;
  final to = Uri.file(toFile).pathSegments;
  final fromDir = from.sublist(0, from.length - 1);
  var common = 0;
  while (common < fromDir.length &&
      common < to.length &&
      fromDir[common] == to[common]) {
    common++;
  }
  final segments = <String>[
    for (var i = 0; i < fromDir.length - common; i++) '..',
    for (final segment in to.sublist(common)) Uri.encodeComponent(segment),
  ];
  return segments.isEmpty ? '.' : segments.join('/');
}

String _escapeHtml(String text) {
  return text
      .replaceAll('&', '&amp;')
      .replaceAll('<', '&lt;')
      .replaceAll('>', '&gt;')
      .replaceAll('"', '&quot;')
      .replaceAll("'", '&#39;');
}

String _fmt(double value) {
  if (value == value.truncateToDouble()) {
    return value.truncate().toString();
  }
  return value.toString();
}

void _generate(Directory root, String name) {
  final sep = Platform.pathSeparator;
  final artboardFile = File('${root.path}$sep.design-src$sep$name.dc.html');
  final artboardHtml = artboardFile.readAsStringSync();

  double width;
  double height;
  String sizeLabel;
  final parsed = _parseRootSize(artboardHtml);
  if (parsed != null) {
    width = parsed.width;
    height = parsed.height;
    sizeLabel = parsed.fromMinHeight
        ? 'parsed from artboard root (min-height)'
        : 'parsed from artboard root';
  } else if (name.startsWith('Client_')) {
    width = 390.0;
    height = 844.0;
    sizeLabel = 'fallback: Client_* default 390x844';
  } else if (name.startsWith('Biz_')) {
    width = 1160.0;
    height = 760.0;
    sizeLabel = 'fallback: Biz_* default 1160x760';
  } else {
    width = 390.0;
    height = 844.0;
    sizeLabel = 'fallback: default 390x844';
  }

  final snake = _snakeCase(name);
  final goldenFile = File('${root.path}${sep}test${sep}goldens$sep$snake.png');
  final goldenExists = goldenFile.existsSync();

  final outDir = Directory('${root.path}${sep}build${sep}compare');
  outDir.createSync(recursive: true);
  final outFile = File('${outDir.path}$sep$name.html');

  final page = _renderPage(
    name: name,
    width: width,
    height: height,
    artHref: _relativeHref(outFile.path, artboardFile.path),
    goldenHref: _relativeHref(outFile.path, goldenFile.path),
    artDisplay: '.design-src/$name.dc.html',
    goldenDisplay: 'test/goldens/$snake.png',
    goldenExists: goldenExists,
  );

  outFile.writeAsStringSync(page);

  stdout.writeln('wrote ${outFile.absolute.path}');
  stdout.writeln('  reference ${_fmt(width)}x${_fmt(height)} ($sizeLabel)');
  if (!goldenExists) {
    stdout.writeln(
      "  golden missing - run the screen's golden test first "
      '(expected at test/goldens/$snake.png)',
    );
  }
}

String _renderPage({
  required String name,
  required double width,
  required double height,
  required String artHref,
  required String goldenHref,
  required String artDisplay,
  required String goldenDisplay,
  required bool goldenExists,
}) {
  final w = _fmt(width);
  final h = _fmt(height);
  final nameEsc = _escapeHtml(name);
  final artSrc = _escapeHtml(artHref);
  final goldenSrc = _escapeHtml(goldenHref);
  final artLabel = _escapeHtml(artDisplay);
  final goldenLabel = _escapeHtml(goldenDisplay);
  final missingMarkup =
      '<div class="missing" style="width: ${w}px">\n'
      '  <strong>golden missing — run the screen\'s golden test first</strong>\n'
      '  <span>expected at <code>$goldenLabel</code> — regenerate this page '
      'once the golden exists</span>\n'
      '</div>';
  final goldenInner = goldenExists
      ? '<img class="golden-img" src="$goldenSrc" alt="golden for $nameEsc" '
            'style="width: ${w}px; height: auto">'
      : missingMarkup;
  return '''
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>$nameEsc · artboard vs golden</title>
<style>
  body { margin: 0; padding: 28px; background: #EFECE4; color: #3A3A3A;
         font-family: system-ui, -apple-system, "Segoe UI", sans-serif; }
  header { display: flex; flex-direction: column; gap: 10px; margin: 0 0 26px; }
  h1 { margin: 0; font-size: 18px; color: #6B3F3A; }
  .meta { font-size: 12.5px; color: #7A7A7A; }
  .controls { display: flex; align-items: center; gap: 16px; font-size: 13px;
              background: #F7F5F1; border: 1px solid #E8E3D8; border-radius: 10px;
              padding: 9px 14px; width: fit-content; }
  .controls label { display: flex; align-items: center; gap: 8px; }
  input[type="range"] { width: 180px; }
  #opacityValue { min-width: 4ch; }
  kbd { background: #FFFFFF; border: 1px solid #D7D1C2; border-bottom-width: 2px;
        border-radius: 4px; padding: 0 6px; font-family: inherit; font-size: 11px; }
  .hint { color: #7A7A7A; }
  #mode { font-weight: 600; color: #6B3F3A; }
  .panes { display: flex; flex-direction: column; align-items: flex-start; gap: 26px; }
  .pane h2 { font-size: 11px; font-weight: 700; letter-spacing: 0.05em;
             text-transform: uppercase; color: #9A9A9A; margin: 0 0 6px; }
  iframe { display: block; border: 0; background: #FFFFFF; outline: 1px solid #D7D1C2; }
  .golden-img { display: block; background: #FFFFFF; outline: 1px solid #D7D1C2; }
  .missing { box-sizing: border-box; padding: 22px 24px; background: #FBF6EE;
             border: 1px dashed #C9A227; border-radius: 12px;
             display: flex; flex-direction: column; gap: 6px;
             font-size: 13.5px; color: #6B5A1E; }
  .missing strong { font-size: 14.5px; }
  .missing code { font-family: Consolas, Menlo, monospace; font-size: 12px; color: #8A7A3E; }
</style>
</head>
<body>
<header>
  <h1>$nameEsc</h1>
  <div class="meta">reference $w × $h · artboard vs Flutter golden</div>
  <div class="controls">
    <label>golden opacity
      <input type="range" id="opacity" min="0" max="100" value="100">
      <span id="opacityValue">100%</span>
    </label>
    <span class="hint"><kbd>f</kbd> flip · <kbd>Esc</kbd> show both ·
      view: <span id="mode">both</span></span>
  </div>
</header>
<div class="panes">
  <section class="pane" id="artboardPane" style="width: ${w}px">
    <h2>artboard · $artLabel</h2>
    <iframe src="$artSrc" title="$nameEsc artboard"
            style="width: ${w}px; height: ${h}px"></iframe>
  </section>
  <section class="pane" id="goldenPane" style="width: ${w}px">
    <h2>golden · $goldenLabel</h2>
    <div id="goldenContent">$goldenInner</div>
  </section>
</div>
<template id="missingTemplate">$missingMarkup</template>
<script>
(function () {
  var artboardPane = document.getElementById('artboardPane');
  var goldenPane = document.getElementById('goldenPane');
  var goldenContent = document.getElementById('goldenContent');
  var slider = document.getElementById('opacity');
  var opacityValue = document.getElementById('opacityValue');
  var mode = document.getElementById('mode');
  var flipping = false;
  var goldenVisible = false;

  function apply() {
    if (flipping) {
      artboardPane.style.display = goldenVisible ? 'none' : '';
      goldenPane.style.display = goldenVisible ? '' : 'none';
      goldenContent.style.opacity = '1';
      mode.textContent = goldenVisible ? 'golden only' : 'artboard only';
    } else {
      artboardPane.style.display = '';
      goldenPane.style.display = '';
      goldenContent.style.opacity = String(slider.value / 100);
      mode.textContent = 'both';
    }
    opacityValue.textContent = slider.value + '%';
    slider.disabled = flipping;
  }

  function showMissing() {
    goldenContent.innerHTML = '';
    goldenContent.appendChild(
        document.getElementById('missingTemplate').content.cloneNode(true));
    apply();
  }

  slider.addEventListener('input', apply);
  window.addEventListener('keydown', function (event) {
    if (event.key === 'f' || event.key === 'F') {
      if (flipping) {
        goldenVisible = !goldenVisible;
      } else {
        flipping = true;
        goldenVisible = false;
      }
      apply();
    } else if (event.key === 'Escape') {
      flipping = false;
      apply();
    }
  });

  var img = goldenContent.querySelector('img');
  if (img) {
    img.addEventListener('error', showMissing);
  }
  apply();
})();
</script>
</body>
</html>
''';
}

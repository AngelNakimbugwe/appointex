import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appointex/design/theme.dart';

/// Pins everything that could vary between machines — docs/06-VERIFICATION.md
/// Layer 1. Artboards have no safe-area inset, so padding is zero.
Widget harness(
  Widget child, {
  Size size = const Size(390, 844),
  TextScaler textScaler = TextScaler.noScaling,
}) {
  return MediaQuery(
    data: MediaQueryData(
      size: size,
      devicePixelRatio: 1.0, // 1:1 with design px
      textScaler: textScaler,
      padding: EdgeInsets.zero,
    ),
    child: MaterialApp(
      theme: AxTheme.light,
      debugShowCheckedModeBanner: false,
      home: child,
    ),
  );
}

/// SvgPicture decodes async — without this pass icons render blank in goldens.
Future<void> precacheIcons(WidgetTester tester) async {
  const iconDir = 'assets/icons';
  final dirs = ['ui', 'duo', 'art'];
  for (final dir in dirs) {
    final entities = Directory('$iconDir/$dir').listSync();
    for (final entity in entities) {
      if (entity is File && entity.path.endsWith('.svg')) {
        final asset = entity.path.replaceAll('\\', '/');
        final loader = SvgAssetLoader(asset);
        await svg.cache.putIfAbsent(
          loader.cacheKey(null),
          () => loader.loadBytes(null),
        );
      }
    }
  }
  await tester.pumpAndSettle();
}

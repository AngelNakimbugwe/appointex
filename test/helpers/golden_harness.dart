import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appointex/design/theme.dart';

/// Pins everything that could vary between machines — docs/06-VERIFICATION.md
/// Layer 1. Artboards have no safe-area inset, so padding is zero.
///
/// [overrides] wraps the tree in a [ProviderScope] with the given Riverpod
/// overrides — needed for any screen that reads Firebase-backed providers
/// (auth, Firestore repositories). Screens with no such providers can ignore
/// it; it defaults to an empty scope either way, so no existing call site
/// needs to change.
Widget harness(
  Widget child, {
  Size size = const Size(390, 844),
  TextScaler textScaler = TextScaler.noScaling,
  // Riverpod's `Override` type can't be named directly in this SDK/analyzer
  // combination (a resolution quirk of the sealed class declared as a
  // `part of` framework.dart) — `dynamic` sidesteps it. Left `null` (rather
  // than `const []`) so the untyped-empty-list case never has to be reified
  // as `List<dynamic>` and fail ProviderScope's runtime `List<Override>`
  // check; omitting the argument instead lets ProviderScope's own
  // (correctly-typed, from inside its own library) default apply.
  dynamic overrides,
}) {
  final inner = MediaQuery(
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
  return overrides == null
      ? ProviderScope(child: inner)
      : ProviderScope(overrides: overrides, child: inner);
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

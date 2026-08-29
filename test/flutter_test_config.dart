import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Loads the bundled Manrope weights so golden tests render the real font
/// deterministically (docs/06-VERIFICATION.md Layer 1).
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  setUpAll(() async {
    final paths = [
      'assets/fonts/Manrope-Medium.ttf',
      'assets/fonts/Manrope-SemiBold.ttf',
      'assets/fonts/Manrope-Bold.ttf',
      'assets/fonts/Manrope-ExtraBold.ttf',
    ];
    final loader = FontLoader('Manrope');
    for (final path in paths) {
      final data = File(path).readAsBytesSync();
      loader.addFont(
        Future.value(ByteData.view(Uint8List.fromList(data).buffer)),
      );
    }
    await loader.load();
  });

  await testMain();
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appointex/features/client/home/presentation/home_screen.dart';

import '../helpers/golden_harness.dart';

void main() {
  testWidgets('Client_Home matches artboard', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    // Fixed morning timestamp: the golden baseline shows "Good morning".
    await tester.pumpWidget(harness(HomeScreen(now: DateTime(2026, 1, 1, 9))));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(HomeScreen),
      matchesGoldenFile('../goldens/client_home.png'),
    );
  });

  testWidgets('carousel swipes and the dots track the page', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const HomeScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    Future<void> settledState() async {
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
    }

    final dot0 = find.byKey(const ValueKey('home-carousel-dot-0'));
    final dot1 = find.byKey(const ValueKey('home-carousel-dot-1'));
    final dot2 = find.byKey(const ValueKey('home-carousel-dot-2'));

    expect(tester.getSize(dot0), const Size(16, 6));
    expect(tester.getSize(dot1), const Size(6, 6));

    await tester.drag(find.byType(PageView), const Offset(-350, 0));
    await settledState();
    expect(tester.getSize(dot0), const Size(6, 6));
    expect(tester.getSize(dot1), const Size(16, 6));

    await tester.drag(find.byType(PageView), const Offset(-350, 0));
    await settledState();
    expect(tester.getSize(dot1), const Size(6, 6));
    expect(tester.getSize(dot2), const Size(16, 6));

    await tester.tap(dot0);
    await settledState();
    expect(tester.getSize(dot0), const Size(16, 6));
    expect(tester.getSize(dot2), const Size(6, 6));
  });

  testWidgets('carousel auto-advances every 2 s and wraps around',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const HomeScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    Future<void> settleAfterAdvance() async {
      await tester.pump(const Duration(milliseconds: 350));
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
    }

    final dot0 = find.byKey(const ValueKey('home-carousel-dot-0'));
    final dot1 = find.byKey(const ValueKey('home-carousel-dot-1'));
    final dot2 = find.byKey(const ValueKey('home-carousel-dot-2'));

    await tester.pump(const Duration(seconds: 2));
    await settleAfterAdvance();
    expect(tester.getSize(dot1), const Size(16, 6));

    await tester.pump(const Duration(seconds: 2));
    await settleAfterAdvance();
    expect(tester.getSize(dot2), const Size(16, 6));

    await tester.pump(const Duration(seconds: 2));
    await settleAfterAdvance();
    expect(tester.getSize(dot0), const Size(16, 6));
  });

  for (final size in [
    const Size(320, 640),
    const Size(390, 844),
    const Size(430, 932),
  ]) {
    testWidgets('no overflow at ${size.width}×${size.height}', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(harness(const HomeScreen(), size: size));
      await precacheIcons(tester);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets(
      'no overflow at ${size.width}×${size.height} at textScaler 1.3',
      (tester) async {
        await tester.binding.setSurfaceSize(size);
        await tester.pumpWidget(
          harness(
            const HomeScreen(),
            size: size,
            textScaler: TextScaler.linear(1.3),
          ),
        );
        await precacheIcons(tester);
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      },
    );
  }
}

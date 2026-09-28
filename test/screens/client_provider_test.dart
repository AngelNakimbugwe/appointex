import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appointex/features/client/provider/presentation/provider_screen.dart';

import '../helpers/golden_harness.dart';

void main() {
  testWidgets('Client_Provider matches artboard', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const ProviderScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(ProviderScreen),
      matchesGoldenFile('../goldens/client_provider.png'),
    );
  });

  testWidgets('Client_Provider copy inventory is verbatim', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const ProviderScreen()));
    await precacheIcons(tester);
    const copy = [
      'Patricia Glam Studio',
      '5.0 · 142 reviews · Kololo, Kampala',
      'ID verified · Buyer protection when you pay in the app',
      'Offers mobile service · +5% travel fee',
      'Portfolio',
      'See all',
      'Photos and videos from real Appointex bookings',
      'Services',
      'Reviews',
      'About',
      'Bridal makeup, full glam',
      '2 hr · UGX 180,000',
      'Everyday glam',
      '45 min · UGX 60,000',
      'Photoshoot makeup',
      '1 hr · UGX 90,000',
      'Lashes add-on',
      '20 min · UGX 20,000',
      '2 selected',
      'UGX 150,000',
      'Continue',
    ];
    for (final text in copy) {
      expect(find.text(text), findsOneWidget, reason: text);
    }
  });

  for (final size in [const Size(320, 640), const Size(390, 844), const Size(430, 932)]) {
    testWidgets('Client_Provider has no overflow at $size', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(harness(const ProviderScreen(), size: size));
      await precacheIcons(tester);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets('Client_Provider has no overflow at $size with textScaler 1.3', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(
        harness(
          const ProviderScreen(),
          size: size,
          textScaler: TextScaler.linear(1.3),
        ),
      );
      await precacheIcons(tester);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  }
}

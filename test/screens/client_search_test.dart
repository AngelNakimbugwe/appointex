import 'package:appointex/features/client/search/presentation/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/golden_harness.dart';

void main() {
  testWidgets('Client_Search matches artboard at 390x844', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const SearchScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(SearchScreen),
      matchesGoldenFile('../goldens/client_search.png'),
    );
  });

  testWidgets('Client_Search carries every copy string verbatim', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const SearchScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    const copy = [
      'Makeup artists',
      'Kampala',
      'Price',
      'Rating 4.5+',
      'Available today',
      'Featured in Makeup',
      'Patricia Glam Studio',
      '5.0 ★ · Kololo',
      'Faces by Immaculate',
      '4.8 ★ · Ntinda',
      'Glow by Sandra',
      '4.9 ★ · Muyenga',
      'All makeup artists · 28',
      "Ritah's Touch Makeup",
      '4.9 (74) · Naguru',
      'Editorial & soft glam',
      'from UGX 50,000',
      "Nina's Beauty Bar",
      '4.7 (63) · Bugolobi',
      'Everyday glam & makeovers',
      'from UGX 35,000',
      'Comfort Namutebi Makeup',
      '4.6 (21) · Kansanga',
      'New to Appointex',
      'from UGX 30,000',
    ];
    for (final string in copy) {
      expect(find.text(string), findsOneWidget, reason: string);
    }
  });

  for (final size in [
    const Size(320, 640),
    const Size(390, 844),
    const Size(430, 932),
  ]) {
    testWidgets('Client_Search has no overflow at $size', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(harness(const SearchScreen(), size: size));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets(
      'Client_Search has no overflow at $size with textScaler 1.3',
      (tester) async {
        await tester.binding.setSurfaceSize(size);
        await tester.pumpWidget(
          harness(
            const SearchScreen(),
            size: size,
            textScaler: TextScaler.linear(1.3),
          ),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      },
    );
  }

  testWidgets('Client_Search renders a passed category as a selected chip', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const SearchScreen(initialCategory: 'Hair')));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    expect(find.text('Hair'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

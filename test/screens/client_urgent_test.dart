import 'package:appointex/features/client/urgent/presentation/urgent_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/golden_harness.dart';

void main() {
  testWidgets('Client_Urgent matches artboard at 390x844', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const UrgentScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(UrgentScreen),
      matchesGoldenFile('../goldens/client_urgent.png'),
    );
  });

  testWidgets('Client_Urgent carries every copy string verbatim', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const UrgentScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    const copy = [
      'Urgent booking',
      'Need it today?',
      "We'll match you with a provider who has a real opening in your window.",
      'What do you need?',
      'Hair',
      'Makeup',
      'Nails',
      'Spa',
      'How soon?',
      'Today',
      '+15% rush fee',
      'Next 3 hours',
      '+25% rush fee',
      'ASAP · within 1 hr',
      '+40% rush fee',
      'Only providers with a genuinely open slot in this window are shown. '
          'The rush fee is shown before you book, on top of the normal '
          'service price.',
      '2 providers can fit you in this window',
      'Patricia Glam Studio',
      '5.0 · Kololo · Everyday glam',
      'Free at 3:15pm today',
      "Nina's Beauty Bar",
      '4.7 · Bugolobi · Everyday glam',
      'Free at 4:00pm today',
    ];
    for (final string in copy) {
      expect(find.text(string), findsOneWidget, reason: string);
    }
    expect(
      find.text('UGX 60,000 + 25% rush → UGX 75,000', findRichText: true),
      findsOneWidget,
    );
    expect(
      find.text('UGX 35,000 + 25% rush → UGX 43,750', findRichText: true),
      findsOneWidget,
    );
  });

  for (final size in [
    const Size(320, 640),
    const Size(390, 844),
    const Size(430, 932),
  ]) {
    testWidgets('Client_Urgent has no overflow at $size', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(harness(const UrgentScreen(), size: size));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets(
      'Client_Urgent has no overflow at $size with textScaler 1.3',
      (tester) async {
        await tester.binding.setSurfaceSize(size);
        await tester.pumpWidget(
          harness(
            const UrgentScreen(),
            size: size,
            textScaler: TextScaler.linear(1.3),
          ),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      },
    );
  }
}

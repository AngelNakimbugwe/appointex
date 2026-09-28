import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appointex/features/client/book/presentation/book_screen.dart';

import '../helpers/golden_harness.dart';

void main() {
  testWidgets('Client_Book matches artboard', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const BookScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(BookScreen),
      matchesGoldenFile('../goldens/client_book.png'),
    );
  });

  testWidgets('Client_Book copy inventory is verbatim', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const BookScreen()));
    await precacheIcons(tester);
    const copy = [
      'Make an appointment',
      '+25% rush',
      'Where would you like this?',
      'At the salon',
      'At my location',
      '+5% mobile fee',
      'August 2026',
      'Some booked',
      'Fully booked',
      'Selected',
      'Available times, Wed 26 Aug',
      '9:00 am',
      '10:30 am',
      '12:00 pm',
      '1:30 pm',
      '3:00 pm',
      '4:30 pm',
      'APPOINTMENT SUMMARY',
      'Bridal makeup, full glam',
      'UGX 180,000',
      'Patricia Glam Studio · Wed 26 Aug, 12:00 pm',
      'At my location · +5% mobile fee',
      'Continue to checkout',
    ];
    for (final text in copy) {
      expect(find.text(text), findsOneWidget, reason: text);
    }
    expect(find.text('S'), findsNWidgets(2));
    expect(find.text('T'), findsNWidgets(2));
    expect(find.text('M'), findsOneWidget);
    expect(find.text('W'), findsOneWidget);
    expect(find.text('F'), findsOneWidget);
    for (var day = 1; day <= 31; day++) {
      expect(find.text('$day'), findsOneWidget, reason: 'day $day');
    }
  });

  for (final size in [const Size(320, 640), const Size(390, 844), const Size(430, 932)]) {
    testWidgets('Client_Book has no overflow at $size', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(harness(const BookScreen(), size: size));
      await precacheIcons(tester);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets('Client_Book has no overflow at $size with textScaler 1.3', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(
        harness(
          const BookScreen(),
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

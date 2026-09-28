import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appointex/features/business/dashboard/data/fixtures.dart';
import 'package:appointex/features/business/dashboard/presentation/dashboard_screen.dart';

import '../helpers/golden_harness.dart';

void main() {
  testWidgets('Biz_Dashboard matches artboard golden', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const DashboardScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(DashboardScreen),
      matchesGoldenFile('../goldens/biz_dashboard.png'),
    );
  });

  testWidgets('Biz_Dashboard copy inventory is verbatim', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const DashboardScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    const sidebar = [
      'Appointex',
      'FOR BUSINESS',
      'Dashboard',
      'Calendar',
      'Clients',
      'Earnings',
      'Services',
      'Featured Spots',
      'Settings',
    ];
    final copy = <String>[
      kGreeting,
      kDateLine,
      for (final stat in kStats) ...[stat.label, stat.value],
      kScheduleTitle,
      for (final entry in kSchedule) ...[
        entry.time,
        entry.client,
        entry.service,
        entry.status,
      ],
      kReviewsTitle,
      kReviewQuote,
      kReviewAuthor,
      ...sidebar,
    ];
    for (final text in copy) {
      expect(find.text(text), findsWidgets, reason: text);
    }
  });

  const sizes = [Size(900, 700), Size(1160, 760), Size(1440, 900)];

  for (final size in sizes) {
    testWidgets('no overflow at ${size.width}×${size.height}', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(harness(const DashboardScreen(), size: size));
      await precacheIcons(tester);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets(
      'no overflow at ${size.width}×${size.height} at 1.3× text scale',
      (tester) async {
        await tester.binding.setSurfaceSize(size);
        await tester.pumpWidget(
          harness(
            const DashboardScreen(),
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

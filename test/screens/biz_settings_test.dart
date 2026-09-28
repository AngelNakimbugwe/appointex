import 'dart:ui' show ImageByteFormat;

import 'package:appointex/design/icons/ax_icon.dart';
import 'package:appointex/design/icons/ax_icons.dart';
import 'package:appointex/design/tokens/ax_colors.dart';
import 'package:appointex/design/widgets/ax_avatar.dart';
import 'package:appointex/design/widgets/ax_sidebar.dart';
import 'package:appointex/design/widgets/ax_toggle.dart';
import 'package:appointex/features/business/settings/data/fixtures.dart';
import 'package:appointex/features/business/settings/presentation/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/golden_harness.dart';

Future<Color> _pixel(WidgetTester tester, Offset point) async {
  final element = tester.element(find.byType(SettingsScreen));
  final color = await tester.runAsync<Color>(() async {
    final image = await captureImage(element);
    final bytes = await image.toByteData(format: ImageByteFormat.rawRgba);
    final data = bytes!.buffer.asUint8List();
    final i = (point.dy.round() * image.width + point.dx.round()) * 4;
    return Color.fromARGB(data[i + 3], data[i], data[i + 1], data[i + 2]);
  });
  return color!;
}

void main() {
  testWidgets('Biz_Settings matches artboard golden', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const SettingsScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(SettingsScreen),
      matchesGoldenFile('../goldens/biz_settings.png'),
    );
  });

  testWidgets('Biz_Settings copy inventory is verbatim', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const SettingsScreen(), size: const Size(1160, 760)),
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
      kPageTitle,
      kBusinessProfileTitle,
      kBusinessName,
      kBusinessLocation,
      kPortfolioSummary,
      kManagePortfolio,
      kTeamTitle,
      for (final member in kTeam) ...[member.name, member.role],
      kUrgentTitle,
      kUrgentDescription,
      for (final rate in kUrgentRates) ...[rate.label, rate.value],
      kUrgentFootnote,
      kMobileTitle,
      kMobileDescription,
      kTravelFeeLabel,
      kTravelFeeValue,
      kMobileFootnote,
      kPayoutTitle,
      kPayoutAccount,
      kPayoutChange,
      kCommissionTitle,
      kCurrentPlanEyebrow,
      kCurrentPlanValue,
      kCurrentPlanDescription,
      kAvailablePlanEyebrow,
      kAvailablePlanValue,
      kAvailablePlanDescription,
      kCommissionFootnote,
      kNotificationsTitle,
      kNotifyBookings,
      kNotifyPayouts,
      kNotifyMarketing,
      ...sidebar,
    ];
    for (final text in copy) {
      expect(find.text(text), findsWidgets, reason: text);
    }
  });

  testWidgets('Biz_Settings geometry matches the artboard', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const SettingsScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(tester.getRect(find.byType(AxSidebar)).size, const Size(220, 760));

    final profileTitle = tester.getRect(find.text(kBusinessProfileTitle));
    expect(profileTitle.left, closeTo(272, 1));

    final commissionTitle = tester.getRect(find.text(kCommissionTitle));
    expect(commissionTitle.left, closeTo(719, 1));

    final toggles = find.byType(AxToggle);
    expect(toggles, findsNWidgets(5));
    for (var i = 0; i < 5; i++) {
      expect(tester.getRect(toggles.at(i)).size, const Size(36, 20));
    }

    const initialValues = [
      kUrgentEnabled,
      kMobileEnabled,
      kBookingRequestsEnabled,
      kPayoutConfirmationsEnabled,
      kMarketingTipsEnabled,
    ];
    for (var i = 0; i < 5; i++) {
      expect(
        (tester.widget(toggles.at(i)) as AxToggle).value,
        initialValues[i],
      );
    }

    final pin = find.byWidgetPredicate(
      (w) => w is AxIcon && w.asset == AxIcons.mapPin23,
    );
    expect(pin, findsOneWidget);
    expect(tester.getRect(pin).size, const Size(15, 15));
    expect((tester.widget(pin) as AxIcon).color, AxColors.escrow);

    expect(tester.getRect(find.byType(AxAvatar).at(0)).size, const Size(44, 44));
    expect(tester.getRect(find.byType(AxAvatar).at(1)).size, const Size(28, 28));
    expect(tester.getRect(find.byType(AxAvatar).at(2)).size, const Size(28, 28));

    final bolt = find.byWidgetPredicate(
      (w) => w is AxIcon && w.asset == AxIcons.boltFill,
    );
    expect(bolt, findsOneWidget);
    expect(tester.getRect(bolt).size, const Size(15, 15));
  });

  testWidgets('Biz_Settings paints artboard colours', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const SettingsScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(await _pixel(tester, const Offset(200, 700)), AxColors.blushPale);

    final current = tester.getRect(find.text(kCurrentPlanValue));
    expect(
      await _pixel(tester, Offset(current.left - 6, current.center.dy)),
      AxColors.brand,
    );

    final available = tester.getRect(find.text(kAvailablePlanValue));
    expect(
      await _pixel(tester, Offset(available.right + 6, available.center.dy)),
      AxColors.surfaceWarm,
    );

    final rate = tester.getRect(find.text(kUrgentRates.first.value));
    expect(
      await _pixel(tester, Offset(rate.left - 4, rate.center.dy)),
      AxColors.surfaceWarm,
    );

    final bolt = tester.getRect(
      find.byWidgetPredicate(
        (w) => w is AxIcon && w.asset == AxIcons.boltFill,
      ),
    );
    expect(await _pixel(tester, bolt.center), AxColors.urgentTo);
  });

  testWidgets('Biz_Settings toggles flip their switch state', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const SettingsScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    final marketing = find.byType(AxToggle).at(4);
    expect((tester.widget(marketing) as AxToggle).value, isFalse);
    await tester.tap(marketing);
    await tester.pumpAndSettle();
    expect((tester.widget(marketing) as AxToggle).value, isTrue);
  });

  const sizes = [Size(900, 700), Size(1160, 760), Size(1440, 900)];

  for (final size in sizes) {
    testWidgets('no overflow at ${size.width}×${size.height}', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(harness(const SettingsScreen(), size: size));
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
            const SettingsScreen(),
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

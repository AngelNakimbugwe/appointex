import 'dart:ui' show ImageByteFormat;

import 'package:appointex/design/tokens/ax_colors.dart';
import 'package:appointex/design/widgets/ax_avatar.dart';
import 'package:appointex/design/widgets/ax_primary_button.dart';
import 'package:appointex/design/widgets/ax_sidebar.dart';
import 'package:appointex/features/business/featured_spots/data/fixtures.dart';
import 'package:appointex/features/business/featured_spots/presentation/featured_spots_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/golden_harness.dart';

Future<Color> _pixel(WidgetTester tester, Offset point) async {
  final element = tester.element(find.byType(FeaturedSpotsScreen));
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
  testWidgets('Biz_FeaturedSpots matches artboard golden', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const FeaturedSpotsScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(FeaturedSpotsScreen),
      matchesGoldenFile('../goldens/biz_featured_spots.png'),
    );
  });

  testWidgets('Biz_FeaturedSpots copy inventory is verbatim', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const FeaturedSpotsScreen(), size: const Size(1160, 760)),
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
      kPageSubtitle,
      kCurrentTitle,
      kSpotsTakenPill,
      for (final spot in kFeaturedSpots) ...[
        spot.rank,
        spot.name,
        spot.daysLeft,
      ],
      kBannerTitle,
      kBannerBody,
      kAdvertiseTitle,
      kPlacementEyebrow.toUpperCase(),
      kWeekLabel.toUpperCase(),
      kWeekPrice,
      kChoose,
      kMonthLabel.toUpperCase(),
      kMonthPrice,
      kBannerAdEyebrow.toUpperCase(),
      kCarouselTitle,
      kCarouselPrice,
      kCarouselDescription,
      kGetASlot,
      kPaidDisclosure,
      ...sidebar,
    ];
    for (final text in copy) {
      expect(find.text(text), findsWidgets, reason: text);
    }
  });

  testWidgets('Biz_FeaturedSpots geometry matches the artboard', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const FeaturedSpotsScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(tester.getRect(find.byType(AxSidebar)).size, const Size(220, 760));

    final buttons = find.byType(AxPrimaryButton);
    expect(buttons, findsNWidgets(3));
    for (var i = 0; i < 3; i++) {
      expect(tester.getRect(buttons.at(i)).height, 32);
    }

    final avatars = find.byType(AxAvatar);
    expect(avatars, findsNWidgets(3));
    for (var i = 0; i < 3; i++) {
      expect(tester.getRect(avatars.at(i)).size, const Size(30, 30));
    }

    final rankColors = [
      AxColors.salmon,
      AxColors.brandMuted,
      AxColors.panelNeutral,
    ];
    for (var i = 0; i < 3; i++) {
      final circle = find.byWidgetPredicate(
        (w) =>
            w is Container &&
            w.decoration is BoxDecoration &&
            (w.decoration as BoxDecoration).shape == BoxShape.circle &&
            (w.decoration as BoxDecoration).color == rankColors[i],
      );
      expect(circle, findsOneWidget);
      expect(tester.getRect(circle).size, const Size(22, 22));
    }

    final yours = tester.widget<Text>(
      find.text(kFeaturedSpots.last.daysLeft),
    );
    expect(yours.style!.color, AxColors.verified);
    expect(yours.style!.fontWeight, FontWeight.w700);

    final others = [
      tester.widget<Text>(find.text(kFeaturedSpots.first.daysLeft)),
      tester.widget<Text>(find.text(kFeaturedSpots[1].daysLeft)),
    ];
    for (final text in others) {
      expect(text.style!.color, AxColors.textFaint);
      expect(text.style!.fontWeight, FontWeight.w400);
    }

    final monthLabel = tester.widget<Text>(
      find.text(kMonthLabel.toUpperCase()),
    );
    expect(monthLabel.style!.color, AxColors.brandMid);
    expect(monthLabel.style!.letterSpacing, closeTo(0.42, 0.01));

    final weekLabel = tester.widget<Text>(find.text(kWeekLabel.toUpperCase()));
    expect(weekLabel.style!.color, AxColors.textFaint);

    final advertise = tester.getRect(find.text(kAdvertiseTitle));
    expect(advertise.left, closeTo(756.2, 1.5));

    final current = tester.getRect(find.text(kCurrentTitle));
    expect(current.left, closeTo(270, 1));
  });

  testWidgets('Biz_FeaturedSpots paints artboard colours', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const FeaturedSpotsScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(await _pixel(tester, const Offset(200, 700)), AxColors.blushPale);

    final pill = tester.getRect(find.text(kSpotsTakenPill));
    expect(
      await _pixel(tester, Offset(pill.left - 4, pill.center.dy)),
      AxColors.pendingBg,
    );

    final banner = tester.getRect(find.text(kBannerTitle));
    expect(
      await _pixel(tester, Offset(banner.left - 8, banner.center.dy)),
      AxColors.brand,
    );

    final weekPrice = tester.getRect(find.text(kWeekPrice));
    expect(
      await _pixel(tester, Offset(weekPrice.left - 6, weekPrice.top - 2)),
      AxColors.canvas,
    );

    final monthPrice = tester.getRect(find.text(kMonthPrice));
    expect(
      await _pixel(tester, Offset(monthPrice.left - 6, monthPrice.top - 2)),
      AxColors.sand,
    );
  });

  const sizes = [Size(900, 700), Size(1160, 760), Size(1440, 900)];

  for (final size in sizes) {
    testWidgets('no overflow at ${size.width}×${size.height}', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(harness(const FeaturedSpotsScreen(), size: size));
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
            const FeaturedSpotsScreen(),
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

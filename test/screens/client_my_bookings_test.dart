import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appointex/design/icons/ax_icon.dart';
import 'package:appointex/design/icons/ax_icons.dart';
import 'package:appointex/design/tokens/ax_colors.dart';
import 'package:appointex/design/widgets/ax_bottom_nav.dart';
import 'package:appointex/features/client/my_bookings/presentation/my_bookings_screen.dart';

import '../helpers/golden_harness.dart';

void main() {
  testWidgets('Client_MyBookings matches artboard', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const MyBookingsScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(MyBookingsScreen),
      matchesGoldenFile('../goldens/client_my_bookings.png'),
    );
  });

  testWidgets('Client_MyBookings copy inventory is verbatim', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const MyBookingsScreen()));
    await precacheIcons(tester);
    const copy = [
      'My bookings',
      'Upcoming',
      'Past',
      'AUG',
      '26',
      'Patricia Glam Studio',
      'Bridal makeup, full glam · 12:00 pm',
      'SEP',
      '12',
      'Event: Wedding team',
      'Hair, makeup & photography · from 9:00 am',
      'PAST',
      'JUL',
      '14',
      'Grace Nabbosa Braids',
      'Box braids · Completed',
      'Rebook',
      'Leave a review',
      'Home',
      'Bookings',
      'Chat',
      'Profile',
    ];
    for (final text in copy) {
      expect(find.text(text), findsOneWidget, reason: text);
    }
    expect(find.text('Confirmed'), findsNWidgets(2));

    final title = tester.widget<Text>(find.text('My bookings'));
    expect(title.style?.fontFamily, 'Manrope');
    expect(title.style?.fontSize, 19);
    expect(title.style?.fontWeight, FontWeight.w800);
    expect(title.style?.color, AxColors.brand);

    final eyebrow = tester.widget<Text>(find.text('PAST'));
    expect(eyebrow.style?.fontSize, 11.5);
    expect(eyebrow.style?.fontWeight, FontWeight.w700);
    expect(eyebrow.style?.color, AxColors.textFaint);
    expect(eyebrow.style?.letterSpacing, closeTo(11.5 * 0.05, 0.01));
  });

  testWidgets('Client_MyBookings geometry probes', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const MyBookingsScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    final title = tester.getRect(find.text('My bookings'));
    expect(title.topLeft, const Offset(18, 20));

    final upcoming = tester.getRect(find.text('Upcoming'));
    expect(upcoming.left, 18);
    final pastTab = tester.getRect(find.text('Past'));
    expect(pastTab.left - upcoming.right, 22);

    final aug = tester.getRect(find.text('AUG'));
    expect(aug.center.dx, 55);
    final day26 = tester.getRect(find.text('26'));
    expect(day26.center.dx, 55);

    final confirmed = tester.getRect(find.text('Confirmed').first);
    expect(confirmed.right, 349);

    final rebook = tester.getRect(find.text('Rebook'));
    expect(rebook.left, 104);
    final review = tester.getRect(find.text('Leave a review'));
    expect(review.top, greaterThanOrEqualTo(rebook.top));

    final nav = tester.getRect(find.byType(AxBottomNav));
    expect(nav, const Rect.fromLTWH(0, 780, 390, 64));

    final bookingsTabIcon = tester.getRect(
      find.byWidgetPredicate(
        (widget) => widget is AxIcon && widget.asset == AxIcons.calendar22,
      ),
    );
    expect(bookingsTabIcon.center.dx, 390 * 3 / 8);
  });

  testWidgets('Client_MyBookings pixel probes', (tester) async {
    final key = GlobalKey();
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(
      RepaintBoundary(key: key, child: harness(const MyBookingsScreen())),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    final aug = tester.getRect(find.text('AUG'));
    final day26 = tester.getRect(find.text('26'));
    final jul = tester.getRect(find.text('JUL'));
    final day14 = tester.getRect(find.text('14'));
    final confirmed = tester.getRect(find.text('Confirmed').first);
    final upcoming = tester.getRect(find.text('Upcoming'));

    final pixels = await _capturePixels(tester, key);

    expect(pixels.at(const Offset(10, 300)), AxColors.surface);
    expect(
      pixels.at(Offset(55, (aug.bottom + day26.top) / 2)),
      AxColors.brand,
    );
    _expectClose(
      pixels.at(Offset(55, (jul.bottom + day14.top) / 2)),
      _overWhite(AxColors.panelNeutral, 0.85),
    );
    expect(
      pixels.at(Offset(confirmed.left - 4, confirmed.center.dy)),
      AxColors.verifiedBg,
    );
    expect(
      pixels.at(Offset(upcoming.left + 5, upcoming.bottom + 11.25)),
      AxColors.salmon,
    );
  });

  for (final size in [const Size(320, 640), const Size(390, 844), const Size(430, 932)]) {
    testWidgets('Client_MyBookings has no overflow at $size', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(harness(const MyBookingsScreen(), size: size));
      await precacheIcons(tester);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets('Client_MyBookings has no overflow at $size with textScaler 1.3', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(
        harness(
          const MyBookingsScreen(),
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

class _Pixels {
  _Pixels(this._data, this.width);

  final ByteData _data;
  final int width;

  Color at(Offset point) {
    final x = point.dx.round();
    final y = point.dy.round();
    final offset = (y * width + x) * 4;
    return Color.fromARGB(
      _data.getUint8(offset + 3),
      _data.getUint8(offset),
      _data.getUint8(offset + 1),
      _data.getUint8(offset + 2),
    );
  }
}

Future<_Pixels> _capturePixels(WidgetTester tester, GlobalKey key) {
  final boundary =
      key.currentContext!.findRenderObject() as RenderRepaintBoundary;
  return tester.runAsync(() async {
    final image = await boundary.toImage(pixelRatio: 1);
    final data = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
    return _Pixels(data!, image.width);
  }).then((pixels) => pixels!);
}

/// The past card renders at `opacity:0.85` over the white page — compare with
/// a tolerance so rounding in the compositor cannot fail the probe.
Color _overWhite(Color color, double opacity) {
  double blend(double channel) => channel * opacity + (1 - opacity);
  return Color.from(
    alpha: 1,
    red: blend(color.r),
    green: blend(color.g),
    blue: blend(color.b),
  );
}

void _expectClose(Color actual, Color expected) {
  int channel(double value) => (value * 255.0).round().clamp(0, 255);
  expect(channel(actual.r), closeTo(channel(expected.r), 3));
  expect(channel(actual.g), closeTo(channel(expected.g), 3));
  expect(channel(actual.b), closeTo(channel(expected.b), 3));
}

import 'dart:ui' show ImageByteFormat;

import 'package:appointex/design/icons/ax_icon.dart';
import 'package:appointex/design/icons/ax_icons.dart';
import 'package:appointex/design/tokens/ax_colors.dart';
import 'package:appointex/design/tokens/ax_gradients.dart';
import 'package:appointex/design/widgets/ax_sidebar.dart';
import 'package:appointex/features/business/calendar/data/fixtures.dart';
import 'package:appointex/features/business/calendar/presentation/calendar_screen.dart';
import 'package:appointex/features/business/calendar/presentation/widgets/week_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/golden_harness.dart';

Future<Color> _pixel(WidgetTester tester, Offset point) async {
  final element = tester.element(find.byType(CalendarScreen));
  final color = await tester.runAsync<Color>(() async {
    final image = await captureImage(element);
    final bytes = await image.toByteData(format: ImageByteFormat.rawRgba);
    final data = bytes!.buffer.asUint8List();
    final i = (point.dy.round() * image.width + point.dx.round()) * 4;
    return Color.fromARGB(data[i + 3], data[i], data[i + 1], data[i + 2]);
  });
  return color!;
}

bool _hasLeftRule(Widget widget) {
  if (widget is! Container) return false;
  final decoration = widget.decoration;
  if (decoration is! BoxDecoration) return false;
  final border = decoration.border;
  return border is Border && border.left.color == AxColors.panelWarm;
}

void main() {
  testWidgets('Biz_Calendar matches artboard golden', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const CalendarScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(CalendarScreen),
      matchesGoldenFile('../goldens/biz_calendar.png'),
    );
  });

  testWidgets('Biz_Calendar copy inventory is verbatim', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const CalendarScreen(), size: const Size(1160, 760)),
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
      kWeekRange,
      kMakeAppointment,
      for (final day in kWeek) ...[
        day.label,
        for (final appointment in day.appointments) ...[
          appointment.time,
          appointment.client,
        ],
      ],
      ...sidebar,
    ];
    for (final text in copy) {
      expect(find.text(text), findsWidgets, reason: text);
    }
  });

  testWidgets('Biz_Calendar geometry matches the artboard', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const CalendarScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(tester.getRect(find.byType(AxSidebar)).size, const Size(220, 760));

    final grid = tester.getRect(find.byType(WeekGrid));
    expect(grid.left, closeTo(252, 1));
    expect(grid.top, closeTo(82, 1));
    expect(grid.size, const Size(876, 652));

    final button = find.byWidgetPredicate(
      (w) => w is Container && w.decoration is ShapeDecoration,
    );
    expect(button, findsOneWidget);
    final buttonRect = tester.getRect(button);
    expect(buttonRect.height, 38);
    expect(buttonRect.top, 26);
    expect(buttonRect.right, 1128);
    final buttonDecoration =
        (tester.widget(button) as Container).decoration as ShapeDecoration;
    expect(buttonDecoration.gradient, AxGradients.avatarPeach);
    expect(buttonDecoration.shape, isA<StadiumBorder>());

    final chevrons = find.byWidgetPredicate(
      (w) =>
          w is AxIcon &&
          (w.asset == AxIcons.chevronLeft || w.asset == AxIcons.chevronRight),
    );
    expect(chevrons, findsNWidgets(2));
    for (var i = 0; i < 2; i++) {
      final icon = tester.widget(chevrons.at(i)) as AxIcon;
      expect(icon.size, 16);
      expect(icon.color, AxColors.brand);
      expect(tester.getRect(chevrons.at(i)).size, const Size(16, 16));
    }

    final centers = [
      for (final day in kWeek) tester.getRect(find.text(day.label)).center.dx,
    ];
    expect(centers.first, closeTo(325.7, 2));
    for (var i = 1; i < centers.length; i++) {
      expect(centers[i] - centers[i - 1], closeTo(121.43, 1.5));
    }

    expect(find.byWidgetPredicate(_hasLeftRule), findsNWidgets(6));

    final title = tester.widget(find.text(kPageTitle).last) as Text;
    expect(title.style!.fontFamily, 'Manrope');
    expect(title.style!.fontSize, 20);
    expect(title.style!.fontWeight, FontWeight.w800);
    expect(title.style!.color, AxColors.brand);

    final range = tester.widget(find.text(kWeekRange)) as Text;
    expect(range.style!.fontFamily, isNull);
    expect(range.style!.fontSize, 13);
    expect(range.style!.fontWeight, FontWeight.w700);
    expect(range.style!.color, AxColors.brand);

    final monLabel = tester.widget(find.text('MON 24')) as Text;
    expect(monLabel.style!.fontSize, 11);
    expect(monLabel.style!.fontWeight, FontWeight.w700);
    expect(monLabel.style!.color, AxColors.textFaint);
    expect(monLabel.textAlign, TextAlign.center);

    final wedLabel = tester.widget(find.text('WED 26')) as Text;
    expect(wedLabel.style!.fontFamily, 'Manrope');
    expect(wedLabel.style!.fontWeight, FontWeight.w800);
    expect(wedLabel.style!.color, AxColors.brand);

    final pill = find.byWidgetPredicate(
      (w) {
        if (w is! Container) return false;
        final decoration = w.decoration;
        if (decoration is! BoxDecoration) return false;
        final radius = decoration.borderRadius;
        return decoration.color == AxColors.surfaceWarm &&
            radius is BorderRadius &&
            radius.bottomLeft == const Radius.circular(6);
      },
    );
    expect(pill, findsOneWidget);

    final pendingClient = tester.widget(find.text('Ruth M. · pending')) as Text;
    expect(pendingClient.style!.fontSize, 10.5);
    expect(pendingClient.style!.color, AxColors.pending);
    expect(pendingClient.style!.fontWeight, FontWeight.w400);

    final weddingTime = tester.widget(find.text('9:00').last) as Text;
    expect(weddingTime.style!.color, AxColors.peach);
    expect(weddingTime.style!.fontWeight, FontWeight.w700);
    expect(weddingTime.style!.fontSize, 10.5);
  });

  testWidgets('Biz_Calendar paints artboard colours', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const CalendarScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(await _pixel(tester, const Offset(1150, 12)), AxColors.canvas);
    expect(await _pixel(tester, const Offset(200, 700)), AxColors.blushPale);
    expect(await _pixel(tester, const Offset(933, 400)), AxColors.surface);

    final confirmed = tester.getRect(find.text('Aisha K.').first);
    expect(
      await _pixel(tester, Offset(confirmed.left - 4, confirmed.center.dy)),
      AxColors.verifiedBg,
    );

    final pending = tester.getRect(find.text('Ruth M. · pending'));
    expect(
      await _pixel(tester, Offset(pending.left - 4, pending.center.dy)),
      AxColors.pendingBg,
    );

    final wedding = tester.getRect(find.text('Wedding: Namono'));
    expect(
      await _pixel(tester, Offset(wedding.left - 4, wedding.center.dy)),
      AxColors.brand,
    );

    final wed = tester.getRect(find.text('WED 26'));
    expect(
      await _pixel(tester, Offset(wed.center.dx, wed.top - 1)),
      AxColors.surfaceWarm,
    );

    final mon = tester.getRect(find.text('MON 24'));
    expect(
      await _pixel(tester, Offset(mon.center.dx, mon.top - 1)),
      AxColors.surface,
    );
  });

  const sizes = [Size(900, 700), Size(1160, 760), Size(1440, 900)];

  for (final size in sizes) {
    testWidgets('no overflow at ${size.width}×${size.height}', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(harness(const CalendarScreen(), size: size));
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
            const CalendarScreen(),
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

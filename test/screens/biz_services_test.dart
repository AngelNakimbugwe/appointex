import 'dart:ui' show ImageByteFormat;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appointex/design/tokens/ax_colors.dart';
import 'package:appointex/design/tokens/ax_gradients.dart';
import 'package:appointex/design/widgets/ax_sidebar.dart';
import 'package:appointex/design/widgets/ax_toggle.dart';
import 'package:appointex/features/business/services/data/fixtures.dart';
import 'package:appointex/features/business/services/presentation/services_screen.dart';
import 'package:appointex/features/business/services/presentation/widgets/services_table.dart';

import '../helpers/golden_harness.dart';

Future<Color> _pixel(WidgetTester tester, Offset point) async {
  final element = tester.element(find.byType(ServicesScreen));
  final color = await tester.runAsync<Color>(() async {
    final image = await captureImage(element);
    final bytes = await image.toByteData(format: ImageByteFormat.rawRgba);
    final data = bytes!.buffer.asUint8List();
    final i = (point.dy.round() * image.width + point.dx.round()) * 4;
    return Color.fromARGB(data[i + 3], data[i], data[i + 1], data[i + 2]);
  });
  return color!;
}

bool _hasBottomRule(Widget widget, Color color) {
  if (widget is! Container) return false;
  final decoration = widget.decoration;
  if (decoration is! BoxDecoration) return false;
  final border = decoration.border;
  return border is Border && border.bottom.color == color;
}

bool _isAddServiceChip(Widget widget) {
  if (widget is! Container) return false;
  final decoration = widget.decoration;
  return decoration is ShapeDecoration && decoration.shape is StadiumBorder;
}

void _expectCloseColor(Color actual, Color expected) {
  expect(
    (actual.r - expected.r).abs() <= 3 &&
        (actual.g - expected.g).abs() <= 3 &&
        (actual.b - expected.b).abs() <= 3,
    isTrue,
    reason: 'expected $expected, got $actual',
  );
}

void main() {
  testWidgets('Biz_Services matches artboard golden', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const ServicesScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(ServicesScreen),
      matchesGoldenFile('../goldens/biz_services.png'),
    );
  });

  testWidgets('Biz_Services copy inventory is verbatim', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const ServicesScreen(), size: const Size(1160, 760)),
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
      kAddServiceLabel,
      for (final column in kColumns) column.toUpperCase(),
      for (final service in kServices) ...[
        service.name,
        service.category,
        service.duration,
        service.price,
      ],
      ...sidebar,
    ];
    for (final text in copy) {
      expect(find.text(text), findsWidgets, reason: text);
    }
  });

  testWidgets('Biz_Services geometry matches the artboard', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const ServicesScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(tester.getRect(find.byType(AxSidebar)).size, const Size(220, 760));

    final title = tester.widget(find.text(kPageTitle).last) as Text;
    expect(title.style!.fontFamily, 'Manrope');
    expect(title.style!.fontSize, 20);
    expect(title.style!.fontWeight, FontWeight.w800);
    expect(title.style!.color, AxColors.brand);

    final chipText = tester.widget(find.text(kAddServiceLabel)) as Text;
    expect(chipText.style!.fontSize, 12.5);
    expect(chipText.style!.fontWeight, FontWeight.w700);
    expect(chipText.style!.color, AxColors.brand);
    expect(chipText.style!.fontFamily, isNull);

    final chipFinder = find.byWidgetPredicate(_isAddServiceChip);
    expect(chipFinder, findsOneWidget);
    final chip = tester.getRect(chipFinder);
    expect(chip.height, 38);
    expect(chip.top, 26);
    expect(chip.right, 1128);
    expect(
      (tester.widget(chipFinder) as Container).decoration,
      isA<ShapeDecoration>()
          .having((d) => d.gradient, 'gradient', AxGradients.avatarPeach),
    );

    final serviceHeader = tester.widget(find.text('SERVICE')) as Text;
    expect(serviceHeader.style!.fontSize, 11);
    expect(serviceHeader.style!.fontWeight, FontWeight.w700);
    expect(serviceHeader.style!.color, AxColors.textFaint);
    expect(serviceHeader.style!.letterSpacing, closeTo(0.33, 0.01));
    expect(tester.getRect(find.text('SERVICE')).left, closeTo(281, 1));

    expect(tester.getRect(find.byType(ServicesTable)).top, closeTo(87, 1));

    final name = tester.widget(find.text(kServices.first.name)) as Text;
    expect(name.style!.fontSize, 13);
    expect(name.style!.fontWeight, FontWeight.w700);
    expect(name.style!.color, AxColors.brand);
    expect(name.style!.fontFamily, isNull);

    final category = tester.widget(find.text(kServices.first.category).first)
        as Text;
    expect(category.style!.fontSize, 12.5);
    expect(category.style!.color, AxColors.textBody);
    expect(category.style!.fontFamily, isNull);

    final price = tester.widget(find.text(kServices.first.price)) as Text;
    expect(price.style!.fontSize, 12.5);
    expect(price.style!.fontWeight, FontWeight.w700);
    expect(price.style!.color, AxColors.brand);

    final toggles = find.byType(AxToggle);
    expect(toggles, findsNWidgets(5));
    for (var i = 0; i < kServices.length; i++) {
      final toggle = tester.widget(toggles.at(i)) as AxToggle;
      expect(toggle.value, kServices[i].active, reason: kServices[i].name);
      expect(tester.getRect(toggles.at(i)).size, const Size(36, 20));
    }
    expect(tester.getRect(toggles.at(0)).left, closeTo(986, 1.5));

    expect(
      find.byWidgetPredicate((w) => _hasBottomRule(w, AxColors.panelWarm)),
      findsNWidgets(4),
    );
    expect(
      find.byWidgetPredicate((w) => _hasBottomRule(w, AxColors.borderSoft)),
      findsNWidgets(1),
    );
  });

  testWidgets('Biz_Services Active column toggles flip state', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const ServicesScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    final toggles = find.byType(AxToggle);
    expect((tester.widget(toggles.at(3)) as AxToggle).value, isFalse);
    await tester.tap(toggles.at(3));
    await tester.pumpAndSettle();
    expect((tester.widget(toggles.at(3)) as AxToggle).value, isTrue);
    expect((tester.widget(toggles.at(0)) as AxToggle).value, isTrue);

    await tester.tap(toggles.at(0));
    await tester.pumpAndSettle();
    expect((tester.widget(toggles.at(0)) as AxToggle).value, isFalse);
  });

  testWidgets('Biz_Services paints artboard colours', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const ServicesScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(await _pixel(tester, const Offset(1150, 12)), AxColors.canvas);
    expect(await _pixel(tester, const Offset(200, 700)), AxColors.blushPale);
    expect(await _pixel(tester, const Offset(1000, 500)), AxColors.surface);

    final chip = tester.getRect(find.byWidgetPredicate(_isAddServiceChip));
    _expectCloseColor(
      await _pixel(tester, Offset(chip.left + 8, chip.center.dy)),
      AxColors.peach,
    );
    _expectCloseColor(
      await _pixel(tester, Offset(chip.right - 8, chip.center.dy)),
      AxColors.salmon,
    );
  });

  const sizes = [Size(900, 700), Size(1160, 760), Size(1440, 900)];

  for (final size in sizes) {
    testWidgets('no overflow at ${size.width}×${size.height}', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(harness(const ServicesScreen(), size: size));
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
            const ServicesScreen(),
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

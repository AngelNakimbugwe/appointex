import 'dart:ui' show ImageByteFormat;

import 'package:appointex/design/tokens/ax_colors.dart';
import 'package:appointex/design/widgets/ax_avatar.dart';
import 'package:appointex/design/widgets/ax_bottom_nav.dart';
import 'package:appointex/design/widgets/ax_chip.dart';
import 'package:appointex/design/widgets/ax_primary_button.dart';
import 'package:appointex/features/client/event_bundle/presentation/event_bundle_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/golden_harness.dart';

Future<Color> _pixel(WidgetTester tester, Offset point) async {
  final element = tester.element(find.byType(EventBundleScreen));
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
  testWidgets('Client_EventBundle matches artboard at 390x844', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const EventBundleScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(EventBundleScreen),
      matchesGoldenFile('../goldens/client_event_bundle.png'),
    );
  });

  testWidgets('Client_EventBundle carries every copy string verbatim', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const EventBundleScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    const copy = [
      'Plan an event',
      'One booking, the whole team, one checkout.',
      'Wedding',
      'Kwanjula',
      'Graduation',
      'Photoshoot',
      'Saturday, 12 September',
      'Change',
      'Your event team',
      'Hair · Grace Nabbosa',
      '9:00 am · UGX 120,000',
      'Makeup · Patricia Glam Studio',
      '10:30 am · UGX 180,000',
      'Photography · Kato Visuals',
      '1:00 pm · UGX 350,000',
      'Add another service',
      '3 providers',
      'UGX 650,000',
      'Review & pay',
    ];
    for (final string in copy) {
      expect(find.text(string), findsOneWidget, reason: string);
    }
  });

  testWidgets('Client_EventBundle geometry matches the artboard', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const EventBundleScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(find.byType(AxBottomNav), findsNothing);
    expect(find.byType(AxChip), findsNWidgets(4));
    expect(find.byType(AxAvatar), findsNWidgets(3));

    final button = tester.getRect(find.byType(AxPrimaryButton));
    expect(button.height, 50);
    expect(button.bottom, 844 - 22);

    final avatar = tester.getRect(find.byType(AxAvatar).first);
    expect(avatar.size, const Size(38, 38));
  });

  testWidgets('Client_EventBundle paints artboard colours', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const EventBundleScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(await _pixel(tester, const Offset(10, 400)), AxColors.surface);

    final chip = tester.getRect(find.text('Wedding'));
    expect(
      await _pixel(tester, Offset(chip.left - 6, chip.center.dy)),
      AxColors.brand,
    );

    final date = tester.getRect(find.text('Saturday, 12 September'));
    expect(
      await _pixel(tester, Offset(date.left - 34, date.center.dy)),
      AxColors.surfaceWarm,
    );
  });

  for (final size in [
    const Size(320, 640),
    const Size(390, 844),
    const Size(430, 932),
  ]) {
    testWidgets('Client_EventBundle has no overflow at $size', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(harness(const EventBundleScreen(), size: size));
      await precacheIcons(tester);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets(
      'Client_EventBundle has no overflow at $size with textScaler 1.3',
      (tester) async {
        await tester.binding.setSurfaceSize(size);
        await tester.pumpWidget(
          harness(
            const EventBundleScreen(),
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

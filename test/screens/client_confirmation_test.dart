import 'dart:ui' show ImageByteFormat;

import 'package:appointex/design/tokens/ax_colors.dart';
import 'package:appointex/design/widgets/ax_bottom_nav.dart';
import 'package:appointex/design/widgets/ax_primary_button.dart';
import 'package:appointex/features/client/confirmation/presentation/confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/golden_harness.dart';

Future<Color> _pixel(WidgetTester tester, Offset point) async {
  final element = tester.element(find.byType(ConfirmationScreen));
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
  testWidgets('Client_Confirmation matches artboard at 390x844', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const ConfirmationScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(ConfirmationScreen),
      matchesGoldenFile('../goldens/client_confirmation.png'),
    );
  });

  testWidgets('Client_Confirmation carries every copy string verbatim', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const ConfirmationScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    const copy = [
      'Booking confirmed',
      "We've sent a WhatsApp confirmation to your number.",
      'Provider',
      'Patricia Glam Studio',
      'Service',
      'Bridal makeup, full glam',
      'When',
      'Wed 26 Aug, 12:00 pm',
      'Amount held',
      'UGX 206,000',
      "Free cancellation up to 24 hours before. If your provider cancels "
          "or doesn't show, you're refunded automatically.",
      'View booking',
      'Add to calendar',
    ];
    for (final string in copy) {
      expect(find.text(string), findsOneWidget, reason: string);
    }
  });

  testWidgets('Client_Confirmation geometry matches the artboard', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const ConfirmationScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(find.byType(AxBottomNav), findsNothing);

    final buttons = tester
        .widgetList<AxPrimaryButton>(find.byType(AxPrimaryButton))
        .toList();
    expect(buttons.length, 2);
    for (final i in [0, 1]) {
      expect(tester.getRect(find.byType(AxPrimaryButton).at(i)).height, 48);
    }

    final primary = tester.getRect(find.byType(AxPrimaryButton).first);
    expect(primary.width, 390 - 64);

    final title = tester.getRect(find.text('Booking confirmed'));
    expect(title.center.dx, 390 / 2);
    expect(title.top - 18 - 120, greaterThan(0));
  });

  testWidgets('Client_Confirmation paints artboard colours', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const ConfirmationScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(await _pixel(tester, const Offset(10, 300)), AxColors.surface);

    final title = tester.getRect(find.text('Booking confirmed'));
    final heroLeft = (390 - 120) / 2;
    final heroTop = title.top - 18 - 120;
    expect(
      await _pixel(tester, Offset(heroLeft + 14 + 5, heroTop + 6 + 5)),
      AxColors.roseGlow,
    );
    expect(
      await _pixel(tester, Offset(heroLeft + 120 - 8 - 4, heroTop + 20 + 4)),
      AxColors.peach,
    );

    final provider = tester.getRect(find.text('Provider'));
    expect(
      await _pixel(tester, Offset(provider.left - 6, provider.center.dy)),
      AxColors.surfaceWarm,
    );
  });

  for (final size in [
    const Size(320, 640),
    const Size(390, 844),
    const Size(430, 932),
  ]) {
    testWidgets('Client_Confirmation has no overflow at $size', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(harness(const ConfirmationScreen(), size: size));
      await precacheIcons(tester);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets(
      'Client_Confirmation has no overflow at $size with textScaler 1.3',
      (tester) async {
        await tester.binding.setSurfaceSize(size);
        await tester.pumpWidget(
          harness(
            const ConfirmationScreen(),
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

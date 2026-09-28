import 'dart:ui' show ImageByteFormat;

import 'package:appointex/design/tokens/ax_colors.dart';
import 'package:appointex/design/widgets/ax_bottom_nav.dart';
import 'package:appointex/design/widgets/ax_primary_button.dart';
import 'package:appointex/features/client/checkout/presentation/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/golden_harness.dart';

Future<Color> _pixel(WidgetTester tester, Offset point) async {
  final element = tester.element(find.byType(CheckoutScreen));
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
  testWidgets('Client_Checkout matches artboard at 390x844', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const CheckoutScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(CheckoutScreen),
      matchesGoldenFile('../goldens/client_checkout.png'),
    );
  });

  testWidgets('Client_Checkout carries every copy string verbatim', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const CheckoutScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    const copy = [
      'Checkout',
      'At my location',
      'Naguru, Kampala · details sent to provider after booking',
      'Change',
      'Bridal makeup, full glam',
      'UGX 180,000',
      'Lashes add-on',
      'UGX 20,000',
      'Subtotal',
      'UGX 200,000',
      'Service fee (3%)',
      'UGX 6,000',
      'Urgent booking fee (25%)',
      'UGX 50,000',
      'Mobile service fee (5%)',
      'UGX 10,000',
      'Pay with',
      'MTN',
      'MTN Mobile Money',
      'Airtel',
      'Airtel Money',
      'Mobile money number',
      '+256 772 ••• 145',
      'Held securely by Appointex until the appointment is marked complete. '
          'We never ask for or store your mobile money PIN.',
      'Buyer protection and verified reviews apply only to bookings paid in '
          'the app.',
      'Confirm payment',
    ];
    for (final string in copy) {
      expect(find.text(string), findsOneWidget, reason: string);
    }
    expect(find.text('Total'), findsNWidgets(2));
    expect(find.text('UGX 266,000'), findsNWidgets(2));
  });

  testWidgets('Client_Checkout geometry matches the artboard', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const CheckoutScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(find.byType(AxBottomNav), findsNothing);

    final button = tester.getRect(find.byType(AxPrimaryButton));
    expect(button.height, 50);
    expect(button.bottom, 844 - 22);

    final mtnTile = find.byWidgetPredicate(
      (w) =>
          w is Container &&
          w.decoration is BoxDecoration &&
          (w.decoration as BoxDecoration).color == AxColors.mtn,
    );
    expect(mtnTile, findsOneWidget);
    expect(tester.getRect(mtnTile).size, const Size(34, 24));

    final airtelTile = find.byWidgetPredicate(
      (w) =>
          w is Container &&
          w.decoration is BoxDecoration &&
          (w.decoration as BoxDecoration).color == AxColors.airtel,
    );
    expect(airtelTile, findsOneWidget);
    expect(tester.getRect(airtelTile).size, const Size(34, 24));
  });

  testWidgets('Client_Checkout paints artboard colours', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const CheckoutScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(await _pixel(tester, const Offset(10, 300)), AxColors.surface);

    final location = tester.getRect(find.text('At my location'));
    expect(
      await _pixel(tester, Offset(location.left - 32, location.center.dy)),
      AxColors.escrowBg,
    );

    final mtnTile = Rect.fromCenter(
      center: tester.getRect(find.text('MTN')).center,
      width: 34,
      height: 24,
    );
    expect(
      await _pixel(tester, Offset(mtnTile.left + 4, mtnTile.top + 4)),
      AxColors.mtn,
    );
  });

  for (final size in [
    const Size(320, 640),
    const Size(390, 844),
    const Size(430, 932),
  ]) {
    testWidgets('Client_Checkout has no overflow at $size', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(harness(const CheckoutScreen(), size: size));
      await precacheIcons(tester);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets(
      'Client_Checkout has no overflow at $size with textScaler 1.3',
      (tester) async {
        await tester.binding.setSurfaceSize(size);
        await tester.pumpWidget(
          harness(
            const CheckoutScreen(),
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

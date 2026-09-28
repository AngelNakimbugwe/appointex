import 'dart:convert';
import 'dart:io';

import 'package:appointex/core/auth/auth_repository.dart';
import 'package:appointex/core/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appointex/features/client/register/data/fixtures.dart';
import 'package:appointex/features/client/register/presentation/register_screen.dart';

import '../fakes/fake_auth_repository.dart';
import '../fakes/fake_user_repository.dart';
import '../helpers/golden_harness.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // pubspec.yaml declares only `assets/icons/`, which excludes the ui/duo/art
  // subdirectories from the asset bundle. Serve the icons from disk through
  // the asset channel until pubspec.yaml lists the subdirectories.
  TestWidgetsFlutterBinding.instance.defaultBinaryMessenger
      .setMockMessageHandler('flutter/assets', (ByteData? message) async {
    final key = utf8.decode(
      message!.buffer.asUint8List(
        message.offsetInBytes,
        message.lengthInBytes,
      ),
    );
    final data = File(key).readAsBytesSync();
    return ByteData.sublistView(data);
  });

  dynamic fakeOverrides() => [
        authRepositoryProvider.overrideWithValue(FakeAuthRepository()),
        userRepositoryProvider.overrideWithValue(FakeUserRepository()),
      ];

  testWidgets('Client_Register matches artboard golden', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(
      harness(const RegisterScreen(), overrides: fakeOverrides()),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(RegisterScreen),
      matchesGoldenFile('../goldens/client_register.png'),
    );
  });

  testWidgets('Client_Register copy inventory is verbatim', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(
      harness(const RegisterScreen(), overrides: fakeOverrides()),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    expect(find.text(kRegisterTitle), findsOneWidget);
    expect(find.text(kRegisterSubtitle), findsOneWidget);
    expect(find.text(kRegisterStepOneNumber), findsOneWidget);
    expect(find.text(kRegisterStepOne), findsOneWidget);
    expect(find.text(kRegisterStepTwoNumber), findsOneWidget);
    expect(find.text(kRegisterStepTwo), findsOneWidget);
    expect(find.text(kRegisterFullNameLabel), findsOneWidget);
    expect(find.text(kRegisterPhoneLabel), findsOneWidget);
    expect(find.text(kRegisterLegal), findsOneWidget);
    expect(find.text(kRegisterCta), findsOneWidget);
    expect(find.text(kRegisterGoogleCta), findsOneWidget);

    final hints = tester
        .widgetList<TextField>(find.byType(TextField))
        .map((field) => field.decoration?.hintText)
        .toList();
    expect(
      hints,
      containsAll(<String?>[kRegisterFullNameHint, kRegisterPhoneHint]),
    );
  });

  testWidgets('CTA stays fully on screen above the keyboard', (tester) async {
    const keyboardInset = 301.0;
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(
      ProviderScope(
        overrides: fakeOverrides(),
        child: const MediaQuery(
          data: MediaQueryData(
            size: Size(390, 844),
            devicePixelRatio: 1.0,
            padding: EdgeInsets.zero,
            viewInsets: EdgeInsets.only(bottom: keyboardInset),
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: RegisterScreen(),
          ),
        ),
      ),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    final rect = tester.getRect(find.text(kRegisterCta));
    expect(rect.bottom, lessThan(844 - keyboardInset));
    expect(rect.left, greaterThanOrEqualTo(0));
    expect(rect.right, lessThanOrEqualTo(390));
  });

  testWidgets('entering a phone number and continuing sends an OTP',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(
      harness(const RegisterScreen(), overrides: fakeOverrides()),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byType(TextField).last,
      '+256700000000',
    );
    await tester.tap(find.text(kRegisterCta));
    await tester.pumpAndSettle();

    expect(find.text(kRegisterOtpTitle), findsOneWidget);
    expect(find.text(kRegisterOtpCta), findsOneWidget);
  });

  const sizes = [Size(320, 640), Size(390, 844), Size(430, 932)];

  for (final size in sizes) {
    testWidgets('no overflow at ${size.width}×${size.height}', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(
        harness(
          const RegisterScreen(),
          size: size,
          overrides: fakeOverrides(),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets(
      'no overflow at ${size.width}×${size.height} at 1.3× text scale',
      (tester) async {
        await tester.binding.setSurfaceSize(size);
        await tester.pumpWidget(
          harness(
            const RegisterScreen(),
            size: size,
            textScaler: TextScaler.linear(1.3),
            overrides: fakeOverrides(),
          ),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      },
    );
  }
}

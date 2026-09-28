import 'dart:convert';
import 'dart:io';

import 'package:appointex/core/auth/auth_repository.dart';
import 'package:appointex/core/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appointex/features/client/onboarding/data/fixtures.dart';
import 'package:appointex/features/client/onboarding/presentation/onboarding_screen.dart';

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

  testWidgets('Client_Onboarding matches artboard golden', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const OnboardingScreen(), overrides: fakeOverrides()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(OnboardingScreen),
      matchesGoldenFile('../goldens/client_onboarding.png'),
    );
  });

  testWidgets('Client_Onboarding copy inventory is verbatim', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const OnboardingScreen(), overrides: fakeOverrides()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    expect(find.text(kOnboardingTitle), findsOneWidget);
    expect(find.text(kOnboardingTagline), findsOneWidget);
    expect(find.text(kOnboardingImClient), findsOneWidget);
    expect(find.text(kOnboardingImBusiness), findsOneWidget);
    expect(find.text(kOnboardingGoogleCta), findsOneWidget);
    expect(find.text('$kOnboardingOr $kOnboardingGuest'), findsOneWidget);
    expect(
      find.text('$kOnboardingLoginPrompt $kOnboardingLoginLink'),
      findsOneWidget,
    );
  });

  testWidgets(
    'Google sign-in from onboarding creates a client profile',
    (tester) async {
      final auth = FakeAuthRepository();
      final users = FakeUserRepository();
      await tester.binding.setSurfaceSize(const Size(390, 844));
      await tester.pumpWidget(
        harness(
          const OnboardingScreen(),
          overrides: [
            authRepositoryProvider.overrideWithValue(auth),
            userRepositoryProvider.overrideWithValue(users),
          ],
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text(kOnboardingGoogleCta));
      await tester.pumpAndSettle();

      expect(users.createdUids, contains('test-uid'));
    },
  );

  const sizes = [Size(320, 640), Size(390, 844), Size(430, 932)];

  for (final size in sizes) {
    testWidgets('no overflow at ${size.width}×${size.height}', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(
        harness(const OnboardingScreen(), size: size, overrides: fakeOverrides()),
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
            const OnboardingScreen(),
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

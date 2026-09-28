import 'package:appointex/core/auth/auth_repository.dart';
import 'package:appointex/core/user/user_repository.dart';
import 'package:appointex/features/business/onboarding/data/provider_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appointex/features/business/onboarding/data/fixtures.dart';
import 'package:appointex/features/business/onboarding/presentation/onboarding_screen.dart';

import '../fakes/fake_auth_repository.dart';
import '../fakes/fake_provider_repository.dart';
import '../fakes/fake_user_repository.dart';
import '../helpers/golden_harness.dart';

void main() {
  dynamic fakeOverrides() => [
        authRepositoryProvider.overrideWithValue(FakeAuthRepository()),
        userRepositoryProvider.overrideWithValue(FakeUserRepository()),
        providerRepositoryProvider.overrideWithValue(FakeProviderRepository()),
      ];

  testWidgets('Biz_Onboarding matches artboard golden', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(
        const OnboardingScreen(),
        size: const Size(1160, 760),
        overrides: fakeOverrides(),
      ),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(OnboardingScreen),
      matchesGoldenFile('../goldens/biz_onboarding.png'),
    );
  });

  testWidgets('Biz_Onboarding copy inventory is verbatim', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(
        const OnboardingScreen(),
        size: const Size(1160, 760),
        overrides: fakeOverrides(),
      ),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    final copy = [
      kBrandLine,
      kHeading,
      kSubheading,
      '1',
      kStepLabels[0],
      '2',
      kStepLabels[1],
      '3',
      kStepLabels[2],
      kNameFieldLabel,
      kNameFieldHint,
      kCategoryFieldLabel,
      kCategoryOptions.first,
      kCategoryFieldHelper,
      kPhoneFieldLabel,
      kPhoneFieldHint,
      kVerificationFieldLabel,
      kVerificationFieldHint,
      kContinueLabel,
      kGoogleCta,
    ];
    for (final text in copy) {
      expect(find.text(text), findsOneWidget, reason: text);
    }
  });

  testWidgets(
      'filling details and verifying phone advances through all three steps',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(
        const OnboardingScreen(),
        size: const Size(1160, 760),
        overrides: fakeOverrides(),
      ),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'Patricia Glam Studio');
    await tester.enterText(fields.at(1), '+256700000000');
    await tester.tap(find.text(kContinueLabel));
    await tester.pumpAndSettle();

    expect(
      tester.widget<Text>(find.text(kStepLabels[1])).style?.fontWeight,
      FontWeight.w700,
    );
    expect(find.text(kOtpTitle), findsOneWidget);

    await tester.enterText(find.byType(TextField).last, '123456');
    await tester.tap(find.text(kContinueLabel));
    await tester.pumpAndSettle();

    expect(
      tester.widget<Text>(find.text(kStepLabels[2])).style?.fontWeight,
      FontWeight.w700,
    );
    expect(find.text(kFirstServiceHeading), findsOneWidget);
  });

  const sizes = [Size(900, 700), Size(1160, 760), Size(1440, 900)];

  for (final size in sizes) {
    testWidgets('no overflow at ${size.width}×${size.height}', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(
        harness(const OnboardingScreen(), size: size, overrides: fakeOverrides()),
      );
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
            const OnboardingScreen(),
            size: size,
            textScaler: TextScaler.linear(1.3),
            overrides: fakeOverrides(),
          ),
        );
        await precacheIcons(tester);
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      },
    );
  }
}

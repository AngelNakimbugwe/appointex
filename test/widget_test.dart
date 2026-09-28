import 'package:appointex/core/auth/auth_repository.dart';
import 'package:appointex/core/user/user_repository.dart';
import 'package:appointex/features/business/onboarding/data/provider_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appointex/app/app.dart';
import 'package:appointex/features/client/home/data/fixtures.dart' as home_fixtures;
import 'package:appointex/features/client/onboarding/data/fixtures.dart';

import 'fakes/fake_auth_repository.dart';
import 'fakes/fake_provider_repository.dart';
import 'fakes/fake_user_repository.dart';

void main() {
  testWidgets('signed-out app boots to onboarding', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(FakeAuthRepository()),
          userRepositoryProvider.overrideWithValue(FakeUserRepository()),
          providerRepositoryProvider
              .overrideWithValue(FakeProviderRepository()),
        ],
        child: const AxApp(),
      ),
    );
    // The splash screen holds for ~2.2s before handing off to onboarding —
    // pumpAndSettle alone won't wait out a bare Timer with nothing animating.
    await tester.pump(const Duration(milliseconds: 2300));
    await tester.pumpAndSettle();

    expect(find.text('Appointex'), findsWidgets);
    expect(find.text(kOnboardingImClient), findsOneWidget);
  });

  testWidgets('a signed-in client skips onboarding and lands on home',
      (tester) async {
    final userRepository = FakeUserRepository();
    const uid = 'client-uid';
    await userRepository.createIfMissing(
      uid: uid,
      role: AppUserRole.client,
      displayName: 'Aisha',
    );
    final authRepository = FakeAuthRepository(
      initialUser: const AuthUser(uid: uid),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(authRepository),
          userRepositoryProvider.overrideWithValue(userRepository),
          providerRepositoryProvider
              .overrideWithValue(FakeProviderRepository()),
        ],
        child: const AxApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(kOnboardingImClient), findsNothing);
  });

  testWidgets('a signed-out guest can browse the client app', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(FakeAuthRepository()),
          userRepositoryProvider.overrideWithValue(FakeUserRepository()),
          providerRepositoryProvider
              .overrideWithValue(FakeProviderRepository()),
        ],
        child: const AxApp(),
      ),
    );
    // Splash holds ~2.2s before handing off to onboarding.
    await tester.pump(const Duration(milliseconds: 2300));
    await tester.pumpAndSettle();

    // Tap the onboarding guest link — the router must let a signed-out user
    // browse client routes instead of bouncing back to onboarding. The link
    // sits in a scrollable actions column, so bring it into view first.
    await tester.ensureVisible(
      find.text('$kOnboardingOr $kOnboardingGuest'),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('$kOnboardingOr $kOnboardingGuest'));
    await tester.pumpAndSettle();

    expect(find.text(home_fixtures.kHomeTitle), findsOneWidget);
    expect(find.text(kOnboardingImClient), findsNothing);
  });
}

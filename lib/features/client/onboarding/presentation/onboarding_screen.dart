import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes.dart';
import '../../../../core/auth/auth_controller.dart';
import '../../../../core/auth/auth_repository.dart';
import '../../../../core/user/user_repository.dart';
import '../../../../design/icons/ax_icon.dart';
import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_gradients.dart';
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_primary_button.dart';
import '../data/fixtures.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  bool _handledSignIn = false;

  // artboard line 24: hero content column `padding:0 40px`
  static const double _heroContentHPad = 40;

  // artboard line 32: actions section `padding:28px 28px 40px`
  static const double _actionsBottomPad = 40;

  static const double _taglineSize = 14;
  static const Color _taglineColor = Color.fromARGB(255, 122, 79, 72);
  static const Color _blobRose = Color.fromARGB(255, 217, 139, 150);

  // A Google sign-in started here must not strand a brand-new user on the
  // auth screen: the router only redirects once a Firestore profile exists,
  // so create it (a no-op for returning users) and let the router's own
  // redirect own the destination.
  Future<void> _handleSignedIn(AuthUser firebaseUser) async {
    if (_handledSignIn) return;
    _handledSignIn = true;
    final displayName =
        (firebaseUser.displayName?.trim().isNotEmpty ?? false)
            ? firebaseUser.displayName!.trim()
            : 'New client';
    await ref.read(userRepositoryProvider).createIfMissing(
          uid: firebaseUser.uid,
          role: AppUserRole.client,
          displayName: displayName,
          phoneNumber: firebaseUser.phoneNumber,
          email: firebaseUser.email,
          photoUrl: firebaseUser.photoUrl,
        );
    if (mounted) ref.invalidate(currentAppUserProvider);
  }

  Future<void> _onGooglePressed() async {
    await ref.read(authControllerProvider.notifier).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<AuthUser?>>(authStateChangesProvider, (previous, next) {
      final user = next.value;
      if (user != null) {
        _handleSignedIn(user);
      }
    });
    final busy =
        ref.watch(authControllerProvider).status ==
        AuthFlowStatus.signingInWithGoogle;

    return Scaffold(
      backgroundColor: AxColors.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 62,
              child: ColoredBox(
                color: AxColors.blushPale,
                child: Stack(
                  children: [
                    Positioned(
                      top: -90,
                      right: -90,
                      child: const _HeroBlob(
                        size: 280,
                        color: AxColors.salmon,
                        opacity: 0.28,
                      ),
                    ),
                    Positioned(
                      left: -100,
                      bottom: -90,
                      child: const _HeroBlob(
                        size: 260,
                        color: _blobRose,
                        opacity: 0.30,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 30,
                      child: const _HeroBlob(
                        size: 170,
                        color: AxColors.peach,
                        opacity: 0.45,
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 60,
                      child: const _HeroBlob(
                        size: 120,
                        color: AxColors.salmon,
                        opacity: 0.22,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: _heroContentHPad,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: AxSpace.s14,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(AxRadius.xl),
                                ),
                                gradient: AxGradients.logo,
                              ),
                              child: const Center(
                                child: AxDuoIcon(AxDuoIcons.logoMark, size: 34),
                              ),
                            ),
                            Text(
                              kOnboardingTitle,
                              style: AxType.head(
                                AxType.h1,
                                weight: FontWeight.w800,
                                color: AxColors.brand,
                                letterSpacingEm: -0.01,
                              ),
                            ),
                            Text(
                              kOnboardingTagline,
                              textAlign: TextAlign.center,
                              style: AxType.text(
                                _taglineSize,
                                color: _taglineColor,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 38,
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        AxSpace.s28,
                        AxSpace.s28,
                        AxSpace.s28,
                        _actionsBottomPad,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: AxSpace.s12,
                        children: [
                          AxPrimaryButton(
                            label: kOnboardingImClient,
                            onPressed: () => context.go(AxRoutes.register),
                          ),
                          AxPrimaryButton(
                            label: kOnboardingImBusiness,
                            style: AxButtonStyle.outline,
                            onPressed: () => context.go(AxRoutes.bizOnboarding),
                          ),
                          AxPrimaryButton(
                            label: kOnboardingGoogleCta,
                            style: AxButtonStyle.outline,
                            onPressed: busy ? null : _onGooglePressed,
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => context.go(AxRoutes.home),
                            child: Padding(
                              padding: const EdgeInsets.only(top: AxSpace.s6),
                              child: Text.rich(
                                TextSpan(
                                  text: '$kOnboardingOr ',
                                  style: AxType.text(
                                    AxType.labelSm,
                                    color: AxColors.textSubtle,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: kOnboardingGuest,
                                      style: AxType.text(
                                        AxType.labelSm,
                                        color: AxColors.brandMid,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => context.go(AxRoutes.login),
                            child: Padding(
                              padding: const EdgeInsets.only(top: AxSpace.s6),
                              child: Text.rich(
                                TextSpan(
                                  text: '$kOnboardingLoginPrompt ',
                                  style: AxType.text(
                                    AxType.labelSm,
                                    color: AxColors.textSubtle,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: kOnboardingLoginLink,
                                      style: AxType.text(
                                        AxType.labelSm,
                                        weight: FontWeight.w700,
                                        color: AxColors.brandMid,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroBlob extends StatelessWidget {
  const _HeroBlob({
    required this.size,
    required this.color,
    required this.opacity,
  });

  final double size;
  final Color color;
  final double opacity;

  static const double _radius = 0.7071067811865476;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            radius: _radius,
            colors: [color, color.withValues(alpha: 0)],
            stops: const [0.0, 0.7],
          ),
        ),
      ),
    );
  }
}

import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
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
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_field.dart';
import '../../../../design/widgets/ax_primary_button.dart';
import '../data/fixtures.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  // artboard lines 31-34: two 22px badges, two 6px inner gaps, two 8px outer gaps
  static const double _stepperFixedWidth = 72;

  // artboard line 32: the 22px badge and 6px gap ahead of each step label
  static const double _stepBadgeAndGap = 28;

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  int _step = 0;
  bool _handledSignIn = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  Future<void> _onCreateAccountPressed() async {
    final phone = _phoneController.text.trim();
    if (phone.isEmpty) return;
    await ref.read(authControllerProvider.notifier).sendOtp(phone);
  }

  Future<void> _onVerifyPressed() async {
    final code = _otpController.text.trim();
    if (code.isEmpty) return;
    await ref.read(authControllerProvider.notifier).verifyOtp(code);
  }

  Future<void> _onGooglePressed() async {
    if (kIsWeb || Platform.isAndroid || Platform.isIOS) {
      await ref.read(authControllerProvider.notifier).signInWithGoogle();
      return;
    }
    // google_sign_in has no Windows/Linux/macOS implementation — the call
    // would hang forever. Surface a clear message instead of a dead button.
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Google sign-in works on Android, iOS and web. '
            'Use phone sign-in here, or run the app on one of those platforms.',
          ),
        ),
      );
    }
  }

  Future<void> _handleSignedIn(AuthUser firebaseUser) async {
    if (_handledSignIn) return;
    _handledSignIn = true;
    final typedName = _nameController.text.trim();
    final displayName = (firebaseUser.displayName?.trim().isNotEmpty ?? false)
        ? firebaseUser.displayName!.trim()
        : (typedName.isNotEmpty ? typedName : 'New client');
    await ref.read(userRepositoryProvider).createIfMissing(
          uid: firebaseUser.uid,
          role: AppUserRole.client,
          displayName: displayName,
          phoneNumber: firebaseUser.phoneNumber,
          email: firebaseUser.email,
          photoUrl: firebaseUser.photoUrl,
        );
    if (mounted) context.go(AxRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<AuthUser?>>(authStateChangesProvider, (previous, next) {
      final user = next.value;
      if (user != null) {
        _handleSignedIn(user);
      }
    });
    final authState = ref.watch(authControllerProvider);

    // Auto-advance to the OTP step once a code has been sent.
    if (authState.status == AuthFlowStatus.codeSent && _step == 0) {
      _step = 1;
    }
    final busy = authState.status == AuthFlowStatus.sendingCode ||
        authState.status == AuthFlowStatus.verifyingCode ||
        authState.status == AuthFlowStatus.signingInWithGoogle;

    return Scaffold(
      backgroundColor: AxColors.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _BackBar(
              onBack: () {
                if (_step == 1) {
                  setState(() => _step = 0);
                  ref.read(authControllerProvider.notifier).reset();
                } else {
                  context.go(AxRoutes.onboarding);
                }
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  AxSpace.s24,
                  AxSpace.s6,
                  AxSpace.s24,
                  0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AxSpace.s22,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: AxSpace.s6,
                      children: [
                        Text(
                          kRegisterTitle,
                          style: AxType.head(
                            AxType.h3,
                            weight: FontWeight.w800,
                            color: AxColors.brand,
                          ),
                        ),
                        Text(
                          kRegisterSubtitle,
                          style: AxType.text(
                            AxType.label,
                            color: AxColors.textMuted,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final maxLabelWidth =
                            (constraints.maxWidth -
                                    RegisterScreen._stepperFixedWidth) /
                                2 -
                            RegisterScreen._stepBadgeAndGap;
                        return Row(
                          spacing: AxSpace.s8,
                          children: [
                            _Step(
                              number: kRegisterStepOneNumber,
                              label: kRegisterStepOne,
                              active: _step == 0,
                              maxLabelWidth: maxLabelWidth,
                            ),
                            const Expanded(
                              child: SizedBox(
                                height: 1,
                                child: ColoredBox(color: AxColors.borderStrong),
                              ),
                            ),
                            _Step(
                              number: kRegisterStepTwoNumber,
                              label: kRegisterStepTwo,
                              active: _step == 1,
                              maxLabelWidth: maxLabelWidth,
                            ),
                          ],
                        );
                      },
                    ),
                    if (_step == 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: AxSpace.s16,
                        children: [
                          AxLabeledField(
                            kRegisterFullNameLabel,
                            hint: kRegisterFullNameHint,
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                          ),
                          AxLabeledField(
                            kRegisterPhoneLabel,
                            hint: kRegisterPhoneHint,
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                          ),
                        ],
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: AxSpace.s6,
                        children: [
                          AxFieldLabel(kRegisterOtpTitle),
                          AxField(
                            hint: kRegisterOtpHint,
                            controller: _otpController,
                            keyboardType: TextInputType.number,
                          ),
                          GestureDetector(
                            onTap: _onCreateAccountPressed,
                            child: Padding(
                              padding: const EdgeInsets.only(top: AxSpace.s6),
                              child: Text.rich(
                                TextSpan(
                                  text: '$kRegisterOtpResendPrompt ',
                                  style: AxType.text(
                                    AxType.labelSm,
                                    color: AxColors.textSubtle,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: kRegisterOtpResendLink,
                                      style: AxType.text(
                                        AxType.labelSm,
                                        color: AxColors.brandMid,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (authState.status == AuthFlowStatus.error)
                      Text(
                        authState.errorMessage ?? 'Something went wrong.',
                        style: AxType.text(AxType.labelSm, color: Colors.red),
                      ),
                    Text(
                      kRegisterLegal,
                      style: AxType.text(
                        AxType.micro,
                        color: AxColors.textFaint,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AxSpace.s24,
                AxSpace.s14,
                AxSpace.s24,
                AxSpace.s26,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: AxSpace.s14,
                children: [
                  _CtaButton(
                    label: _step == 0 ? kRegisterCta : kRegisterOtpCta,
                    onPressed: busy
                        ? null
                        : (_step == 0
                            ? _onCreateAccountPressed
                            : _onVerifyPressed),
                  ),
                  if (_step == 0)
                    AxPrimaryButton(
                      label: kRegisterGoogleCta,
                      style: AxButtonStyle.outline,
                      onPressed: busy ? null : _onGooglePressed,
                    ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => context.go(AxRoutes.login),
                    child: Padding(
                      padding: const EdgeInsets.only(top: AxSpace.s2),
                      child: Text.rich(
                        TextSpan(
                          text: '$kRegisterLoginPrompt ',
                          style: AxType.text(
                            AxType.labelSm,
                            color: AxColors.textSubtle,
                          ),
                          children: [
                            TextSpan(
                              text: kRegisterLoginLink,
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
          ],
        ),
      ),
    );
  }
}

class _BackBar extends StatelessWidget {
  const _BackBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AxSpace.s16),
        child: Row(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onBack,
              child: const AxIcon(
                AxIcons.chevronLeft,
                size: 19,
                color: AxColors.brand,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({
    required this.number,
    required this.label,
    required this.active,
    required this.maxLabelWidth,
  });

  final String number;
  final String label;
  final bool active;
  final double maxLabelWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AxSpace.s6,
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active ? AxColors.brand : AxColors.panelSoft,
          ),
          child: Center(
            child: Text(
              number,
              style: AxType.text(
                AxType.micro,
                weight: FontWeight.w700,
                color: active ? AxColors.surface : AxColors.textFaint,
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxLabelWidth),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              style: active
                  ? AxType.text(
                      AxType.captionSm,
                      weight: FontWeight.w700,
                      color: AxColors.brand,
                    )
                  : AxType.text(
                      AxType.captionSm,
                      color: AxColors.textFaint,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CtaButton extends StatelessWidget {
  const _CtaButton({required this.label, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Opacity(
        opacity: onPressed == null ? 0.5 : 1,
        child: Container(
          height: AxSpace.buttonHeight,
          alignment: Alignment.center,
          decoration: const ShapeDecoration(
            gradient: AxGradients.avatarPeach,
            shape: StadiumBorder(),
          ),
          child: Text(
            label,
            style: AxType.text(
              AxType.body,
              weight: FontWeight.w700,
              color: AxColors.brand,
            ),
          ),
        ),
      ),
    );
  }
}

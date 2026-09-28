import 'dart:io' show Platform;
import 'dart:math' as math;

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
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_field.dart';
import '../../../../design/widgets/ax_primary_button.dart';
import '../data/fixtures.dart';
import '../data/provider_repository.dart';

/// `/biz/onboarding` — the business signup card, centered on the hero
/// gradient with two decorative blobs. This route sits outside [BizShell]:
/// the artboard has no sidebar here.
///
/// The artboard only defines the step-1 card; Continue advances the stepper
/// through Details → Verify → Services and then navigates to the dashboard.
/// Verify and Services have no artboard (see docs/PROGRESS.md known gaps) —
/// their content is a pragmatic reuse of this file's own field/button
/// tokens, matching Client_Register's OTP-step precedent.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  final _serviceNameController = TextEditingController();
  final _durationController = TextEditingController();
  final _priceController = TextEditingController();
  String _category = kCategoryOptions.first;
  int _step = 0;
  bool _handledSignIn = false;
  bool _savingService = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _otpController.dispose();
    _serviceNameController.dispose();
    _durationController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  bool get _detailsValid =>
      _nameController.text.trim().isNotEmpty &&
      _phoneController.text.trim().isNotEmpty;

  Future<void> _pickCategory() async {
    final picked = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final option in kCategoryOptions)
              ListTile(
                title: Text(option),
                onTap: () => Navigator.of(context).pop(option),
              ),
          ],
        ),
      ),
    );
    if (picked != null) setState(() => _category = picked);
  }

  Future<void> _onDetailsContinue() async {
    if (!_detailsValid) return;
    await ref
        .read(authControllerProvider.notifier)
        .sendOtp(_phoneController.text.trim());
  }

  Future<void> _onVerifyPressed() async {
    final code = _otpController.text.trim();
    if (code.isEmpty) return;
    await ref.read(authControllerProvider.notifier).verifyOtp(code);
  }

  Future<void> _onGooglePressed() async {
    if (!_detailsValid) return;
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
    final businessName = typedName.isNotEmpty
        ? typedName
        : (firebaseUser.displayName ?? 'New provider');
    await ref.read(userRepositoryProvider).createIfMissing(
          uid: firebaseUser.uid,
          role: AppUserRole.business,
          displayName: businessName,
          phoneNumber: firebaseUser.phoneNumber,
          email: firebaseUser.email,
          photoUrl: firebaseUser.photoUrl,
        );
    await ref.read(providerRepositoryProvider).createOrUpdate(
          BusinessProviderProfile(
            uid: firebaseUser.uid,
            businessName: businessName,
            category: _category,
            phone: firebaseUser.phoneNumber ?? _phoneController.text.trim(),
          ),
        );
    if (mounted) setState(() => _step = 2);
  }

  Future<void> _onServicesContinue() async {
    final uid = ref.read(authRepositoryProvider).currentUser?.uid;
    final name = _serviceNameController.text.trim();
    final duration = int.tryParse(_durationController.text.trim());
    final price = int.tryParse(_priceController.text.trim());
    if (uid == null || name.isEmpty || duration == null || price == null) {
      return;
    }
    setState(() => _savingService = true);
    await ref.read(providerRepositoryProvider).addFirstService(
          providerId: uid,
          category: _category,
          name: name,
          durationMinutes: duration,
          priceUgx: price,
        );
    if (mounted) context.go(AxRoutes.bizDashboard);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<AuthUser?>>(authStateChangesProvider, (previous, next) {
      final user = next.value;
      if (user != null && _step < 2) {
        _handleSignedIn(user);
      }
    });
    final authState = ref.watch(authControllerProvider);
    if (authState.status == AuthFlowStatus.codeSent && _step == 0) {
      _step = 1;
    }
    final busy = authState.status == AuthFlowStatus.sendingCode ||
        authState.status == AuthFlowStatus.verifyingCode ||
        authState.status == AuthFlowStatus.signingInWithGoogle ||
        _savingService;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                const Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: AxGradients.onboardingHero,
                    ),
                  ),
                ),
                // Biz_Onboarding.dc.html line 19: 420px, left:-140px, top:-160px.
                const Positioned(
                  left: -140,
                  top: -160,
                  child: _Blob(size: 420, color: AxColors.peach, opacity: 0.5),
                ),
                // Biz_Onboarding.dc.html line 20: 380px, right:-140px, bottom:-160px.
                const Positioned(
                  right: -140,
                  bottom: -160,
                  child: _Blob(size: 380, color: AxColors.salmon, opacity: 0.35),
                ),
                Positioned.fill(
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Center(
                        child: _JoinCard(
                          step: _step,
                          busy: busy,
                          errorMessage: authState.status == AuthFlowStatus.error
                              ? authState.errorMessage
                              : null,
                          onContinue: switch (_step) {
                            0 => _onDetailsContinue,
                            1 => _onVerifyPressed,
                            _ => _onServicesContinue,
                          },
                          onGoogle: _step == 0 ? _onGooglePressed : null,
                          child: switch (_step) {
                            0 => _DetailsStep(
                                nameController: _nameController,
                                phoneController: _phoneController,
                                category: _category,
                                onCategoryTap: _pickCategory,
                              ),
                            1 => _VerifyStep(otpController: _otpController),
                            _ => _ServicesStep(
                                nameController: _serviceNameController,
                                durationController: _durationController,
                                priceController: _priceController,
                              ),
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Decorative radial blob — `radial-gradient(circle, <color>, transparent 70%)`.
/// CSS `circle` defaults to the farthest-corner extent (√2/2 of the box on a
/// square) and the `transparent 70%` stop is kept verbatim.
class _Blob extends StatelessWidget {
  const _Blob({
    required this.size,
    required this.color,
    required this.opacity,
  });

  static const double _farthestCorner = 0.7071067811865476;

  final double size;
  final Color color;
  final double opacity;

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
            colors: [color, color.withValues(alpha: 0)],
            stops: const [0.0, 0.7],
            radius: _farthestCorner,
          ),
        ),
      ),
    );
  }
}

/// The white 460×auto signup card.
class _JoinCard extends StatelessWidget {
  const _JoinCard({
    required this.step,
    required this.busy,
    required this.errorMessage,
    required this.onContinue,
    required this.onGoogle,
    required this.child,
  });

  /// Biz_Onboarding.dc.html line 21: `width:460px; padding:38px 40px`.
  static const double _cardWidth = 460;
  static const double _cardPaddingVertical = 38;
  static const double _cardPaddingHorizontal = 40;

  /// Biz_Onboarding.dc.html line 61: `margin-top:4px`.
  static const double _buttonTopGap = 4;

  final int step;
  final bool busy;
  final String? errorMessage;
  final VoidCallback onContinue;
  final VoidCallback? onGoogle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _cardWidth,
      padding: const EdgeInsets.symmetric(
        vertical: _cardPaddingVertical,
        horizontal: _cardPaddingHorizontal,
      ),
      decoration: const BoxDecoration(
        color: AxColors.surface,
        borderRadius: BorderRadius.all(Radius.circular(AxRadius.xl)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AxSpace.s22,
        children: [
          Row(
            spacing: AxSpace.s9,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  gradient: AxGradients.logo,
                  borderRadius: BorderRadius.all(Radius.circular(AxRadius.sm)),
                ),
                alignment: Alignment.center,
                child: const AxDuoIcon(AxDuoIcons.logoMark, size: 17),
              ),
              Expanded(
                child: Text(
                  kBrandLine,
                  style: AxType.head(
                    AxType.body,
                    weight: FontWeight.w700,
                    color: AxColors.brand,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AxSpace.s6,
            children: [
              Text(
                kHeading,
                style: AxType.head(
                  AxType.h3,
                  weight: FontWeight.w800,
                  color: AxColors.brand,
                ),
              ),
              Text(
                kSubheading,
                style: AxType.text(
                  AxType.label,
                  color: AxColors.textMuted,
                ),
              ),
            ],
          ),
          _Stepper(step: step),
          child,
          if (errorMessage != null)
            Text(
              errorMessage!,
              style: AxType.text(AxType.labelSm, color: Colors.red),
            ),
          Padding(
            padding: const EdgeInsets.only(top: _buttonTopGap),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: AxSpace.s10,
              children: [
                _ContinueButton(
                  label: kContinueLabel,
                  onPressed: busy ? null : onContinue,
                ),
                if (onGoogle != null)
                  AxPrimaryButton(
                    label: kGoogleCta,
                    style: AxButtonStyle.outline,
                    height: 48,
                    onPressed: busy ? null : onGoogle,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailsStep extends StatelessWidget {
  const _DetailsStep({
    required this.nameController,
    required this.phoneController,
    required this.category,
    required this.onCategoryTap,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final String category;
  final VoidCallback onCategoryTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s22,
      children: [
        AxLabeledField(
          kNameFieldLabel,
          hint: kNameFieldHint,
          controller: nameController,
          desktop: true,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AxSpace.s6,
          children: [
            AxFieldLabel(kCategoryFieldLabel),
            _CategorySelect(value: category, onTap: onCategoryTap),
            Text(
              kCategoryFieldHelper,
              style: AxType.text(AxType.microSm, color: AxColors.textFaint),
            ),
          ],
        ),
        AxLabeledField(
          kPhoneFieldLabel,
          hint: kPhoneFieldHint,
          controller: phoneController,
          desktop: true,
          keyboardType: TextInputType.phone,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AxSpace.s6,
          children: [
            AxFieldLabel(kVerificationFieldLabel),
            const _UploadBox(),
          ],
        ),
      ],
    );
  }
}

class _VerifyStep extends StatelessWidget {
  const _VerifyStep({required this.otpController});

  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s6,
      children: [
        AxFieldLabel(kOtpTitle),
        AxField(
          hint: kOtpHint,
          controller: otpController,
          keyboardType: TextInputType.number,
          desktop: true,
        ),
        Text.rich(
          TextSpan(
            text: '$kOtpResendPrompt ',
            style: AxType.text(AxType.labelSm, color: AxColors.textSubtle),
            children: [
              TextSpan(
                text: kOtpResendLink,
                style: AxType.text(AxType.labelSm, color: AxColors.brandMid),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ServicesStep extends StatelessWidget {
  const _ServicesStep({
    required this.nameController,
    required this.durationController,
    required this.priceController,
  });

  final TextEditingController nameController;
  final TextEditingController durationController;
  final TextEditingController priceController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s16,
      children: [
        Text(
          kFirstServiceHeading,
          style: AxType.text(
            AxType.label,
            weight: FontWeight.w700,
            color: AxColors.textPrimary,
          ),
        ),
        AxLabeledField(
          kServiceNameFieldLabel,
          hint: kServiceNameFieldHint,
          controller: nameController,
          desktop: true,
        ),
        AxLabeledField(
          kServiceDurationFieldLabel,
          hint: kServiceDurationFieldHint,
          controller: durationController,
          desktop: true,
          keyboardType: TextInputType.number,
        ),
        AxLabeledField(
          kServicePriceFieldLabel,
          hint: kServicePriceFieldHint,
          controller: priceController,
          desktop: true,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}

/// The Details → Verify → Services stepper; line between groups is an
/// `1px solid #E0DBCF` divider.
class _Stepper extends StatelessWidget {
  const _Stepper({required this.step});

  /// Biz_Onboarding.dc.html lines 33/35/37: `width:22px; height:22px`.
  static const double _dotSize = 22;

  final int step;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AxSpace.s8,
      children: [
        for (var i = 0; i < kStepLabels.length; i++) ...[
          Flexible(
            child: Row(
              spacing: AxSpace.s6,
              children: [
                Container(
                  width: _dotSize,
                  height: _dotSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        i == step ? AxColors.brand : AxColors.panelSoft,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${i + 1}',
                    style: AxType.text(
                      AxType.micro,
                      weight: FontWeight.w700,
                      color:
                          i == step ? AxColors.surface : AxColors.textFaint,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    kStepLabels[i],
                    style: AxType.text(
                      AxType.captionSm,
                      weight: i == step ? FontWeight.w700 : FontWeight.w400,
                      color: i == step ? AxColors.brand : AxColors.textFaint,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (i < kStepLabels.length - 1)
            const Expanded(
              child: ColoredBox(
                color: AxColors.borderStrong,
                child: SizedBox(height: 1),
              ),
            ),
        ],
      ],
    );
  }
}

/// The Category `.input` rendered as a tappable select: 44 high, radius 9,
/// `1px solid #E0DBCF`, `0 14px` padding, value and chevron at
/// `space-between`.
class _CategorySelect extends StatelessWidget {
  const _CategorySelect({required this.value, required this.onTap});

  /// Biz_Onboarding.dc.html line 15: `.input { height:44px … }`.
  static const double _height = 44;

  /// Biz_Onboarding.dc.html line 46: `<svg width="12" height="12" …>`.
  static const double _chevronSize = 12;

  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: _height,
        padding: const EdgeInsets.symmetric(horizontal: AxSpace.s14),
        decoration: BoxDecoration(
          color: AxColors.surface,
          border: Border.all(color: AxColors.borderStrong),
          borderRadius: const BorderRadius.all(Radius.circular(AxRadius.xs)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: AxType.text(AxType.label, color: AxColors.textPrimary),
            ),
            AxIcon(
              AxIcons.chevronDown,
              size: _chevronSize,
              color: AxColors.textFaint,
            ),
          ],
        ),
      ),
    );
  }
}

/// The ID upload drop zone — `1.5px dashed #D7D1C2`, radius 10, `16px`
/// padding, 18 px image icon at `#A66A5D`, `12px` label at `#8A8A8A`.
/// Stays visually present but non-functional this pass — wiring a real file
/// picker + storage upload is out of scope until `firebase_storage` and a
/// verification review flow are added.
class _UploadBox extends StatelessWidget {
  const _UploadBox();

  /// Biz_Onboarding.dc.html line 56: `<svg width="18" height="18" …>`.
  static const double _iconSize = 18;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(
        color: AxColors.dividerWarm,
        radius: AxRadius.md,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AxSpace.s16),
        child: Row(
          spacing: AxSpace.s10,
          children: [
            AxIcon(AxIcons.image, size: _iconSize, color: AxColors.brandMid),
            Expanded(
              child: Text(
                kVerificationFieldHint,
                style: AxType.text(
                  AxType.caption,
                  color: AxColors.textSubtle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// `1.5px dashed` rounded-rect border. CSS `dashed` alternates 3×/3× the
/// border width (4.5 px on 4.5 px here).
class _DashedBorderPainter extends CustomPainter {
  const _DashedBorderPainter({
    required this.color,
    required this.radius,
  });

  /// Biz_Onboarding.dc.html line 55: `border:1.5px dashed #D7D1C2`.
  static const double _strokeWidth = 1.5;
  static const double _dashLength = 4.5;
  static const double _gapLength = 4.5;

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(radius)),
      );
    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      var start = 0.0;
      while (start < metric.length) {
        final end = math.min(start + _dashLength, metric.length);
        canvas.drawPath(metric.extractPath(start, end), paint);
        start = end + _gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.radius != radius;
  }
}

/// The card's Continue button — a 48-high stadium on the peach gradient
/// (`linear-gradient(135deg,#FEC89A,#FFB5A7)`), 14/700 `#6B3F3A` label. This
/// is the Biz_Onboarding inline control, not `.btn` (50/15) from
/// Client_Onboarding, so it stays local.
class _ContinueButton extends StatelessWidget {
  const _ContinueButton({required this.label, this.onPressed});

  /// Biz_Onboarding.dc.html line 61: `height:48px; border-radius:24px`.
  static const double _height = 48;

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Opacity(
        opacity: onPressed == null ? 0.5 : 1,
        child: Container(
          height: _height,
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

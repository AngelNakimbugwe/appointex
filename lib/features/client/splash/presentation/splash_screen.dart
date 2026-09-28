import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes.dart';
import '../../../../design/icons/ax_icon.dart';
import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_gradients.dart';
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../data/fixtures.dart';

/// `/` — the very first thing anyone sees. Shows briefly, then hands off to
/// onboarding (the router's own redirect then carries a returning signed-in
/// user straight past it). No artboard for this — reuses the onboarding
/// screen's hero-gradient/blob/logo language for a cohesive handoff.
class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    this.duration = const Duration(milliseconds: 2200),
  });

  final Duration duration;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.duration, () {
      if (mounted) context.go(AxRoutes.onboarding);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(gradient: AxGradients.onboardingHero),
          ),
          const Positioned(
            left: -120,
            top: -140,
            child: _Blob(size: 360, color: AxColors.salmon, opacity: 0.35),
          ),
          const Positioned(
            right: -100,
            bottom: -120,
            child: _Blob(size: 320, color: AxColors.peach, opacity: 0.45),
          ),
          Center(
            child: _EntranceAnimation(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: AxSpace.s16,
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    decoration: const BoxDecoration(
                      gradient: AxGradients.logo,
                      borderRadius: BorderRadius.all(Radius.circular(AxRadius.xl)),
                    ),
                    child: const Center(
                      child: AxDuoIcon(AxDuoIcons.logoMark, size: 52),
                    ),
                  ),
                  Text(
                    kSplashTitle,
                    style: AxType.head(
                      AxType.h1,
                      weight: FontWeight.w800,
                      color: AxColors.brand,
                      letterSpacingEm: -0.01,
                    ),
                  ),
                  Text(
                    kSplashTagline,
                    textAlign: TextAlign.center,
                    style: AxType.text(AxType.label, color: AxColors.textMuted),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Fades and pops the logo block in — `Curves.easeOutBack` gives it a touch
/// of overshoot so the entrance reads as lively rather than a flat fade.
class _EntranceAnimation extends StatelessWidget {
  const _EntranceAnimation({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Opacity(
          opacity: value.clamp(0, 1),
          child: Transform.scale(scale: 0.7 + 0.3 * value, child: child),
        );
      },
      child: child,
    );
  }
}

/// Decorative radial blob, matching the client/business onboarding screens'
/// `radial-gradient(circle, <color>, transparent 70%)` treatment.
class _Blob extends StatelessWidget {
  const _Blob({required this.size, required this.color, required this.opacity});

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

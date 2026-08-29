import 'package:flutter/material.dart';

import 'ax_colors.dart';

/// All gradients are 135deg (top-left → bottom-right) except [urgent], which is
/// 120deg — approximated per Rule 9 of docs/03-RESPONSIVE-RULES.md.
abstract final class AxGradients {
  static const LinearGradient avatarPeach = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AxColors.peach, AxColors.salmon],
  );

  static const LinearGradient logo = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AxColors.brand, AxColors.brandMid],
  );

  static const LinearGradient avatarBlush = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AxColors.blushPale, AxColors.salmon],
  );

  static const LinearGradient avatarSand = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AxColors.sand, AxColors.peach],
  );

  static const LinearGradient avatarPale = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AxColors.blushPale, AxColors.blush],
  );

  static const LinearGradient avatarRose = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AxColors.blush, AxColors.salmon],
  );

  static const LinearGradient avatarSandBlush = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AxColors.sand, AxColors.blush],
  );

  /// 120deg in CSS — approximated as a shallow diagonal (Rule 9).
  static const LinearGradient urgent = LinearGradient(
    begin: Alignment(-1.0, -0.6),
    end: Alignment(1.0, 0.6),
    colors: [AxColors.urgentFrom, AxColors.urgentTo],
  );

  static const LinearGradient onboardingHero = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.45, 1.0],
    colors: [AxColors.blushPale, AxColors.sand, AxColors.peach],
  );

  /// The six avatar gradients rotate per provider. Index by a stable hash of
  /// the provider id so a given provider always renders the same gradient.
  static const List<Gradient> avatars = [
    avatarPeach,
    avatarBlush,
    avatarSand,
    avatarPale,
    avatarRose,
    avatarSandBlush,
  ];
}

import 'package:flutter/material.dart';

import '../tokens/ax_colors.dart';
import '../tokens/ax_gradients.dart';
import '../tokens/ax_space.dart';
import '../tokens/ax_type.dart';

/// Button style from the artboards (`.btn`, Client_Onboarding): height 50,
/// radius 25 on 50 — a stadium, so `StadiumBorder` (survives text scaling),
/// font 15/700. Three looks:
///  - gradient: `linear-gradient(135deg,#FEC89A,#FFB5A7)` — the documented
///    stops of `AxGradients.avatarPeach` — with `#6B3F3A` text
///  - outline: white bg, `1.5px solid #6B3F3A`, brand text
///  - filled: brand bg, white text
enum AxButtonStyle { gradient, outline, filled }

class AxPrimaryButton extends StatelessWidget {
  const AxPrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.style = AxButtonStyle.gradient,
  });

  final String label;
  final VoidCallback? onPressed;
  final AxButtonStyle style;

  @override
  Widget build(BuildContext context) {
    final ShapeDecoration decoration;
    final Color foreground;
    switch (style) {
      case AxButtonStyle.gradient:
        decoration = const ShapeDecoration(
          gradient: AxGradients.avatarPeach,
          shape: StadiumBorder(),
        );
        foreground = AxColors.brand;
      case AxButtonStyle.outline:
        decoration = const ShapeDecoration(
          color: AxColors.surface,
          shape: StadiumBorder(
            side: BorderSide(color: AxColors.brand, width: 1.5),
          ),
        );
        foreground = AxColors.brand;
      case AxButtonStyle.filled:
        decoration = const ShapeDecoration(
          color: AxColors.brand,
          shape: StadiumBorder(),
        );
        foreground = AxColors.surface;
    }

    return GestureDetector(
      onTap: onPressed,
      child: Opacity(
        opacity: onPressed == null ? 0.5 : 1,
        child: Container(
          height: AxSpace.buttonHeight,
          alignment: Alignment.center,
          decoration: decoration,
          child: Text(
            label,
            style: AxType.text(AxType.bodyLg,
                weight: FontWeight.w700, color: foreground),
          ),
        ),
      ),
    );
  }
}

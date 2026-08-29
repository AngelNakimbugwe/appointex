import 'package:flutter/material.dart';

import '../tokens/ax_colors.dart';
import '../tokens/ax_radius.dart';
import '../tokens/ax_space.dart';

/// White card, `border: 1px solid #ECE7DC`, radius 14 (default) or 12,
/// padding 18/20. The artboards never use elevation — no shadows anywhere.
class AxCard extends StatelessWidget {
  const AxCard({
    super.key,
    required this.child,
    this.radius = AxRadius.tile,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AxSpace.s20,
      vertical: AxSpace.s18,
    ),
    this.onTap,
  });

  final Widget child;
  final double radius;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: AxColors.surface,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          border: Border.all(color: AxColors.border),
        ),
        child: child,
      ),
    );
  }
}

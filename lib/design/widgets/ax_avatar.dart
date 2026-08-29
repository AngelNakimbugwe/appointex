import 'package:flutter/material.dart';

import '../icons/ax_icon.dart';
import '../tokens/ax_gradients.dart';
import '../tokens/ax_radius.dart';

/// Gradient avatar — a square, rounded box filled with one of the six
/// `AxGradients.avatars` gradients, holding the provider's decorative art SVG
/// (see docs/04 §AxAvatar). Sizes seen in the artboards: 30, 36, 38, 44, 56,
/// 72 with radii 8–12; both are call-site data, not a fixed scale.
///
/// `flex-shrink: 0` in the artboards: never let a Row squeeze it.
class AxAvatar extends StatelessWidget {
  const AxAvatar({
    super.key,
    required this.size,
    this.radius = AxRadius.md,
    this.art,
    this.gradient,
    this.child,
  });

  final double size;
  final double radius;

  /// Decorative art asset (`AxIcons.art*`). Drawn at 55% of the box — the
  /// artboards use 52–55% depending on context; pass [child] for exact control.
  final String? art;

  /// One of `AxGradients.avatars`. Defaults to the first of the rotation.
  final Gradient? gradient;

  /// Fully custom box content; overrides [art].
  final Widget? child;

  /// Picks the avatar gradient for a provider id by stable hash, so a given
  /// provider always renders the same gradient (docs/01 § Gradients).
  static Gradient gradientFor(String id) {
    var hash = 0x811c9dc5;
    for (final unit in id.codeUnits) {
      hash ^= unit;
      hash = (hash * 0x01000193) & 0x7fffffff;
    }
    return AxGradients.avatars[hash % AxGradients.avatars.length];
  }

  @override
  Widget build(BuildContext context) {
    final artScale = size * 0.55;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: gradient ?? AxGradients.avatars.first,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: Center(
        child: SizedBox(
          width: artScale,
          height: artScale,
          child: child ??
              (art == null ? null : AxArt(art!, size: artScale)),
        ),
      ),
    );
  }
}

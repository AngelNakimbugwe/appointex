import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../tokens/ax_colors.dart';
import '../tokens/ax_radius.dart';
import '../tokens/ax_space.dart';
import '../tokens/ax_type.dart';

/// Commission plan card (`.plan`, Biz_Settings): radius 12, padding `14 16`,
/// column gap 6. The current plan is `#6B3F3A` with a `1.5px solid #6B3F3A`
/// border, a `#FEC89A` eyebrow and a white Manrope 20/800 value. The
/// alternate plan is `#F7F5F1` with a `1.5px dashed #D7D1C2` border.
class AxPlanCard extends StatelessWidget {
  const AxPlanCard({
    super.key,
    required this.eyebrow,
    required this.value,
    required this.description,
    this.selected = false,
    this.onTap,
  });

  final String eyebrow;
  final String value;
  final String description;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s16,
        vertical: AxSpace.s14,
      ),
      decoration: BoxDecoration(
        color: selected ? AxColors.brand : AxColors.surfaceWarm,
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.card)),
        border: selected ? Border.all(color: AxColors.brand, width: 1.5) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AxSpace.s6,
        children: [
          Text(
            eyebrow,
            style: AxType.text(AxType.micro,
                weight: FontWeight.w700,
                color: selected ? AxColors.peach : AxColors.brandMid),
          ),
          Text(
            value,
            style: AxType.head(AxType.h4,
                weight: FontWeight.w800,
                color: selected ? AxColors.surface : AxColors.brand),
          ),
          Text(
            description,
            style: AxType.text(
                AxType.captionSm,
                color:
                    selected ? AxColors.roseMuted : AxColors.textMuted),
          ),
        ],
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: selected
          ? card
          : CustomPaint(
              foregroundPainter: const _DashedBorderPainter(),
              child: card,
            ),
    );
  }
}

/// CSS `border: 1.5px dashed #D7D1C2` — Flutter has no dashed border, so the
/// dash pattern is painted along the rounded-rect outline.
class _DashedBorderPainter extends CustomPainter {
  const _DashedBorderPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AxColors.dividerWarm
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    final outline = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size,
          const Radius.circular(AxRadius.card),
        ),
      );
    for (final metric in outline.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = math.min(distance + 4, metric.length);
        canvas.drawPath(metric.extractPath(distance, next), paint);
        distance = next + 4;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) => false;
}

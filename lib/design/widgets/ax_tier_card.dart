import 'package:flutter/material.dart';

import '../tokens/ax_colors.dart';
import '../tokens/ax_radius.dart';
import '../tokens/ax_space.dart';
import '../tokens/ax_type.dart';

/// Featured-spot tier card (`.tier`, Biz_FeaturedSpots): `1px solid #ECE7DC`,
/// radius 14, padding `16 18`, column gap 8. Eyebrow 10.5/700 uppercase
/// (`letter-spacing: 0.04em`), price Manrope 17/800 brand. The highlighted
/// tier swaps to a `#FFB5A7` border on `#F9DCC4` with a `#A66A5D` eyebrow.
/// [child] carries the tier's trailing action ("Choose" button).
class AxTierCard extends StatelessWidget {
  const AxTierCard({
    super.key,
    required this.label,
    required this.price,
    this.selected = false,
    this.child,
    this.onTap,
  });

  final String label;
  final String price;
  final bool selected;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AxSpace.s18,
          vertical: AxSpace.s16,
        ),
        decoration: BoxDecoration(
          color: selected ? AxColors.sand : null,
          borderRadius: const BorderRadius.all(Radius.circular(AxRadius.tile)),
          border: Border.all(
            color: selected ? AxColors.salmon : AxColors.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AxSpace.s8,
          children: [
            Text(
              label,
              style: AxType.text(
                AxType.microSm,
                weight: FontWeight.w700,
                color: selected ? AxColors.brandMid : AxColors.textFaint,
                letterSpacingEm: 0.04,
              ),
            ),
            Text(
              price,
              style: AxType.head(AxType.titleLg,
                  weight: FontWeight.w800, color: AxColors.brand),
            ),
            ?child,
          ],
        ),
      ),
    );
  }
}

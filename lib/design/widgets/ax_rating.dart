import 'package:flutter/material.dart';

import '../icons/ax_icon.dart';
import '../icons/ax_icons.dart';
import '../tokens/ax_colors.dart';
import '../tokens/ax_space.dart';
import '../tokens/ax_type.dart';

/// Inline rating: star 12 px `#A66A5D` + text like `4.9 · from UGX 25,000`
/// at 11.5 px `#5B5B5B`, gap 4 (Client_Home).
class AxRating extends StatelessWidget {
  const AxRating({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: AxSpace.s4,
      children: [
        const AxIcon(AxIcons.starFill, size: 12, color: AxColors.brandMid),
        Text(
          value,
          style: AxType.text(AxType.captionSm, color: AxColors.textBody),
        ),
      ],
    );
  }
}

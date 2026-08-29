import 'package:flutter/material.dart';

import '../tokens/ax_colors.dart';
import '../tokens/ax_space.dart';
import '../tokens/ax_type.dart';

/// Small status pill (`.pill`, Biz_Earnings): padding `3px 9px`, radius 7,
/// font 10.5/700. Status colours come from the semantic tokens —
/// `verified`/`verifiedBg` for released/paid, `pending`/`pendingBg` for
/// held/pending (those pairs are the defaults).
class AxPill extends StatelessWidget {
  const AxPill({
    super.key,
    required this.label,
    this.background = AxColors.verifiedBg,
    this.foreground = AxColors.verified,
  });

  final String label;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s9,
        vertical: AxSpace.s3,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      child: Text(
        label,
        style: AxType.text(AxType.microSm,
            weight: FontWeight.w700, color: foreground),
      ),
    );
  }
}

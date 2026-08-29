import 'package:flutter/material.dart';

import '../tokens/ax_colors.dart';
import '../tokens/ax_radius.dart';
import '../tokens/ax_space.dart';
import '../tokens/ax_type.dart';

/// Stat tile (`.stat`, Biz_Dashboard / Biz_Earnings): white body, `1px solid
/// #ECE7DC`, radius 14, padding `16 18`, column gap 6, label 11.5 `#8A8A8A`
/// above the value (Manrope 24/800 `#6B3F3A`).
///
/// Biz_Dashboard tiles add `border-top: 3px solid #FFB5A7` (one per tile also
/// uses `#FEC89A` / `#A66A5D`); Biz_Earnings tiles have no top accent — pass
/// `accent: null` for that variant.
///
/// **Implementation warning** (docs/04): Flutter cannot render a `Border` with
/// one differing side plus a `borderRadius` — it throws. The accent is built
/// as a 3 px child inside a `ClipRRect`.
class AxStatTile extends StatelessWidget {
  const AxStatTile({
    super.key,
    required this.label,
    required this.value,
    this.accent = AxColors.salmon,
  });

  final String label;
  final String value;
  final Color? accent;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(AxRadius.tile)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AxColors.surface,
          border: Border.all(color: AxColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (accent != null) Container(height: 3, color: accent),
            Padding(
              padding: AxSpace.statTilePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AxSpace.s6,
                children: [
                  Text(
                    label,
                    style: AxType.text(AxType.captionSm,
                        color: AxColors.textSubtle),
                  ),
                  Text(
                    value,
                    style: AxType.head(AxType.h2,
                        weight: FontWeight.w800, color: AxColors.brand),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

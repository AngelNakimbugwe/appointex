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
/// Biz_Earnings.dc.html line 68 sets the value at `font-size:22px` (the
/// dashboard tiles are 24) — pass [valueSize] for that, and line 71 has a
/// fourth tile with `background:#6B3F3A; border-color:#6B3F3A`, label
/// `#FEC89A`, value `#FFFFFF` — the [AxStatTile.dark] variant. Both
/// additions default to the original dashboard rendering.
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
    this.valueSize = AxType.h2,
    this.dark = false,
  });

  /// Dark `.stat` — Biz_Earnings.dc.html line 71: `background:#6B3F3A;
  /// border-color:#6B3F3A`, label `#FEC89A`, value `#FFFFFF`, no top accent.
  const AxStatTile.dark({
    super.key,
    required this.label,
    required this.value,
    this.valueSize = AxType.h2,
  })  : accent = null,
        dark = true;

  final String label;
  final String value;
  final Color? accent;

  /// Manrope 800 value size — 24 (dashboard) by default; 22 on Biz_Earnings.
  final double valueSize;

  /// Whether this tile paints the dark `#6B3F3A` look.
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(AxRadius.tile)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: dark ? AxColors.brand : AxColors.surface,
          border: Border.all(color: dark ? AxColors.brand : AxColors.border),
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
                        color: dark ? AxColors.peach : AxColors.textSubtle),
                  ),
                  Text(
                    value,
                    style: AxType.head(valueSize,
                        weight: FontWeight.w800,
                        color: dark ? AxColors.surface : AxColors.brand),
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

import 'package:flutter/material.dart';

import '../../../../../design/icons/ax_icon.dart';
import '../../../../../design/icons/ax_icons.dart';
import '../../../../../design/tokens/ax_colors.dart';
import '../../../../../design/tokens/ax_gradients.dart';
import '../../../../../design/tokens/ax_radius.dart';
import '../../../../../design/tokens/ax_space.dart';
import '../../../../../design/tokens/ax_type.dart';

class HomeUrgentBanner extends StatelessWidget {
  const HomeUrgentBanner({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  static const double _lineGap = 1; // gap:1px — Client_Home.dc.html line 97

  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AxSpace.s15,
          vertical: AxSpace.s13,
        ),
        decoration: const BoxDecoration(
          gradient: AxGradients.urgent,
          borderRadius: BorderRadius.all(Radius.circular(AxRadius.tile)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: AxSpace.s12,
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AxColors.surface.withValues(alpha: 0.22),
                borderRadius: const BorderRadius.all(
                  Radius.circular(AxRadius.md),
                ),
              ),
              child: const Center(
                child: AxIcon(AxIcons.boltFill, size: 17, color: AxColors.surface),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: _lineGap,
                children: [
                  Text(
                    title,
                    style: AxType.head(
                      AxType.label,
                      weight: FontWeight.w800,
                      color: AxColors.surface,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: AxType.text(
                      AxType.microSm,
                      color: AxColors.urgentTextSoft,
                    ),
                  ),
                ],
            ),
            ),
            const AxIcon(
              AxIcons.chevronRight25,
              size: 14,
              color: AxColors.surface,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../icons/ax_icon.dart';
import '../icons/ax_icons.dart';
import '../tokens/ax_colors.dart';
import '../tokens/ax_gradients.dart';
import '../tokens/ax_radius.dart';
import '../tokens/ax_space.dart';
import '../tokens/ax_type.dart';

/// The seven business destinations, in the fixed artboard order.
enum AxSidebarItem {
  dashboard(AxIcons.grid, 'Dashboard'),
  calendar(AxIcons.calendar, 'Calendar'),
  clients(AxIcons.user, 'Clients'),
  earnings(AxIcons.card, 'Earnings'),
  services(AxIcons.list, 'Services'),
  featured(AxIcons.starOutline, 'Featured Spots'),
  settings(AxIcons.settings, 'Settings');

  const AxSidebarItem(this.icon, this.label);

  final String icon;
  final String label;
}

/// 220 px sidebar, background `#F8EDEB`, padding `22, 14`.
/// Brand block: 28 px gradient logo mark + "Appointex" 13/800 + "FOR BUSINESS"
/// 9.5/700 `#A66A5D` letterspaced 0.05em, padding `0, 8, 0, 24`.
/// Rows: `gap:11; padding:10px 16px; border-radius:9px` — active bg `#FFB5A7`
/// with 13/700 `#6B3F3A`, inactive 13/600 `#C9A79D`.
class AxSidebar extends StatelessWidget {
  const AxSidebar({
    super.key,
    required this.current,
    required this.onTap,
  });

  final AxSidebarItem current;
  final ValueChanged<AxSidebarItem> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AxSpace.sidebarWidth,
      padding: AxSpace.sidebarPadding,
      color: AxColors.blushPale,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(AxSpace.s8, 0, AxSpace.s8, AxSpace.s24),
            child: _BrandBlock(),
          ),
          for (final item in AxSidebarItem.values)
            _NavRow(
              item: item,
              active: item == current,
              onTap: () => onTap(item),
            ),
        ],
      ),
    );
  }
}

class _BrandBlock extends StatelessWidget {
  const _BrandBlock();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AxSpace.s9,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: const BoxDecoration(
            gradient: AxGradients.logo,
            borderRadius: BorderRadius.all(Radius.circular(AxRadius.sm)),
          ),
          alignment: Alignment.center,
          child: const AxDuoIcon(AxDuoIcons.logoMark, size: 16),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Appointex',
              style: AxType.head(AxType.label,
                  weight: FontWeight.w800, color: AxColors.brand),
            ),
            Text(
              'FOR BUSINESS',
              style: AxType.text(AxType.nanoSm,
                  weight: FontWeight.w700,
                  color: AxColors.brandMid,
                  letterSpacingEm: 0.05),
            ),
          ],
        ),
      ],
    );
  }
}

class _NavRow extends StatelessWidget {
  const _NavRow({
    required this.item,
    required this.active,
    required this.onTap,
  });

  final AxSidebarItem item;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = active ? AxColors.brand : AxColors.brandMuted;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AxSpace.s16,
          vertical: AxSpace.s10,
        ),
        decoration: BoxDecoration(
          color: active ? AxColors.salmon : null,
          borderRadius: const BorderRadius.all(Radius.circular(AxRadius.xs)),
        ),
        child: Row(
          spacing: AxSpace.s11,
          children: [
            AxIcon(item.icon, size: 17, color: color),
            Expanded(
              child: Text(
                item.label,
                style: AxType.text(AxType.label,
                    weight: active ? FontWeight.w700 : FontWeight.w600,
                    color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

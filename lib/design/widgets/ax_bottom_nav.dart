import 'package:flutter/material.dart';

import '../icons/ax_icon.dart';
import '../icons/ax_icons.dart';
import '../tokens/ax_colors.dart';
import '../tokens/ax_space.dart';
import '../tokens/ax_type.dart';

/// The four bottom-nav destinations. Active icons are drawn at a heavier
/// stroke (2.2) than inactive (2.0) — that is why each tab carries two asset
/// variants instead of one tinted asset.
enum AxNavItem { home, bookings, chat, profile }

/// 64 px bar, `border-top: 1px solid #ECE7DC`, background `#FFFFFF`.
/// Four `Expanded` items: icon 19 px + label 10 px, gap 4.
/// Do NOT replace with `NavigationBar` — it enforces 80 px + M3 indicator pill.
class AxBottomNav extends StatelessWidget {
  const AxBottomNav({
    super.key,
    required this.current,
    required this.onTap,
  });

  final AxNavItem current;
  final ValueChanged<AxNavItem> onTap;

  static const _items = <AxNavItem, (String, String, String)>{
    AxNavItem.home: (AxIcons.home, AxIcons.home20, 'Home'),
    AxNavItem.bookings: (AxIcons.calendar22, AxIcons.calendar, 'Bookings'),
    AxNavItem.chat: (AxIcons.chat, AxIcons.chat, 'Chat'),
    AxNavItem.profile: (AxIcons.user, AxIcons.user, 'Profile'),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AxSpace.bottomNavHeight,
      decoration: const BoxDecoration(
        color: AxColors.surface,
        border: Border(top: BorderSide(color: AxColors.border)),
      ),
      child: Row(
        children: [
          for (final entry in _items.entries)
            Expanded(
              child: _NavItem(
                data: entry,
                active: entry.key == current,
                onTap: () => onTap(entry.key),
              ),
            ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.data,
    required this.active,
    required this.onTap,
  });

  final MapEntry<AxNavItem, (String, String, String)> data;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final (activeAsset, inactiveAsset, label) = data.value;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AxSpace.s4,
        children: [
          AxIcon(
            active ? activeAsset : inactiveAsset,
            size: 19,
            color: active ? AxColors.brand : AxColors.textDisabled,
          ),
          Text(
            label,
            style: active
                ? AxType.text(AxType.nano,
                    weight: FontWeight.w700, color: AxColors.brand)
                : AxType.text(AxType.nano, color: AxColors.textDisabled),
          ),
        ],
      ),
    );
  }
}

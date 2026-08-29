import 'package:flutter/material.dart';

import '../tokens/ax_colors.dart';
import '../tokens/ax_radius.dart';
import '../tokens/ax_space.dart';
import '../tokens/ax_type.dart';

/// Filter chip — `.chip` (Search) and `.etype` (EventBundle) are the same
/// component: 12/600, radius 16, border `#E0DBCF`, text `#3A3A3A`, `nowrap`.
/// `.chip` pads 7/13, `.etype` pads 8/14.
/// Selected: bg `#6B3F3A`, text `#FFFFFF`, no visible border.
class AxChip extends StatelessWidget {
  const AxChip({
    super.key,
    required this.label,
    required this.selected,
    this.onTap,
    this.type = false,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  /// `.etype` variant — slightly larger padding for event-type chips.
  final bool type;

  @override
  Widget build(BuildContext context) {
    final hPad = type ? AxSpace.s14 : AxSpace.s13;
    final vPad = type ? AxSpace.s8 : AxSpace.s7;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
        decoration: BoxDecoration(
          color: selected ? AxColors.brand : null,
          borderRadius: const BorderRadius.all(Radius.circular(AxRadius.lg)),
          border: selected
              ? null
              : Border.all(color: AxColors.borderStrong),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.clip,
          softWrap: false,
          style: AxType.text(AxType.caption,
              weight: FontWeight.w600,
              color: selected ? AxColors.surface : AxColors.textPrimary),
        ),
      ),
    );
  }
}

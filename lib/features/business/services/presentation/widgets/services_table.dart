import 'package:flutter/material.dart';

import '../../../../../design/tokens/ax_colors.dart';
import '../../../../../design/tokens/ax_space.dart';
import '../../../../../design/tokens/ax_type.dart';
import '../../../../../design/widgets/ax_toggle.dart';
import '../../data/fixtures.dart';

/// Biz_Services.dc.html lines 69-73: column flexes `1.8, 1, 0.8, 1, 0.8`,
/// scaled ×5 to whole flex units.
const List<int> _columnFlexes = [9, 5, 4, 5, 4];

/// The services table — `.row` + `.th` chrome with the artboard's per-cell
/// content. Kept local to the feature rather than shared: `AxDataTable` takes
/// string rows only (no toggle cells, no per-column weights). Its chrome
/// values are copied exactly: `.th` 11/700 `#9A9A9A` uppercase `0.03em` over
/// a `1px #E8E3D8` rule, rows gap 14, padding `12px 6px`, `1px #F1EEE6`
/// rules between rows only.
class ServicesTable extends StatelessWidget {
  const ServicesTable({
    super.key,
    required this.active,
    required this.onToggle,
  });

  /// The Active-column toggle states, one per [kServices] row.
  final List<bool> active;

  /// Invoked with the row index when its toggle changes.
  final ValueChanged<int> onToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _HeaderRow(),
        for (var i = 0; i < kServices.length; i++)
          _ServiceRow(
            entry: kServices[i],
            value: active[i],
            onChanged: (value) => onToggle(i),
            showDivider: i < kServices.length - 1,
          ),
      ],
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AxSpace.s6,
        AxSpace.s16,
        AxSpace.s6,
        AxSpace.s12,
      ),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AxColors.borderSoft)),
      ),
      child: Row(
        spacing: AxSpace.s14,
        children: [
          for (var i = 0; i < kColumns.length; i++)
            Expanded(
              flex: _columnFlexes[i],
              child: Text(
                kColumns[i].toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AxType.text(
                  AxType.micro,
                  weight: FontWeight.w700,
                  color: AxColors.textFaint,
                  letterSpacingEm: 0.03,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ServiceRow extends StatelessWidget {
  const _ServiceRow({
    required this.entry,
    required this.value,
    required this.onChanged,
    required this.showDivider,
  });

  final ServiceRow entry;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s6,
        vertical: AxSpace.s12,
      ),
      decoration: showDivider
          ? const BoxDecoration(
              border: Border(bottom: BorderSide(color: AxColors.panelWarm)),
            )
          : null,
      child: Row(
        spacing: AxSpace.s14,
        children: [
          Expanded(
            flex: _columnFlexes[0],
            child: Text(
              entry.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AxType.text(
                AxType.label,
                weight: FontWeight.w700,
                color: AxColors.brand,
              ),
            ),
          ),
          Expanded(
            flex: _columnFlexes[1],
            child: Text(
              entry.category,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AxType.text(AxType.labelSm, color: AxColors.textBody),
            ),
          ),
          Expanded(
            flex: _columnFlexes[2],
            child: Text(
              entry.duration,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AxType.text(AxType.labelSm, color: AxColors.textBody),
            ),
          ),
          Expanded(
            flex: _columnFlexes[3],
            child: Text(
              entry.price,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AxType.text(
                AxType.labelSm,
                weight: FontWeight.w700,
                color: AxColors.brand,
              ),
            ),
          ),
          Expanded(
            flex: _columnFlexes[4],
            child: Align(
              alignment: Alignment.centerLeft,
              child: AxToggle(value: value, onChanged: onChanged),
            ),
          ),
        ],
      ),
    );
  }
}

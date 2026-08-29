import 'package:flutter/material.dart';

import '../tokens/ax_colors.dart';
import '../tokens/ax_space.dart';
import '../tokens/ax_type.dart';

/// Data table used by Clients / Earnings / Services / Featured Spots.
/// Header (`.th`): 11/700 `#9A9A9A`, uppercase, `letter-spacing: 0.03em`
/// (0.33 px at 11 px), separated by `1px solid #E8E3D8`.
/// Rows (`.row`): `gap: 14`, `border-bottom: 1px solid #F1EEE6` (none on the
/// last row), body cells 12.5 `#5B5B5B` (docs/01: labelSm — "table body").
/// Column widths are proportional flexes — pass [flexes] to match artboards.
/// Row padding varies by screen — `13px 6px` (Clients) is the default.
class AxDataTable extends StatelessWidget {
  const AxDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.flexes = const [],
    this.rowPadding = const EdgeInsets.symmetric(
      horizontal: AxSpace.s6,
      vertical: AxSpace.s13,
    ),
  });

  final List<String> columns;
  final List<List<String>> rows;

  /// One flex per column; empty = equal widths.
  final List<int> flexes;

  final EdgeInsetsGeometry rowPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
            AxSpace.s6,
            AxSpace.s16,
            AxSpace.s6,
            AxSpace.s13,
          ),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AxColors.borderSoft)),
          ),
          child: Row(
            spacing: AxSpace.s14,
            children: [
              for (var i = 0; i < columns.length; i++)
                Expanded(
                  flex: i < flexes.length ? flexes[i] : 1,
                  child: Text(
                    columns[i].toUpperCase(),
                    style: AxType.text(AxType.micro,
                        weight: FontWeight.w700,
                        color: AxColors.textFaint,
                        letterSpacingEm: 0.03),
                  ),
                ),
            ],
          ),
        ),
        for (var r = 0; r < rows.length; r++)
          Container(
            padding: rowPadding,
            decoration: r == rows.length - 1
                ? null
                : const BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: AxColors.panelWarm)),
                  ),
            child: Row(
              spacing: AxSpace.s14,
              children: [
                for (var i = 0; i < rows[r].length; i++)
                  Expanded(
                    flex: i < flexes.length ? flexes[i] : 1,
                    child: Text(
                      rows[r][i],
                      style:
                          AxType.text(AxType.labelSm, color: AxColors.textBody),
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

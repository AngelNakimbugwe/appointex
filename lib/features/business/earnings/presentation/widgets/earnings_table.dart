import 'package:flutter/material.dart';

import '../../../../../design/tokens/ax_colors.dart';
import '../../../../../design/tokens/ax_space.dart';
import '../../../../../design/tokens/ax_type.dart';
import '../../../../../design/widgets/ax_pill.dart';
import '../../data/fixtures.dart';

/// Biz_Earnings.dc.html lines 76-80: column flexes `1.2, 1.6, 1, 1, 1`,
/// scaled ×5 to whole flex units.
const List<int> _columnFlexes = [6, 8, 5, 5, 5];

/// The payouts table — `.row` + `.th` chrome with the artboard's per-cell
/// content. Kept local to the feature rather than shared: `AxDataTable` takes
/// string rows only (no pill cells, no per-column weights) and has no
/// row-gap or footnote support. Its chrome values are copied exactly:
/// `.th` 11/700 `#9A9A9A` uppercase `0.03em` over a `1px #E8E3D8` rule,
/// rows gap 14, padding `12px 6px`, `1px #F1EEE6` rules between rows only.
class EarningsTable extends StatelessWidget {
  const EarningsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AxSpace.s10,
      children: [
        _HeaderRow(),
        for (var i = 0; i < kPayouts.length; i++)
          _PayoutRow(
            entry: kPayouts[i],
            showDivider: i < kPayouts.length - 1,
          ),
        Padding(
          padding: const EdgeInsets.only(top: AxSpace.s2),
          child: Text(
            kFootnote,
            style: AxType.text(AxType.micro, color: AxColors.textFaint),
          ),
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

class _PayoutRow extends StatelessWidget {
  const _PayoutRow({required this.entry, required this.showDivider});

  final PayoutEntry entry;
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
              entry.date,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AxType.text(AxType.labelSm, color: AxColors.textBody),
            ),
          ),
          Expanded(
            flex: _columnFlexes[1],
            child: Text(
              entry.clientService,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AxType.text(
                AxType.labelSm,
                weight: FontWeight.w600,
                color: AxColors.brand,
              ),
            ),
          ),
          Expanded(
            flex: _columnFlexes[2],
            child: Text(
              entry.amount,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AxType.text(AxType.labelSm, color: AxColors.textBody),
            ),
          ),
          Expanded(
            flex: _columnFlexes[3],
            child: Text(
              entry.commission,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AxType.text(AxType.labelSm, color: AxColors.textBody),
            ),
          ),
          Expanded(
            flex: _columnFlexes[4],
            child: Align(
              alignment: Alignment.centerLeft,
              child: AxPill(
                label: entry.released ? kReleasedLabel : kHeldLabel,
                background:
                    entry.released ? AxColors.verifiedBg : AxColors.pendingBg,
                foreground: entry.released ? AxColors.verified : AxColors.pending,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_sidebar.dart';
import '../../../../design/widgets/ax_stat_tile.dart';
import '../../shell/biz_shell.dart';
import '../data/fixtures.dart';
import 'widgets/earnings_table.dart';

/// `/biz/earnings` — Biz_Earnings: the "Earnings" title with the payout
/// account chip, the four stat tiles and the payouts table, inside [BizShell].
class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.canvas,
      body: BizShell(
        current: AxSidebarItem.earnings,
        child: const _EarningsContent(),
      ),
    );
  }
}

class _EarningsContent extends StatelessWidget {
  const _EarningsContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AxSpace.s16,
      children: const [
        _HeaderRow(),
        _StatsRow(),
        Expanded(child: _PayoutsCard()),
      ],
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          kPageTitle,
          style: AxType.head(
            AxType.h4,
            weight: FontWeight.w800,
            color: AxColors.brand,
          ),
        ),
        const _PayoutAccountChip(),
      ],
    );
  }
}

/// Biz_Earnings.dc.html line 64: `height:38px; padding:0 16px;
/// border-radius:19px; border:1px solid #6B3F3A` — radius 19 on height 38 is a
/// stadium (the §AxPrimaryButton precedent), so `StadiumBorder`.
class _PayoutAccountChip extends StatelessWidget {
  const _PayoutAccountChip();

  /// Biz_Earnings.dc.html line 64: `height:38px`.
  static const double _height = 38;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: const EdgeInsets.symmetric(horizontal: AxSpace.s16),
      alignment: Alignment.center,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(side: BorderSide(color: AxColors.brand)),
      ),
      child: Text(
        kPayoutAccount,
        style: AxType.text(
          AxType.labelSm,
          weight: FontWeight.w700,
          color: AxColors.brand,
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  /// Biz_Earnings.dc.html lines 68-71: stat values `font-size:22px` (the
  /// dashboard `.stat` tiles use 24).
  static const double _statValueSize = 22;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        spacing: AxSpace.s16,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final stat in kStats)
            Expanded(
              child: stat.dark
                  ? AxStatTile.dark(
                      label: stat.label,
                      value: stat.value,
                      valueSize: _statValueSize,
                    )
                  : AxStatTile(
                      label: stat.label,
                      value: stat.value,
                      accent: null,
                      valueSize: _statValueSize,
                    ),
            ),
        ],
      ),
    );
  }
}

/// Biz_Earnings.dc.html line 74: the table card — `background:#FFFFFF;
/// border:1px solid #ECE7DC; border-radius:14px; padding:6px 22px 12px`.
class _PayoutsCard extends StatelessWidget {
  const _PayoutsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AxSpace.s22,
        AxSpace.s6,
        AxSpace.s22,
        AxSpace.s12,
      ),
      decoration: BoxDecoration(
        color: AxColors.surface,
        border: Border.all(color: AxColors.border),
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.tile)),
      ),
      child: const EarningsTable(),
    );
  }
}

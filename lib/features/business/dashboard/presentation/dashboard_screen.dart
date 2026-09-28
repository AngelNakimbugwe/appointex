import 'package:flutter/material.dart';

import '../../../../design/icons/ax_icon.dart';
import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_sidebar.dart';
import '../../../../design/widgets/ax_stat_tile.dart';
import '../../shell/biz_shell.dart';
import '../data/fixtures.dart';

/// `/biz/dashboard` — greeting header, four stat tiles, today's schedule and
/// the latest review, inside [BizShell].
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.canvas,
      body: BizShell(
        current: AxSidebarItem.dashboard,
        child: const _DashboardContent(),
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AxSpace.bizSectionGap,
      children: [
        const _Header(),
        IntrinsicHeight(
          child: Row(
            spacing: AxSpace.s16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final stat in kStats)
                Expanded(
                  child: AxStatTile(
                    label: stat.label,
                    value: stat.value,
                    accent: stat.accent,
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            spacing: AxSpace.s20,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 14, child: _ScheduleCard()),
              Expanded(flex: 10, child: _ReviewsCard()),
            ],
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AxSpace.s3,
          children: [
            Text(
              kGreeting,
              style: AxType.head(
                AxType.h4,
                weight: FontWeight.w800,
                color: AxColors.brand,
              ),
            ),
            Text(
              kDateLine,
              style: AxType.text(
                AxType.labelSm,
                color: AxColors.textSubtle,
              ),
            ),
          ],
        ),
        AxIcon(AxIcons.bell, size: 20, color: AxColors.brand),
      ],
    );
  }
}

/// Both cards share the `.stat` chrome: `#FFFFFF`, `1px solid #ECE7DC`,
/// radius 14, `padding:18px 20px`, inner column gap 12.
class _PanelCard extends StatelessWidget {
  const _PanelCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AxSpace.s18,
        horizontal: AxSpace.s20,
      ),
      decoration: BoxDecoration(
        color: AxColors.surface,
        border: Border.all(color: AxColors.border),
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.tile)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AxSpace.s12,
        children: children,
      ),
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  const _ScheduleCard();

  @override
  Widget build(BuildContext context) {
    return _PanelCard(
      children: [
        Text(
          kScheduleTitle,
          style: AxType.head(
            AxType.body,
            weight: FontWeight.w700,
            color: AxColors.brand,
          ),
        ),
        for (var i = 0; i < kSchedule.length; i++)
          _ScheduleRow(
            entry: kSchedule[i],
            showDivider: i < kSchedule.length - 1,
          ),
      ],
    );
  }
}

class _ScheduleRow extends StatelessWidget {
  const _ScheduleRow({required this.entry, required this.showDivider});

  /// Biz_Dashboard.dc.html line 78: `width:56px`.
  static const double _timeColumnWidth = 56;

  final ScheduleEntry entry;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AxSpace.s11),
      decoration: showDivider
          ? const BoxDecoration(
              border: Border(bottom: BorderSide(color: AxColors.panelWarm)),
            )
          : null,
      child: Row(
        spacing: AxSpace.s14,
        children: [
          SizedBox(
            width: _timeColumnWidth,
            child: Text(
              entry.time,
              style: AxType.text(
                AxType.caption,
                weight: FontWeight.w700,
                color: AxColors.brandMid,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.client,
                  style: AxType.text(
                    AxType.label,
                    weight: FontWeight.w600,
                    color: AxColors.brand,
                  ),
                ),
                Text(
                  entry.service,
                  style: AxType.text(
                    AxType.captionSm,
                    color: AxColors.textSubtle,
                  ),
                ),
              ],
            ),
          ),
          Text(
            entry.status,
            style: AxType.text(
              AxType.micro,
              weight: FontWeight.w700,
              color: entry.confirmed ? AxColors.verified : AxColors.brandMid,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewsCard extends StatelessWidget {
  const _ReviewsCard();

  /// Biz_Dashboard.dc.html line 97: `<svg width="12" height="12" …>`.
  static const double _starSize = 12;

  @override
  Widget build(BuildContext context) {
    return _PanelCard(
      children: [
        Text(
          kReviewsTitle,
          style: AxType.head(
            AxType.body,
            weight: FontWeight.w700,
            color: AxColors.brand,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AxSpace.s4,
          children: [
            Row(
              spacing: AxSpace.s2,
              children: [
                for (var i = 0; i < kReviewStars; i++)
                  AxIcon(
                    AxIcons.starFill,
                    size: _starSize,
                    color: AxColors.brandMid,
                  ),
              ],
            ),
            Text(
              kReviewQuote,
              style: AxType.text(
                AxType.caption,
                color: AxColors.textBody,
                height: 1.5,
              ),
            ),
            Text(
              kReviewAuthor,
              style: AxType.text(
                AxType.micro,
                color: AxColors.textFaint,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

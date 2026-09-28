import 'package:flutter/material.dart';

import '../../../../design/icons/ax_icon.dart' hide AxArt;
import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_gradients.dart';
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_avatar.dart';
import '../../../../design/widgets/ax_card.dart';
import '../../../../design/widgets/ax_plan_card.dart';
import '../../../../design/widgets/ax_sidebar.dart';
import '../../../../design/widgets/ax_toggle.dart';
import '../../shell/biz_shell.dart';
import '../data/fixtures.dart';

/// `/biz/settings` — Biz_Settings: profile, team, urgent/mobile service
/// switches, payout account, commission plan and notifications, inside
/// [BizShell]. Each toggle-holding card owns its switch state (initial values
/// from the fixtures, as drawn in the artboard).
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.canvas,
      body: BizShell(
        current: AxSidebarItem.settings,
        child: const _SettingsContent(),
      ),
    );
  }
}

class _SettingsContent extends StatelessWidget {
  const _SettingsContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AxSpace.s16,
      children: [
        Text(
          kPageTitle,
          style: AxType.head(
            AxType.h4,
            weight: FontWeight.w800,
            color: AxColors.brand,
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AxSpace.s18,
            children: const [
              Expanded(child: _ProfileColumn()),
              Expanded(child: _PlansColumn()),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileColumn extends StatelessWidget {
  const _ProfileColumn();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AxSpace.s16,
      children: [
        _BusinessProfileCard(),
        _TeamCard(),
        _UrgentBookingsCard(),
        _MobileServiceCard(),
        _PayoutAccountCard(),
      ],
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AxType.head(
        AxType.body14,
        weight: FontWeight.w700,
        color: AxColors.brand,
      ),
    );
  }
}

class _BusinessProfileCard extends StatelessWidget {
  const _BusinessProfileCard();

  /// Biz_Settings.dc.html line 67: profile avatar `width:44px`.
  static const double _avatarSize = 44;

  /// Biz_Settings.dc.html line 67: art `<svg width="52%" height="52%">`.
  static const double _avatarArtScale = 0.52;

  @override
  Widget build(BuildContext context) {
    return AxCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AxSpace.s12,
        children: [
          const _CardTitle(kBusinessProfileTitle),
          Row(
            spacing: AxSpace.s12,
            children: [
              AxAvatar(
                size: _avatarSize,
                radius: AxRadius.card,
                gradient: AxGradients.avatarBlush,
                art: AxArt.artMakeup,
                artScale: _avatarArtScale,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      kBusinessName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AxType.text(
                        AxType.label,
                        weight: FontWeight.w700,
                        color: AxColors.brand,
                      ),
                    ),
                    Text(
                      kBusinessLocation,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AxType.text(
                        AxType.captionSm,
                        color: AxColors.textSubtle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: AxSpace.s2),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    kPortfolioSummary,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AxType.text(
                      AxType.captionSm,
                      color: AxColors.textMuted,
                    ),
                  ),
                ),
                Text(
                  kManagePortfolio,
                  style: AxType.text(
                    AxType.caption,
                    weight: FontWeight.w700,
                    color: AxColors.brandMid,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TeamCard extends StatelessWidget {
  const _TeamCard();

  @override
  Widget build(BuildContext context) {
    return AxCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AxSpace.s12,
        children: [
          const _CardTitle(kTeamTitle),
          for (var i = 0; i < kTeam.length; i++)
            _TeamRow(member: kTeam[i], showDivider: i < kTeam.length - 1),
        ],
      ),
    );
  }
}

class _TeamRow extends StatelessWidget {
  const _TeamRow({required this.member, required this.showDivider});

  /// Biz_Settings.dc.html line 82: team avatar `width:28px`.
  static const double _avatarSize = 28;

  /// Biz_Settings.dc.html line 82: `border-radius:50%` on 28px = half size.
  static const double _avatarRadius = _avatarSize / 2;

  /// Biz_Settings.dc.html line 82: `<svg width="55%" height="55%">` of 28px.
  static const double _personIconSize = _avatarSize * 0.55;

  /// Biz_Settings.dc.html line 82: person svg `fill="#FFFFFF" opacity="0.92"`.
  static const double _personIconOpacity = 0.92;

  final TeamMember member;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AxSpace.s6),
      decoration: showDivider
          ? const BoxDecoration(
              border: Border(bottom: BorderSide(color: AxColors.panelWarm)),
            )
          : null,
      child: Row(
        spacing: AxSpace.s10,
        children: [
          AxAvatar(
            size: _avatarSize,
            radius: _avatarRadius,
            gradient: member.gradient,
            child: AxIcon(
              AxIcons.personFill,
              size: _personIconSize,
              color: AxColors.surface.withValues(alpha: _personIconOpacity),
            ),
          ),
          Expanded(
            child: Text(
              member.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AxType.text(
                AxType.labelSm,
                weight: FontWeight.w600,
                color: AxColors.brand,
              ),
            ),
          ),
          Text(
            member.role,
            style: AxType.text(AxType.micro, color: AxColors.textSubtle),
          ),
        ],
      ),
    );
  }
}

class _UrgentBookingsCard extends StatefulWidget {
  const _UrgentBookingsCard();

  @override
  State<_UrgentBookingsCard> createState() => _UrgentBookingsCardState();
}

class _UrgentBookingsCardState extends State<_UrgentBookingsCard> {
  bool _enabled = kUrgentEnabled;

  @override
  Widget build(BuildContext context) {
    return AxCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AxSpace.s12,
        children: [
          _ToggleCardHeader(
            icon: AxIcons.boltFill,
            iconColor: AxColors.urgentTo,
            title: kUrgentTitle,
            value: _enabled,
            onChanged: (value) => setState(() => _enabled = value),
          ),
          Text(
            kUrgentDescription,
            style: AxType.text(
              AxType.captionSm,
              color: AxColors.textMuted,
              height: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AxSpace.s2),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: AxSpace.s8,
                children: [
                  for (final rate in kUrgentRates)
                    Expanded(child: _RateTile(rate: rate)),
                ],
              ),
            ),
          ),
          Text(
            kUrgentFootnote,
            style: AxType.text(AxType.microSm, color: AxColors.textFaint),
          ),
        ],
      ),
    );
  }
}

class _RateTile extends StatelessWidget {
  const _RateTile({required this.rate});

  final RushRate rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s6,
        vertical: AxSpace.s8,
      ),
      decoration: const BoxDecoration(
        color: AxColors.surfaceWarm,
        borderRadius: BorderRadius.all(Radius.circular(AxRadius.xs)),
      ),
      child: Column(
        children: [
          Text(
            rate.label,
            style: AxType.text(AxType.nano, color: AxColors.textSubtle),
          ),
          Text(
            rate.value,
            style: AxType.text(
              AxType.caption,
              weight: FontWeight.w800,
              color: AxColors.brand,
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileServiceCard extends StatefulWidget {
  const _MobileServiceCard();

  @override
  State<_MobileServiceCard> createState() => _MobileServiceCardState();
}

class _MobileServiceCardState extends State<_MobileServiceCard> {
  bool _enabled = kMobileEnabled;

  @override
  Widget build(BuildContext context) {
    return AxCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AxSpace.s12,
        children: [
          _ToggleCardHeader(
            icon: AxIcons.mapPin23,
            iconColor: AxColors.escrow,
            title: kMobileTitle,
            value: _enabled,
            onChanged: (value) => setState(() => _enabled = value),
          ),
          Text(
            kMobileDescription,
            style: AxType.text(
              AxType.captionSm,
              color: AxColors.textMuted,
              height: 1.5,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AxSpace.s10,
              vertical: AxSpace.s8,
            ),
            decoration: const BoxDecoration(
              color: AxColors.surfaceWarm,
              borderRadius: BorderRadius.all(Radius.circular(AxRadius.xs)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    kTravelFeeLabel,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AxType.text(
                      AxType.captionSm,
                      color: AxColors.textBody,
                    ),
                  ),
                ),
                Text(
                  kTravelFeeValue,
                  style: AxType.text(
                    AxType.caption,
                    weight: FontWeight.w800,
                    color: AxColors.brand,
                  ),
                ),
              ],
            ),
          ),
          Text(
            kMobileFootnote,
            style: AxType.text(AxType.microSm, color: AxColors.textFaint),
          ),
        ],
      ),
    );
  }
}

class _PayoutAccountCard extends StatelessWidget {
  const _PayoutAccountCard();

  @override
  Widget build(BuildContext context) {
    return AxCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AxSpace.s12,
        children: [
          const _CardTitle(kPayoutTitle),
          Row(
            children: [
              Expanded(
                child: Text(
                  kPayoutAccount,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AxType.text(
                    AxType.labelSm,
                    color: AxColors.textBody,
                  ),
                ),
              ),
              Text(
                kPayoutChange,
                style: AxType.text(
                  AxType.caption,
                  weight: FontWeight.w700,
                  color: AxColors.brandMid,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PlansColumn extends StatelessWidget {
  const _PlansColumn();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AxSpace.s16,
      children: [
        _CommissionPlanCard(),
        Expanded(child: _NotificationsCard()),
      ],
    );
  }
}

class _CommissionPlanCard extends StatelessWidget {
  const _CommissionPlanCard();

  @override
  Widget build(BuildContext context) {
    return AxCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AxSpace.s12,
        children: [
          const _CardTitle(kCommissionTitle),
          const IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: AxSpace.s10,
              children: [
                Expanded(
                  child: AxPlanCard(
                    eyebrow: kCurrentPlanEyebrow,
                    value: kCurrentPlanValue,
                    description: kCurrentPlanDescription,
                    selected: true,
                  ),
                ),
                Expanded(
                  child: AxPlanCard(
                    eyebrow: kAvailablePlanEyebrow,
                    value: kAvailablePlanValue,
                    description: kAvailablePlanDescription,
                  ),
                ),
              ],
            ),
          ),
          Text(
            kCommissionFootnote,
            style: AxType.text(
              AxType.micro,
              color: AxColors.textFaint,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationsCard extends StatefulWidget {
  const _NotificationsCard();

  @override
  State<_NotificationsCard> createState() => _NotificationsCardState();
}

class _NotificationsCardState extends State<_NotificationsCard> {
  bool _bookingRequests = kBookingRequestsEnabled;
  bool _payoutConfirmations = kPayoutConfirmationsEnabled;
  bool _marketingTips = kMarketingTipsEnabled;

  @override
  Widget build(BuildContext context) {
    return AxCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AxSpace.s12,
        children: [
          const _CardTitle(kNotificationsTitle),
          _ToggleRow(
            label: kNotifyBookings,
            value: _bookingRequests,
            onChanged: (value) => setState(() => _bookingRequests = value),
          ),
          _ToggleRow(
            label: kNotifyPayouts,
            value: _payoutConfirmations,
            onChanged: (value) => setState(() => _payoutConfirmations = value),
          ),
          _ToggleRow(
            label: kNotifyMarketing,
            value: _marketingTips,
            onChanged: (value) => setState(() => _marketingTips = value),
          ),
        ],
      ),
    );
  }
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AxSpace.s5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AxType.text(AxType.labelSm, color: AxColors.textPrimary),
            ),
          ),
          AxToggle(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _ToggleCardHeader extends StatelessWidget {
  const _ToggleCardHeader({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  /// Biz_Settings.dc.html lines 96/113: `<svg width="15" height="15" …>`.
  static const double _iconSize = 15;

  final String icon;
  final Color iconColor;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            spacing: AxSpace.s7,
            children: [
              AxIcon(icon, size: _iconSize, color: iconColor),
              Flexible(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AxType.head(
                    AxType.body14,
                    weight: FontWeight.w700,
                    color: AxColors.brand,
                  ),
                ),
              ),
            ],
          ),
        ),
        AxToggle(value: value, onChanged: onChanged),
      ],
    );
  }
}

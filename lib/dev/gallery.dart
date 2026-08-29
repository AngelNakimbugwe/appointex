import 'package:flutter/material.dart';

import '../design/tokens/ax_colors.dart';
import '../design/tokens/ax_gradients.dart';
import '../design/tokens/ax_radius.dart';
import '../design/tokens/ax_space.dart';
import '../design/tokens/ax_type.dart';
import '../design/widgets/ax_avatar.dart';
import '../design/widgets/ax_bottom_nav.dart';
import '../design/widgets/ax_card.dart';
import '../design/widgets/ax_chip.dart';
import '../design/widgets/ax_data_table.dart';
import '../design/widgets/ax_field.dart';
import '../design/widgets/ax_mobile_header.dart';
import '../design/widgets/ax_pill.dart';
import '../design/widgets/ax_plan_card.dart';
import '../design/widgets/ax_primary_button.dart';
import '../design/widgets/ax_provider_row.dart';
import '../design/widgets/ax_rating.dart';
import '../design/widgets/ax_sidebar.dart';
import '../design/widgets/ax_stat_tile.dart';
import '../design/widgets/ax_tier_card.dart';
import '../design/widgets/ax_toggle.dart';
import '../design/widgets/ax_verified_badge.dart';
import '../design/icons/ax_icons.dart';

/// Gallery of every Tier 1 + Tier 2 component with its exact artboard values.
/// Reachable at `/dev/gallery` — a living spec sheet for review.
class ComponentGallery extends StatelessWidget {
  const ComponentGallery({super.key});

  @override
  Widget build(BuildContext context) {
    Widget section(String title, List<Widget> children) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AxSpace.s8,
          children: [
            Text(
              title,
              style: AxType.head(AxType.label, color: AxColors.brand),
            ),
            ...children,
            const SizedBox(height: AxSpace.s24),
          ],
        );

    return Scaffold(
      backgroundColor: AxColors.canvas,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AxSpace.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              section('AxMobileHeader', [
                AxMobileHeader('Search', onBack: () {}),
                AxMobileHeader.home(
                  greeting: 'Good morning',
                  title: 'Where to today?',
                ),
              ]),
              section('AxBottomNav', [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AxColors.border),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AxRadius.md),
                    ),
                  ),
                  child: AxBottomNav(
                    current: AxNavItem.home,
                    onTap: (_) {},
                  ),
                ),
              ]),
              section('AxSidebar', [
                Container(
                  height: 420,
                  decoration: BoxDecoration(
                    border: Border.all(color: AxColors.border),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AxRadius.md),
                    ),
                  ),
                  child: AxSidebar(
                    current: AxSidebarItem.dashboard,
                    onTap: (_) {},
                  ),
                ),
              ]),
              section('AxAvatar', [
                Row(
                  spacing: AxSpace.s8,
                  children: const [
                    AxAvatar(
                      size: 56,
                      radius: 10,
                      art: AxArt.artBraids,
                      gradient: AxGradients.avatarPale,
                    ),
                    AxAvatar(
                      size: 44,
                      radius: 10,
                      art: AxArt.artMakeup,
                      gradient: AxGradients.avatarBlush,
                    ),
                    AxAvatar(
                      size: 36,
                      radius: 8,
                      art: AxArt.artNails,
                      gradient: AxGradients.avatarSand,
                    ),
                    AxAvatar(
                      size: 30,
                      radius: 8,
                      art: AxArt.artSpa,
                      gradient: AxGradients.avatarRose,
                    ),
                  ],
                ),
              ]),
              section('AxVerifiedBadge', [
                Row(
                  spacing: AxSpace.s5,
                  children: [
                    Text(
                      'Grace Nabbosa Braids',
                      style: AxType.text(
                        AxType.bodySm,
                        weight: FontWeight.w700,
                        color: AxColors.brand,
                      ),
                    ),
                    const AxVerifiedBadge(),
                  ],
                ),
              ]),
              section('AxRating', [
                const AxRating(value: '4.9 · from UGX 25,000'),
              ]),
              section('AxProviderRow', [
                AxProviderRow(
                  name: 'Grace Nabbosa Braids',
                  subtitle: 'Hair · Ntinda',
                  rating: '4.9 · from UGX 25,000',
                  avatarArt: AxArt.artBraids,
                  avatarGradient: AxGradients.avatarPale,
                ),
                const SizedBox(height: AxSpace.s8),
                AxProviderRow.compact(
                  name: 'Patricia Glam Studio',
                  subtitle: 'Makeup · Kololo',
                  avatarArt: AxArt.artNails,
                  avatarGradient: AxGradients.avatarSand,
                ),
                const SizedBox(height: AxSpace.s8),
                AxProviderRow.featured(
                  name: 'Faces by Immaculate',
                  subtitle: 'Makeup · Ntinda',
                  rating: '4.8 · from UGX 40,000',
                  avatarArt: AxArt.artMakeup,
                  avatarGradient: AxGradients.avatarPeach,
                ),
                const SizedBox(height: AxSpace.s8),
                AxProviderRow.urgent(
                  name: 'Patricia Glam Studio',
                  subtitle: '5.0 · Kololo · Everyday glam',
                  slotTime: 'Free at 3:15pm today',
                  feeSummary: 'UGX 60,000 + 25% rush → UGX 75,000',
                  avatarArt: AxArt.artNails,
                  avatarGradient: AxGradients.avatarSand,
                ),
              ]),
              section('AxCard', [
                AxCard(
                  child: Text(
                    'Card content',
                    style: AxType.text(AxType.body, color: AxColors.textPrimary),
                  ),
                ),
              ]),
              section('AxChip', [
                Wrap(
                  spacing: AxSpace.s8,
                  runSpacing: AxSpace.s8,
                  children: [
                    AxChip(label: 'Hair', selected: false, onTap: () {}),
                    AxChip(label: 'Hair', selected: true, onTap: () {}),
                    AxChip(label: 'Wedding', selected: false, type: true),
                  ],
                ),
              ]),
              section('AxField', [
                const AxField(hint: 'Full name'),
                const SizedBox(height: AxSpace.s8),
                const AxField(hint: 'Business name', desktop: true),
              ]),
              section('AxPrimaryButton', [
                for (final style in AxButtonStyle.values)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AxSpace.s8),
                    child: AxPrimaryButton(
                      label: 'Continue',
                      style: style,
                      onPressed: () {},
                    ),
                  ),
              ]),
              section('AxStatTile', [
                Row(
                  spacing: AxSpace.s16,
                  children: const [
                    Expanded(
                      child: AxStatTile(
                        label: "Today's bookings",
                        value: '6',
                      ),
                    ),
                    Expanded(
                      child: AxStatTile(
                        label: 'Net payout',
                        value: 'UGX 2,948,400',
                        accent: null,
                      ),
                    ),
                  ],
                ),
              ]),
              section('AxToggle', [
                Row(
                  spacing: AxSpace.s8,
                  children: [
                    AxToggle(value: true, onChanged: (_) {}),
                    AxToggle(value: false, onChanged: (_) {}),
                  ],
                ),
              ]),
              section('AxPill', [
                const Row(
                  spacing: AxSpace.s8,
                  children: [
                    AxPill(label: 'Released'),
                    AxPill(
                      label: 'Held',
                      background: AxColors.pendingBg,
                      foreground: AxColors.pending,
                    ),
                  ],
                ),
              ]),
              section('AxDataTable', [
                AxDataTable(
                  columns: const ['Client', 'Service', 'Date', 'Status'],
                  flexes: const [2, 2, 2, 1],
                  rows: const [
                    ['Amara Diallo', 'Bridal makeup', 'Mar 14', 'Confirmed'],
                    ['Jade Chen', 'Hair styling', 'Mar 15', 'Pending'],
                  ],
                ),
              ]),
              section('AxTierCard', [
                Row(
                  spacing: AxSpace.s20,
                  children: const [
                    Expanded(
                      child: AxTierCard(
                        label: '1 WEEK',
                        price: 'UGX 30,000',
                        child: _ChooseButton(),
                      ),
                    ),
                    Expanded(
                      child: AxTierCard(
                        label: '1 MONTH · SAVE 17%',
                        price: 'UGX 100,000',
                        selected: true,
                        child: _ChooseGradientButton(),
                      ),
                    ),
                  ],
                ),
              ]),
              section('AxPlanCard', [
                Row(
                  spacing: AxSpace.s10,
                  children: const [
                    Expanded(
                      child: AxPlanCard(
                        eyebrow: 'CURRENT PLAN',
                        value: '9%',
                        description: 'Standard rate, no conditions',
                        selected: true,
                      ),
                    ),
                    Expanded(
                      child: AxPlanCard(
                        eyebrow: 'AVAILABLE',
                        value: '5%',
                        description:
                            'Reduced rate for providers who keep bookings and payments on Appointex',
                      ),
                    ),
                  ],
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

/// The tier card's trailing action (Biz_FeaturedSpots): 32 px stadium with a
/// `1.5px solid #6B3F3A` border, 11.5/700 brand text.
class _ChooseButton extends StatelessWidget {
  const _ChooseButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      alignment: Alignment.center,
      decoration: const ShapeDecoration(
        color: AxColors.surface,
        shape: StadiumBorder(
          side: BorderSide(color: AxColors.brand, width: 1.5),
        ),
      ),
      child: Text(
        'Choose',
        style: AxType.text(AxType.captionSm,
            weight: FontWeight.w700, color: AxColors.brand),
      ),
    );
  }
}

/// The highlighted tier's trailing action — the avatarPeach gradient stadium.
class _ChooseGradientButton extends StatelessWidget {
  const _ChooseGradientButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      alignment: Alignment.center,
      decoration: const ShapeDecoration(
        gradient: AxGradients.avatarPeach,
        shape: StadiumBorder(),
      ),
      child: Text(
        'Choose',
        style: AxType.text(AxType.captionSm,
            weight: FontWeight.w700, color: AxColors.brand),
      ),
    );
  }
}

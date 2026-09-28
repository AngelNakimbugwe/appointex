import 'package:flutter/material.dart';

import '../../../../design/icons/ax_icon.dart';
import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_avatar.dart';
import '../../../../design/widgets/ax_primary_button.dart';
import '../../../../design/widgets/ax_sidebar.dart';
import '../../shell/biz_shell.dart';
import '../data/fixtures.dart';

/// `/biz/featured` — Biz_FeaturedSpots: the current top-3 ranking beside the
/// advertising purchase panel, inside [BizShell].
class FeaturedSpotsScreen extends StatelessWidget {
  const FeaturedSpotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.canvas,
      body: BizShell(
        current: AxSidebarItem.featured,
        child: const _FeaturedSpotsContent(),
      ),
    );
  }
}

class _FeaturedSpotsContent extends StatelessWidget {
  const _FeaturedSpotsContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AxSpace.s16,
      children: [
        const _PageHeader(),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AxSpace.s20,
            children: const [
              Expanded(flex: 13, child: _FeaturedColumn()),
              Expanded(flex: 10, child: _AdvertiseColumn()),
            ],
          ),
        ),
      ],
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s3,
      children: [
        Text(
          kPageTitle,
          style: AxType.head(
            AxType.h4,
            weight: FontWeight.w800,
            color: AxColors.brand,
          ),
        ),
        Text(
          kPageSubtitle,
          style: AxType.text(AxType.labelSm, color: AxColors.textSubtle),
        ),
      ],
    );
  }
}

class _FeaturedColumn extends StatelessWidget {
  const _FeaturedColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AxSpace.s16,
      children: const [_CurrentSpotsCard(), _FeaturedBanner()],
    );
  }
}

class _CurrentSpotsCard extends StatelessWidget {
  const _CurrentSpotsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s18,
        vertical: AxSpace.s16,
      ),
      decoration: BoxDecoration(
        color: AxColors.surface,
        border: Border.all(color: AxColors.border),
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.tile)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AxSpace.s10,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  kCurrentTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AxType.head(
                    AxType.bodySm,
                    weight: FontWeight.w700,
                    color: AxColors.brand,
                  ),
                ),
              ),
              const _SpotsTakenPill(),
            ],
          ),
          for (var i = 0; i < kFeaturedSpots.length; i++)
            _FeaturedRow(
              spot: kFeaturedSpots[i],
              showDivider: i < kFeaturedSpots.length - 1,
            ),
        ],
      ),
    );
  }
}

class _SpotsTakenPill extends StatelessWidget {
  const _SpotsTakenPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s9,
        vertical: AxSpace.s3,
      ),
      decoration: const BoxDecoration(
        color: AxColors.pendingBg,
        borderRadius: BorderRadius.all(Radius.circular(AxRadius.sm)),
      ),
      child: Text(
        kSpotsTakenPill,
        style: AxType.text(
          AxType.micro,
          weight: FontWeight.w700,
          color: AxColors.pending,
        ),
      ),
    );
  }
}

class _FeaturedRow extends StatelessWidget {
  const _FeaturedRow({required this.spot, required this.showDivider});

  /// Biz_FeaturedSpots.dc.html line 73: `.row` rank circle `width:22px`.
  static const double _rankSize = 22;

  /// Biz_FeaturedSpots.dc.html line 74: provider avatar `width:30px`.
  static const double _avatarSize = 30;

  /// Biz_FeaturedSpots.dc.html line 74: art `<svg width="52%" height="52%">`.
  static const double _avatarArtScale = 0.52;

  final FeaturedSpot spot;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AxSpace.s10),
      decoration: showDivider
          ? const BoxDecoration(
              border: Border(bottom: BorderSide(color: AxColors.panelWarm)),
            )
          : null,
      child: Row(
        spacing: AxSpace.s12,
        children: [
          Container(
            width: _rankSize,
            height: _rankSize,
            decoration: BoxDecoration(shape: BoxShape.circle, color: spot.rankColor),
            alignment: Alignment.center,
            child: Text(
              spot.rank,
              style: AxType.head(
                AxType.micro,
                weight: FontWeight.w800,
                color: AxColors.brand,
              ),
            ),
          ),
          AxAvatar(
            size: _avatarSize,
            radius: AxRadius.sm,
            art: spot.art,
            gradient: spot.gradient,
            artScale: _avatarArtScale,
          ),
          Expanded(
            child: Text(
              spot.name,
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
            spot.daysLeft,
            style: AxType.text(
              AxType.micro,
              weight: spot.daysLeftHighlight ? FontWeight.w700 : FontWeight.w400,
              color: spot.daysLeftHighlight
                  ? AxColors.verified
                  : AxColors.textFaint,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturedBanner extends StatelessWidget {
  const _FeaturedBanner();

  /// Biz_FeaturedSpots.dc.html line 93: `<svg width="22" height="22" …>`.
  static const double _starSize = 22;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s18,
        vertical: AxSpace.s16,
      ),
      decoration: const BoxDecoration(
        color: AxColors.brand,
        borderRadius: BorderRadius.all(Radius.circular(AxRadius.tile)),
      ),
      child: Row(
        spacing: AxSpace.s14,
        children: [
          AxIcon(AxIcons.starOutline, size: _starSize, color: AxColors.peach),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AxSpace.s2,
              children: [
                Text(
                  kBannerTitle,
                  style: AxType.text(
                    AxType.label,
                    weight: FontWeight.w700,
                    color: AxColors.surface,
                  ),
                ),
                Text(
                  kBannerBody,
                  style: AxType.text(
                    AxType.captionSm,
                    color: AxColors.roseMuted,
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

class _AdvertiseColumn extends StatelessWidget {
  const _AdvertiseColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AxSpace.s9,
      children: [
        Text(
          kAdvertiseTitle,
          style: AxType.head(
            AxType.bodySm,
            weight: FontWeight.w700,
            color: AxColors.brand,
          ),
        ),
        const _Eyebrow(kPlacementEyebrow),
        const _TierCard(
          label: kWeekLabel,
          price: kWeekPrice,
          cta: kChoose,
        ),
        const _TierCard(
          label: kMonthLabel,
          price: kMonthPrice,
          cta: kChoose,
          selected: true,
        ),
        const Padding(
          padding: EdgeInsets.only(top: AxSpace.s2),
          child: _Eyebrow(kBannerAdEyebrow),
        ),
        const _CarouselCard(),
        Text(
          kPaidDisclosure,
          style: AxType.text(
            AxType.nano,
            color: AxColors.textFaint,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _Eyebrow extends StatelessWidget {
  const _Eyebrow(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: AxType.text(
        AxType.microSm,
        weight: FontWeight.w700,
        color: AxColors.textFaint,
        letterSpacingEm: 0.03,
      ),
    );
  }
}

/// `.tier` with the artboard's instance overrides `padding:12px 16px; gap:5px`
/// (Biz_FeaturedSpots.dc.html lines 105/110). The shared `AxTierCard` carries
/// the class defaults (`16 18` / gap 8), so this stays local.
class _TierCard extends StatelessWidget {
  const _TierCard({
    required this.label,
    required this.price,
    required this.cta,
    this.selected = false,
  });

  /// Biz_FeaturedSpots.dc.html line 108: CTA `height:32px`.
  static const double _ctaHeight = 32;

  final String label;
  final String price;
  final String cta;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s16,
        vertical: AxSpace.s12,
      ),
      decoration: BoxDecoration(
        color: selected ? AxColors.sand : null,
        border: Border.all(color: selected ? AxColors.salmon : AxColors.border),
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.tile)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AxSpace.s5,
        children: [
          Text(
            label.toUpperCase(),
            style: AxType.text(
              AxType.microSm,
              weight: FontWeight.w700,
              color: selected ? AxColors.brandMid : AxColors.textFaint,
              letterSpacingEm: 0.04,
            ),
          ),
          Text(
            price,
            style: AxType.head(
              AxType.titleLg,
              weight: FontWeight.w800,
              color: AxColors.brand,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AxSpace.s2),
            child: AxPrimaryButton(
              label: cta,
              onPressed: () {},
              height: _ctaHeight,
              labelSize: AxType.captionSm,
              style: selected ? AxButtonStyle.gradient : AxButtonStyle.outline,
            ),
          ),
        ],
      ),
    );
  }
}

class _CarouselCard extends StatelessWidget {
  const _CarouselCard();

  /// Biz_FeaturedSpots.dc.html line 123: CTA `height:32px`.
  static const double _ctaHeight = 32;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s16,
        vertical: AxSpace.s12,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AxColors.border),
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.tile)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AxSpace.s5,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  kCarouselTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AxType.head(
                    AxType.labelSm,
                    weight: FontWeight.w700,
                    color: AxColors.brand,
                  ),
                ),
              ),
              Text(
                kCarouselPrice,
                style: AxType.text(
                  AxType.micro,
                  weight: FontWeight.w700,
                  color: AxColors.brand,
                ),
              ),
            ],
          ),
          Text(
            kCarouselDescription,
            style: AxType.text(
              AxType.microSm,
              color: AxColors.textMuted,
              height: 1.4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AxSpace.s2),
            child: AxPrimaryButton(
              label: kGetASlot,
              onPressed: () {},
              height: _ctaHeight,
              labelSize: AxType.captionSm,
              style: AxButtonStyle.outline,
            ),
          ),
        ],
      ),
    );
  }
}

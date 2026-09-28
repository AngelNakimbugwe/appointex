import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes.dart';
import '../../../../design/icons/ax_icon.dart';
import '../../../../design/icons/ax_icons.dart' show AxIcons;
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_gradients.dart';
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_verified_badge.dart';
import '../data/fixtures.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({
    super.key,
    this.providerId = '1',
    this.profile = kProviderProfile,
  });

  final String providerId;
  final ProviderProfile profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            _HeroBar(
              onBack: () => context.canPop()
                  ? context.pop()
                  : context.go(AxRoutes.home),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _IdentityBlock(profile: profile),
                    _PortfolioBlock(profile: profile),
                    _ProfileTabs(tabs: profile.tabs, activeTab: profile.activeTab),
                    _ServiceList(services: profile.services),
                  ],
                ),
              ),
            ),
            _FooterBar(
              profile: profile,
              onContinue: () => context.go(
                AxRoutes.book.replaceFirst(':id', providerId),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroBar extends StatelessWidget {
  const _HeroBar({required this.onBack});

  static const double _height = 170; // Client_Provider.dc.html:18

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: _height,
      decoration: const BoxDecoration(gradient: AxGradients.avatarPeach),
      child: Stack(
        children: [
          Positioned(
            top: AxSpace.s16,
            left: AxSpace.s16,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onBack,
              child: Container(
                width: AxSpace.s32,
                height: AxSpace.s32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AxColors.surface.withValues(alpha: 0.9),
                ),
                child: const AxIcon(
                  AxIcons.chevronLeft24,
                  size: 17,
                  color: AxColors.brand,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IdentityBlock extends StatelessWidget {
  const _IdentityBlock({required this.profile});

  final ProviderProfile profile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AxSpace.s18, AxSpace.s16, AxSpace.s18, AxSpace.s12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: AxSpace.s6,
            children: [
              Flexible(
                child: Text(
                  profile.name,
                  style: AxType.head(AxType.h5, weight: FontWeight.w800, color: AxColors.brand),
                ),
              ),
              const AxVerifiedBadge(size: 15),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: AxSpace.s5),
            child: Row(
              spacing: AxSpace.s6,
              children: [
                const AxIcon(AxIcons.starFill, size: 13, color: AxColors.brandMid),
                Flexible(
                  child: Text(
                    profile.ratingLine,
                    style: AxType.text(AxType.labelSm, color: AxColors.textBody),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AxSpace.s8),
            child: Row(
              spacing: AxSpace.s5,
              children: [
                const AxIcon(AxIcons.shield22, size: 12, color: AxColors.verified),
                Flexible(
                  child: Text(
                    profile.verifiedLine,
                    style: AxType.text(AxType.micro, weight: FontWeight.w600, color: AxColors.verified),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AxSpace.s6),
            child: Row(
              spacing: AxSpace.s5,
              children: [
                const AxIcon(AxIcons.mapPin, size: 12, color: AxColors.escrow),
                Flexible(
                  child: Text(
                    profile.mobileLine,
                    style: AxType.text(AxType.micro, weight: FontWeight.w600, color: AxColors.escrow),
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

class _PortfolioBlock extends StatelessWidget {
  const _PortfolioBlock({required this.profile});

  final ProviderProfile profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(AxSpace.s18, 0, AxSpace.s18, AxSpace.s14),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AxColors.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AxSpace.s8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                profile.portfolioTitle,
                style: AxType.head(AxType.labelSm, color: AxColors.brand),
              ),
              Text(
                profile.portfolioAction,
                style: AxType.text(AxType.micro, weight: FontWeight.w600, color: AxColors.brandMid),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: AxSpace.s8,
              children: [
                for (final tile in profile.portfolio) _PortfolioTile(tile: tile),
              ],
            ),
          ),
          Text(
            profile.portfolioCaption,
            style: AxType.text(AxType.microSm, color: AxColors.textFaint),
          ),
        ],
      ),
    );
  }
}

class _PortfolioTile extends StatelessWidget {
  const _PortfolioTile({required this.tile});

  static const double _size = 72; // Client_Provider.dc.html:49

  static const Color _videoOverlay = Color.fromARGB(191, 27, 42, 74); // Client_Provider.dc.html:53

  final ProviderPortfolioTile tile;

  @override
  Widget build(BuildContext context) {
    final thumb = Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        gradient: tile.gradient,
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.md)),
      ),
      child: tile.imageAsset == null
          ? Center(child: AxArt(tile.art, size: _size * tile.artScale))
          : ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(AxRadius.md)),
              child: Image.asset(
                tile.imageAsset!,
                width: _size,
                height: _size,
                fit: BoxFit.cover,
              ),
            ),
    );
    if (!tile.video) {
      return thumb;
    }
    return Stack(
      children: [
        thumb,
        Positioned.fill(
          child: Center(
            child: Container(
              width: AxSpace.s24,
              height: AxSpace.s24,
              alignment: Alignment.center,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: _videoOverlay),
              child: const AxIcon(AxIcons.playFill, size: 10, color: AxColors.surface),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileTabs extends StatelessWidget {
  const _ProfileTabs({required this.tabs, required this.activeTab});

  final List<String> tabs;
  final int activeTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(AxSpace.s18, AxSpace.s12, AxSpace.s18, 0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AxColors.border)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AxSpace.s22,
          children: [
            for (var i = 0; i < tabs.length; i++)
              _ProfileTab(label: tabs[i], active: i == activeTab),
          ],
        ),
      ),
    );
  }
}

class _ProfileTab extends StatelessWidget {
  const _ProfileTab({required this.label, required this.active});

  static const double _underlineHeight = 2.5; // Client_Provider.dc.html:65

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AxSpace.s8),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: active
                  ? AxType.text(AxType.label, weight: FontWeight.w700, color: AxColors.brand)
                  : AxType.text(AxType.label, weight: FontWeight.w600, color: AxColors.textFaint),
            ),
          ),
          if (active)
            Container(height: _underlineHeight, color: AxColors.salmon),
        ],
      ),
    );
  }
}

class _ServiceList extends StatelessWidget {
  const _ServiceList({required this.services});

  final List<ProviderService> services;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AxSpace.s18, AxSpace.s14, AxSpace.s18, AxSpace.s14),
      child: Column(
        spacing: AxSpace.s12,
        children: [
          for (var i = 0; i < services.length; i++)
            _ServiceRow(service: services[i], showDivider: i < services.length - 1),
        ],
      ),
    );
  }
}

class _ServiceRow extends StatelessWidget {
  const _ServiceRow({required this.service, required this.showDivider});

  final ProviderService service;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AxSpace.s12),
      decoration: BoxDecoration(
        border: showDivider ? const Border(bottom: BorderSide(color: AxColors.panelWarm)) : null,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AxSpace.s3,
              children: [
                Text(
                  service.name,
                  style: AxType.text(14, weight: FontWeight.w700, color: AxColors.brand),
                ),
                Text(
                  service.meta,
                  style: AxType.text(AxType.caption, color: AxColors.textSubtle),
                ),
              ],
            ),
          ),
          Container(
            width: AxSpace.s26,
            height: AxSpace.s26,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: service.selected ? AxColors.salmon : AxColors.brand,
            ),
            child: service.selected
                ? const AxIcon(AxIcons.checkBold, size: 13, color: AxColors.surface)
                : const AxIcon(AxIcons.plus, size: 13, color: AxColors.surface),
          ),
        ],
      ),
    );
  }
}

class _FooterBar extends StatelessWidget {
  const _FooterBar({required this.profile, required this.onContinue});

  final ProviderProfile profile;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(AxSpace.s18, AxSpace.s14, AxSpace.s18, AxSpace.s22),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AxColors.border)),
      ),
      child: Row(
        spacing: AxSpace.s14,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.selectedSummary,
                style: AxType.text(AxType.captionSm, color: AxColors.textSubtle),
              ),
              Text(
                profile.totalSummary,
                style: AxType.text(AxType.body, weight: FontWeight.w800, color: AxColors.brand),
              ),
            ],
          ),
          Expanded(
            child: _ContinueButton(label: profile.continueLabel, onPressed: onContinue),
          ),
        ],
      ),
    );
  }
}

class _ContinueButton extends StatelessWidget {
  const _ContinueButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: AxSpace.buttonHeight,
        alignment: Alignment.center,
        decoration: const ShapeDecoration(
          gradient: AxGradients.avatarPeach,
          shape: StadiumBorder(),
        ),
        child: Text(
          label,
          style: AxType.text(AxType.body, weight: FontWeight.w700, color: AxColors.brand),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../design/icons/ax_icon.dart';
import '../../../../../design/icons/ax_icons.dart';
import '../../../../../design/tokens/ax_colors.dart';
import '../../../../../design/tokens/ax_radius.dart';
import '../../../../../design/tokens/ax_space.dart';
import '../../../../../design/tokens/ax_type.dart';
import '../../../../../design/widgets/ax_avatar.dart';
import '../../data/fixtures.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key, required this.promos});

  final List<HomePromo> promos;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AxSpace.s8,
      children: [
        SizedBox(
          height: 112,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AxSpace.pageH),
            separatorBuilder: (_, __) => const SizedBox(width: AxSpace.s12),
            itemCount: promos.length + 1,
            itemBuilder: (context, index) {
              if (index < promos.length) {
                return _PromoCard(promo: promos[index]);
              }
              return const _PeekCard();
            },
          ),
        ),
        const _CarouselDots(),
      ],
    );
  }
}

class _PromoCard extends StatelessWidget {
  const _PromoCard({required this.promo});

  final HomePromo promo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 112,
      decoration: const BoxDecoration(
        color: AxColors.brand,
        borderRadius: BorderRadius.all(Radius.circular(AxRadius.lg)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.lg)),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            const Positioned(
              right: -50,
              top: -40,
              child: _DecorCircle(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AxSpace.s20),
              child: Center(
                child: Row(
                  spacing: AxSpace.s12,
                  children: [
                    AxAvatar(
                      size: 44,
                      radius: AxRadius.md,
                      art: promo.avatarArt,
                      gradient: promo.avatarGradient,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: AxSpace.s4,
                        children: [
                          Text(
                            promo.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AxType.head(
                              AxType.body,
                              weight: FontWeight.w800,
                              color: AxColors.surface,
                              height: 1.3,
                            ),
                          ),
                          Text(
                            promo.subtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AxType.text(
                              AxType.captionSm,
                              color: AxColors.peach,
                            ),
                          ),
                          Text(
                            promo.cta,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AxType.text(
                              AxType.micro,
                              weight: FontWeight.w700,
                              color: AxColors.peach,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: AxSpace.s10,
              right: AxSpace.s12,
              child: _AdBadge(label: promo.badge),
            ),
          ],
        ),
      ),
    );
  }
}

class _DecorCircle extends StatelessWidget {
  const _DecorCircle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AxColors.salmon.withValues(alpha: 0.15),
      ),
    );
  }
}

class _PeekCard extends StatelessWidget {
  const _PeekCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 112,
      decoration: BoxDecoration(
        color: AxColors.salmon.withValues(alpha: 0.35),
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.lg)),
      ),
    );
  }
}

class _CarouselDots extends StatelessWidget {
  const _CarouselDots();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: AxSpace.s6,
      children: [
        _Dot(active: true),
        _Dot(active: false),
        _Dot(active: false),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: active ? 16 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: active ? AxColors.brand : AxColors.dividerWarm,
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.dot)),
      ),
    );
  }
}

class _AdBadge extends StatelessWidget {
  const _AdBadge({required this.label});

  static const double _radius = 6; // border-radius:6px — Client_Home.dc.html line 44

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s7,
        vertical: AxSpace.s2,
      ),
      decoration: const BoxDecoration(
        color: AxColors.salmon,
        borderRadius: BorderRadius.all(Radius.circular(_radius)),
      ),
      child: Text(
        label,
        style: AxType.text(
          AxType.tiny,
          weight: FontWeight.w800,
          color: AxColors.brand,
          letterSpacingEm: 0.03,
        ),
      ),
    );
  }
}

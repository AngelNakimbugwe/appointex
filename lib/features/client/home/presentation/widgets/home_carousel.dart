import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../design/tokens/ax_colors.dart';
import '../../../../../design/tokens/ax_radius.dart';
import '../../../../../design/tokens/ax_space.dart';
import '../../../../../design/tokens/ax_type.dart';
import '../../../../../design/widgets/ax_avatar.dart';
import '../../data/fixtures.dart';

/// Full-width promo carousel. Auto-advances every 2 s (wrapping around),
/// swipes with page snapping, and the dots track and jump to pages.
///
/// Deviation from Client_Home.dc.html (lines 48-49): the artboard's card is
/// 300 px wide with a 40 px peek teaser; the product call is a full-width
/// card (viewport minus the 20 px page padding), with the next card's edge
/// peeking mid-swipe instead of the translucent sliver.
class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key, required this.promos});

  final List<HomePromo> promos;

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  final PageController _controller = PageController();
  Timer? _autoAdvance;
  int _page = 0;

  static const Duration _advanceInterval = Duration(seconds: 2);
  static const Duration _advanceDuration = Duration(milliseconds: 350);

  @override
  void initState() {
    super.initState();
    _scheduleAutoAdvance();
  }

  @override
  void dispose() {
    _autoAdvance?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _scheduleAutoAdvance() {
    _autoAdvance?.cancel();
    _autoAdvance = Timer(_advanceInterval, _advance);
  }

  void _advance() {
    if (!mounted || !_controller.hasClients) return;
    if (_controller.position.isScrollingNotifier.value) {
      _scheduleAutoAdvance();
      return;
    }
    final next = (_page + 1) % widget.promos.length;
    _controller.animateToPage(
      next,
      duration: _advanceDuration,
      curve: Curves.easeOutCubic,
    );
  }

  void _goToPage(int page) {
    _scheduleAutoAdvance();
    _controller.animateToPage(
      page,
      duration: _advanceDuration,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AxSpace.s8,
      children: [
        SizedBox(
          height: 112,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AxSpace.pageH),
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (page) {
                setState(() => _page = page);
                _scheduleAutoAdvance();
              },
              itemCount: widget.promos.length,
              itemBuilder: (context, index) =>
                  _PromoCard(promo: widget.promos[index]),
            ),
          ),
        ),
        _CarouselDots(
          pageCount: widget.promos.length,
          current: _page,
          onTap: _goToPage,
        ),
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
                      imageAsset: promo.imageAsset,
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

class _CarouselDots extends StatelessWidget {
  const _CarouselDots({
    required this.pageCount,
    required this.current,
    required this.onTap,
  });

  final int pageCount;
  final int current;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: AxSpace.s6,
      children: [
        for (var i = 0; i < pageCount; i++)
          _Dot(
            key: ValueKey('home-carousel-dot-$i'),
            active: i == current,
            onTap: i == current ? null : () => onTap(i),
          ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({super.key, required this.active, this.onTap});

  final bool active;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        width: active ? 16 : 6,
        height: 6,
        decoration: BoxDecoration(
          color: active ? AxColors.brand : AxColors.dividerWarm,
          borderRadius: const BorderRadius.all(Radius.circular(AxRadius.dot)),
        ),
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

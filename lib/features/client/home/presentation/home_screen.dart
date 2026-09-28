import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes.dart';
import '../../../../design/icons/ax_icon.dart';
import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_bottom_nav.dart';
import '../../../../design/widgets/ax_mobile_header.dart';
import '../data/fixtures.dart';
import 'widgets/featured_provider_row.dart';
import 'widgets/home_carousel.dart';
import 'widgets/home_category_grid.dart';
import 'widgets/home_urgent_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.now});

  /// Overridable for deterministic golden tests; defaults to the real time.
  final DateTime? now;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AxMobileHeader.home(
              greeting: homeGreeting(now),
              title: kHomeTitle,
              actions: [
                _LocationPill(location: kHomeLocation),
                const AxIcon(AxIcons.bell, size: 21, color: AxColors.brand),
              ],
            ),
            _SearchField(
              placeholder: kHomeSearchPlaceholder,
              onTap: () => context.go(AxRoutes.search),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: AxSpace.s22,
                  children: [
                    HomeCarousel(promos: kHomeCarouselPromos),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AxSpace.pageH,
                      ),
                      child: HomeCategoryGrid(
                        heading: kHomeCategoriesHeading,
                        categories: kHomeCategories,
                        eventLabel: kHomeEventTileLabel,
                        onEventTap: () => context.go(AxRoutes.event),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AxSpace.pageH,
                      ),
                      child: HomeUrgentBanner(
                        title: kHomeUrgentTitle,
                        subtitle: kHomeUrgentSubtitle,
                        onTap: () => context.go(AxRoutes.urgent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AxSpace.pageH,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: AxSpace.s10,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  kHomeFeaturedHeading,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AxType.head(
                                    AxType.body,
                                    weight: FontWeight.w700,
                                    color: AxColors.brand,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () => context.go(AxRoutes.search),
                                child: Text(
                                  kHomeSeeAll,
                                  style: AxType.text(
                                    AxType.caption,
                                    weight: FontWeight.w600,
                                    color: AxColors.brandMid,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          for (final provider in kHomeFeaturedProviders)
                            FeaturedProviderRow(
                              provider: provider,
                              onTap: () =>
                                  context.go('/provider/${provider.id}'),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MediaQuery.withClampedTextScaling(
        maxScaleFactor: 1.2,
        child: AxBottomNav(
          current: AxNavItem.home,
          onTap: (item) {
            switch (item) {
              case AxNavItem.home:
                context.go(AxRoutes.home);
              case AxNavItem.bookings:
                context.go(AxRoutes.bookings);
              case AxNavItem.chat:
                context.go(AxRoutes.chat);
              case AxNavItem.profile:
                context.go(AxRoutes.profile);
            }
          },
        ),
      ),
    );
  }
}

class _LocationPill extends StatelessWidget {
  const _LocationPill({required this.location});

  static const double _radius = 20; // border-radius:20px — Client_Home.dc.html line 26

  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s12,
        vertical: AxSpace.s7,
      ),
      decoration: BoxDecoration(
        color: AxColors.surfaceWarm,
        borderRadius: const BorderRadius.all(Radius.circular(_radius)),
      ),
      child: Row(
        spacing: AxSpace.s4,
        children: [
          Text(
            location,
            style: AxType.text(
              AxType.labelSm,
              weight: FontWeight.w600,
              color: AxColors.brand,
            ),
          ),
          const AxIcon(AxIcons.chevronDown, size: 12, color: AxColors.brand),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.placeholder, this.onTap});

  final String placeholder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AxSpace.pageH,
          0,
          AxSpace.pageH,
          AxSpace.s18,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AxSpace.s14,
            vertical: AxSpace.s12,
          ),
          decoration: const BoxDecoration(
            color: AxColors.surfaceWarm,
            borderRadius: BorderRadius.all(Radius.circular(AxRadius.card)),
          ),
          child: Row(
            spacing: AxSpace.s10,
            children: [
              const AxIcon(
                AxIcons.search20,
                size: 17,
                color: AxColors.textSubtle,
              ),
              Expanded(
                child: Text(
                  placeholder,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AxType.text(
                    AxType.bodySm,
                    color: AxColors.textFaint,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

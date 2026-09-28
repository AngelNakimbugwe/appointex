import 'package:flutter/material.dart';

import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_gradients.dart';

class HomePromo {
  const HomePromo({
    required this.badge,
    required this.title,
    required this.subtitle,
    required this.cta,
    required this.avatarArt,
    required this.avatarGradient,
    this.imageAsset,
  });

  final String badge;
  final String title;
  final String subtitle;
  final String cta;
  final String avatarArt;
  final Gradient avatarGradient;

  /// A real photo (`assets/images/*`) shown instead of [avatarArt] when set.
  final String? imageAsset;
}

class HomeCategory {
  const HomeCategory({
    required this.label,
    required this.icon,
    required this.background,
    required this.iconColor,
    required this.labelColor,
  });

  final String label;
  final String icon;
  final Color background;
  final Color iconColor;
  final Color labelColor;
}

class HomeProvider {
  const HomeProvider({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.rating,
    this.avatarArt,
    this.avatarGradient,
    this.avatarArtScale = 0.55,
    this.imageAsset,
  });

  final String id;
  final String name;
  final String subtitle;
  final String rating;
  final String? avatarArt;
  final Gradient? avatarGradient;
  final double avatarArtScale;

  /// A real photo (`assets/images/*`) shown instead of [avatarArt] when set.
  final String? imageAsset;
}

/// Time-of-day greeting — morning/afternoon/evening cutoffs at 12:00/17:00.
String homeGreeting([DateTime? now]) {
  final hour = (now ?? DateTime.now()).hour;
  if (hour < 12) return 'Good morning';
  if (hour < 17) return 'Good afternoon';
  return 'Good evening';
}
const kHomeTitle = 'Where to today?';
const kHomeLocation = 'Kampala';
const kHomeSearchPlaceholder = 'Search stylists, makeup artists, spas…';

const HomePromo _kGracePromo = HomePromo(
  badge: 'AD',
  title: 'Grace Nabbosa Braids',
  subtitle: '20% off box braids this week',
  cta: 'Book now →',
  avatarArt: AxArt.artBraids,
  avatarGradient: AxGradients.avatarBlush,
  imageAsset: 'assets/images/hair_braids_1.jpg',
);

const HomePromo _kPatriciaPromo = HomePromo(
  badge: 'AD',
  title: 'Patricia Glam Studio',
  subtitle: 'New client special: 15% off full glam',
  cta: 'Book now →',
  avatarArt: AxArt.artMakeup,
  avatarGradient: AxGradients.avatarSand,
  imageAsset: 'assets/images/portrait_2.jpg',
);

const HomePromo _kSandraPromo = HomePromo(
  badge: 'AD',
  title: 'Glow by Sandra',
  subtitle: 'Book a spa day, bring a friend free',
  cta: 'Book now →',
  avatarArt: AxArt.artSpa,
  avatarGradient: AxGradients.avatarPale,
  imageAsset: 'assets/images/portrait_4.jpg',
);

const kHomePromos = [_kGracePromo];

/// Three distinct campaign slides for the three indicator dots
/// (Client_Home.dc.html lines 60-63).
const kHomeCarouselPromos = [_kGracePromo, _kPatriciaPromo, _kSandraPromo];

const kHomeCategoriesHeading = 'Browse by category';

const kHomeCategories = [
  HomeCategory(
    label: 'Hair',
    icon: AxIcons.catHair,
    background: AxColors.hairBg,
    iconColor: AxColors.hairIcon,
    labelColor: AxColors.hairLabel,
  ),
  HomeCategory(
    label: 'Makeup',
    icon: AxIcons.catMakeup,
    background: AxColors.makeupBg,
    iconColor: AxColors.makeupIcon,
    labelColor: AxColors.makeupLabel,
  ),
  HomeCategory(
    label: 'Nails',
    icon: AxIcons.catNails,
    background: AxColors.nailsBg,
    iconColor: AxColors.nailsIcon,
    labelColor: AxColors.nailsLabel,
  ),
  HomeCategory(
    label: 'Spa & massage',
    icon: AxIcons.catSpa,
    background: AxColors.spaBg,
    iconColor: AxColors.spaIcon,
    labelColor: AxColors.spaLabel,
  ),
  HomeCategory(
    label: 'Photography',
    icon: AxIcons.catPhotography,
    background: AxColors.photoBg,
    iconColor: AxColors.photoIcon,
    labelColor: AxColors.photoLabel,
  ),
];

const kHomeEventTileLabel = 'Plan an\nevent';

const kHomeUrgentTitle = 'Need it today? Book urgent';
const kHomeUrgentSubtitle = 'Get matched fast, for a small rush fee';

const kHomeFeaturedHeading = 'Featured near you';
const kHomeSeeAll = 'See all';

const kHomeFeaturedProviders = [
  HomeProvider(
    id: 'grace-nabbosa',
    name: 'Grace Nabbosa Braids',
    subtitle: 'Hair · Ntinda',
    rating: '4.9 · from UGX 25,000',
    avatarArt: AxArt.artBraids,
    avatarGradient: AxGradients.avatarPale,
    avatarArtScale: 0.55,
    imageAsset: 'assets/images/hair_braids_1.jpg',
  ),
  HomeProvider(
    id: 'patricia-glam',
    name: 'Patricia Glam Studio',
    subtitle: 'Makeup · Kololo',
    rating: '5.0 · from UGX 60,000',
    avatarArt: AxArt.artMakeup,
    avatarGradient: AxGradients.avatarSand,
    avatarArtScale: 0.52,
    imageAsset: 'assets/images/makeup_1.jpg',
  ),
];

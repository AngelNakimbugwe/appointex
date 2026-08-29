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
  });

  final String badge;
  final String title;
  final String subtitle;
  final String cta;
  final String avatarArt;
  final Gradient avatarGradient;
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
  });

  final String id;
  final String name;
  final String subtitle;
  final String rating;
  final String? avatarArt;
  final Gradient? avatarGradient;
}

const kHomeGreeting = 'Good morning';
const kHomeTitle = 'Where to today?';
const kHomeLocation = 'Kampala';
const kHomeSearchPlaceholder = 'Search stylists, makeup artists, spas…';

const kHomePromos = [
  HomePromo(
    badge: 'AD',
    title: 'Grace Nabbosa Braids',
    subtitle: '20% off box braids this week',
    cta: 'Book now →',
    avatarArt: AxArt.artBraids,
    avatarGradient: AxGradients.avatarBlush,
  ),
];

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
  ),
  HomeProvider(
    id: 'patricia-glam',
    name: 'Patricia Glam Studio',
    subtitle: 'Makeup · Kololo',
    rating: '5.0 · from UGX 60,000',
    avatarArt: AxArt.artMakeup,
    avatarGradient: AxGradients.avatarSand,
  ),
];

/// Copy and rows from `.design-src/Biz_FeaturedSpots.dc.html`, verbatim.
library;

import 'package:flutter/material.dart';

import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_gradients.dart';

const String kPageTitle = 'Featured Spots';
const String kPageSubtitle =
    'Pay to be one of the top 3 shown first when clients browse your category. Only 3 spots per category, one week at a time.';

const String kCurrentTitle = 'Currently featured in Makeup';
const String kSpotsTakenPill = '3 of 3 spots taken';

/// One `.row` of the "Currently featured" card.
class FeaturedSpot {
  const FeaturedSpot({
    required this.rank,
    required this.name,
    required this.daysLeft,
    required this.rankColor,
    required this.gradient,
    required this.art,
    this.daysLeftHighlight = false,
  });

  final String rank;
  final String name;
  final String daysLeft;
  final Color rankColor;
  final Gradient gradient;
  final String art;
  final bool daysLeftHighlight;
}

const List<FeaturedSpot> kFeaturedSpots = [
  FeaturedSpot(
    rank: '1',
    name: 'Faces by Immaculate',
    daysLeft: '5 days left',
    rankColor: AxColors.salmon,
    gradient: AxGradients.avatarBlush,
    art: AxArt.artNails,
  ),
  FeaturedSpot(
    rank: '2',
    name: 'Glow by Sandra',
    daysLeft: '2 days left',
    rankColor: AxColors.brandMuted,
    gradient: AxGradients.avatarPale,
    art: AxArt.artSpa,
  ),
  FeaturedSpot(
    rank: '3',
    name: 'Patricia Glam Studio (you)',
    daysLeft: '6 days left',
    rankColor: AxColors.panelNeutral,
    gradient: AxGradients.avatarSand,
    art: AxArt.artMakeup,
    daysLeftHighlight: true,
  ),
];

const String kBannerTitle = "You're featured this week";
const String kBannerBody =
    'Renews automatically unless you turn it off in Settings.';

const String kAdvertiseTitle = 'Advertise on Appointex';
const String kPlacementEyebrow = 'Category placement · Makeup';

const String kWeekLabel = '1 week';
const String kWeekPrice = 'UGX 30,000';
const String kMonthLabel = '1 month · save 17%';
const String kMonthPrice = 'UGX 100,000';
const String kChoose = 'Choose';

const String kBannerAdEyebrow = 'Home banner ad';
const String kCarouselTitle = 'Rotating carousel slot';
const String kCarouselPrice = 'UGX 50,000/wk';
const String kCarouselDescription =
    "Shown in the carousel on every client's Home screen, across all categories.";
const String kGetASlot = 'Get a slot';

const String kPaidDisclosure =
    'Both are clearly marked to clients as paid, separate from review score and ranking.';

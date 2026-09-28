import 'package:flutter/material.dart';

import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_gradients.dart';

class UrgentCategory {
  const UrgentCategory({
    required this.label,
    required this.icon,
    required this.background,
    required this.iconColor,
    required this.selected,
  });

  final String label;
  final String icon;
  final Color background;
  final Color iconColor;
  final bool selected;
}

class UrgentWindow {
  const UrgentWindow({
    required this.label,
    required this.fee,
    required this.selected,
  });

  final String label;
  final String fee;
  final bool selected;
}

class UrgentMatch {
  const UrgentMatch({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.slotTime,
    required this.feeBase,
    required this.feeTotal,
    required this.art,
    required this.gradient,
    this.imageAsset,
  });

  final String id;
  final String name;
  final String subtitle;
  final String slotTime;
  final String feeBase;
  final String feeTotal;
  final String art;
  final Gradient gradient;

  /// A real photo (`assets/images/*`) shown instead of [art] when set.
  final String? imageAsset;
}

const String kUrgentTitle = 'Urgent booking';
const String kUrgentBannerTitle = 'Need it today?';
const String kUrgentBannerBody =
    "We'll match you with a provider who has a real opening in your window.";
const String kUrgentCategoriesLabel = 'What do you need?';
const String kUrgentWindowsLabel = 'How soon?';
const String kUrgentNote =
    'Only providers with a genuinely open slot in this window are shown. The rush fee is shown before you book, on top of the normal service price.';
const String kUrgentMatchesLabel = '2 providers can fit you in this window';

const List<UrgentCategory> kUrgentCategories = [
  UrgentCategory(
    label: 'Hair',
    icon: AxIcons.catHair,
    background: AxColors.hairBg,
    iconColor: AxColors.hairIcon,
    selected: false,
  ),
  UrgentCategory(
    label: 'Makeup',
    icon: AxIcons.catMakeup,
    background: AxColors.urgentTo,
    iconColor: AxColors.surface,
    selected: true,
  ),
  UrgentCategory(
    label: 'Nails',
    icon: AxIcons.catNails,
    background: AxColors.nailsBg,
    iconColor: AxColors.nailsIcon,
    selected: false,
  ),
  UrgentCategory(
    label: 'Spa',
    icon: AxIcons.catSpa,
    background: AxColors.spaBg,
    iconColor: AxColors.spaIcon,
    selected: false,
  ),
];

const List<UrgentWindow> kUrgentWindows = [
  UrgentWindow(label: 'Today', fee: '+15% rush fee', selected: false),
  UrgentWindow(label: 'Next 3 hours', fee: '+25% rush fee', selected: true),
  UrgentWindow(label: 'ASAP · within 1 hr', fee: '+40% rush fee', selected: false),
];

const List<UrgentMatch> kUrgentMatches = [
  UrgentMatch(
    id: 'patricia-glam-studio',
    name: 'Patricia Glam Studio',
    subtitle: '5.0 · Kololo · Everyday glam',
    slotTime: 'Free at 3:15pm today',
    feeBase: 'UGX 60,000 + 25% rush → ',
    feeTotal: 'UGX 75,000',
    art: AxArt.artMakeup,
    gradient: AxGradients.avatarSand,
    imageAsset: 'assets/images/makeup_1.jpg',
  ),
  UrgentMatch(
    id: 'ninas-beauty-bar',
    name: "Nina's Beauty Bar",
    subtitle: '4.7 · Bugolobi · Everyday glam',
    slotTime: 'Free at 4:00pm today',
    feeBase: 'UGX 35,000 + 25% rush → ',
    feeTotal: 'UGX 43,750',
    art: AxArt.artNails,
    gradient: AxGradients.avatarBlush,
    imageAsset: 'assets/images/nails_2.jpg',
  ),
];

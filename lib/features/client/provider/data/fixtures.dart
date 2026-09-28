import 'package:flutter/material.dart';

import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_gradients.dart';

class ProviderService {
  const ProviderService({
    required this.name,
    required this.meta,
    this.selected = false,
  });

  final String name;
  final String meta;
  final bool selected;
}

class ProviderPortfolioTile {
  const ProviderPortfolioTile({
    required this.gradient,
    required this.art,
    this.artScale = 0.55,
    this.video = false,
    this.imageAsset,
  });

  final Gradient gradient;
  final String art;
  final double artScale;
  final bool video;

  /// A real photo (`assets/images/*`) shown instead of [art] when set.
  final String? imageAsset;
}

class ProviderProfile {
  const ProviderProfile({
    required this.name,
    required this.ratingLine,
    required this.verifiedLine,
    required this.mobileLine,
    required this.portfolioTitle,
    required this.portfolioAction,
    required this.portfolioCaption,
    required this.portfolio,
    required this.tabs,
    required this.activeTab,
    required this.services,
    required this.selectedSummary,
    required this.totalSummary,
    required this.continueLabel,
  });

  final String name;
  final String ratingLine;
  final String verifiedLine;
  final String mobileLine;
  final String portfolioTitle;
  final String portfolioAction;
  final String portfolioCaption;
  final List<ProviderPortfolioTile> portfolio;
  final List<String> tabs;
  final int activeTab;
  final List<ProviderService> services;
  final String selectedSummary;
  final String totalSummary;
  final String continueLabel;
}

const kProviderProfile = ProviderProfile(
  name: 'Patricia Glam Studio',
  ratingLine: '5.0 · 142 reviews · Kololo, Kampala',
  verifiedLine: 'ID verified · Buyer protection when you pay in the app',
  mobileLine: 'Offers mobile service · +5% travel fee',
  portfolioTitle: 'Portfolio',
  portfolioAction: 'See all',
  portfolioCaption: 'Photos and videos from real Appointex bookings',
  portfolio: [
    ProviderPortfolioTile(
      gradient: AxGradients.avatarPale,
      art: AxArt.artMakeup,
      artScale: 0.52,
      imageAsset: 'assets/images/makeup_2.jpg',
    ),
    ProviderPortfolioTile(
      gradient: AxGradients.avatarSand,
      art: AxArt.artSpa,
      artScale: 0.52,
      video: true,
      imageAsset: 'assets/images/spa_3.jpg',
    ),
    ProviderPortfolioTile(
      gradient: AxGradients.avatarRose,
      art: AxArt.artNails,
      artScale: 0.52,
      imageAsset: 'assets/images/nails_3.jpg',
    ),
    ProviderPortfolioTile(
      gradient: AxGradients.avatarBlush,
      art: AxArt.artPerson,
      imageAsset: 'assets/images/portrait_3.jpg',
    ),
  ],
  tabs: ['Services', 'Reviews', 'About'],
  activeTab: 0,
  services: [
    ProviderService(name: 'Bridal makeup, full glam', meta: '2 hr · UGX 180,000'),
    ProviderService(name: 'Everyday glam', meta: '45 min · UGX 60,000', selected: true),
    ProviderService(name: 'Photoshoot makeup', meta: '1 hr · UGX 90,000'),
    ProviderService(name: 'Lashes add-on', meta: '20 min · UGX 20,000'),
  ],
  selectedSummary: '2 selected',
  totalSummary: 'UGX 150,000',
  continueLabel: 'Continue',
);

import 'package:flutter/material.dart';

import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_gradients.dart';

class SearchChip {
  const SearchChip({required this.label, required this.selected});

  final String label;
  final bool selected;
}

class SearchFeaturedProvider {
  const SearchFeaturedProvider({
    required this.id,
    required this.name,
    required this.subline,
    required this.art,
    required this.gradient,
    this.imageAsset,
  });

  final String id;
  final String name;
  final String subline;
  final String art;
  final Gradient gradient;

  /// A real photo (`assets/images/*`) shown instead of [art] when set.
  final String? imageAsset;
}

class SearchResult {
  const SearchResult({
    required this.id,
    required this.name,
    required this.rating,
    required this.service,
    required this.price,
    required this.art,
    required this.gradient,
    this.imageAsset,
  });

  final String id;
  final String name;
  final String rating;
  final String service;
  final String price;
  final String art;
  final Gradient gradient;

  /// A real photo (`assets/images/*`) shown instead of [art] when set.
  final String? imageAsset;
}

const String kSearchTitle = 'Makeup artists';
const String kSearchFeaturedLabel = 'Featured in Makeup';
const String kSearchResultsLabel = 'All makeup artists · 28';

const List<SearchChip> kSearchChips = [
  SearchChip(label: 'Kampala', selected: true),
  SearchChip(label: 'Price', selected: false),
  SearchChip(label: 'Rating 4.5+', selected: false),
  SearchChip(label: 'Available today', selected: false),
];

const List<SearchFeaturedProvider> kSearchFeatured = [
  SearchFeaturedProvider(
    id: 'patricia-glam-studio',
    name: 'Patricia Glam Studio',
    subline: '5.0 ★ · Kololo',
    art: AxArt.artMakeup,
    gradient: AxGradients.avatarBlush,
    imageAsset: 'assets/images/makeup_1.jpg',
  ),
  SearchFeaturedProvider(
    id: 'faces-by-immaculate',
    name: 'Faces by Immaculate',
    subline: '4.8 ★ · Ntinda',
    art: AxArt.artNails,
    gradient: AxGradients.avatarPale,
    imageAsset: 'assets/images/nails_1.jpg',
  ),
  SearchFeaturedProvider(
    id: 'glow-by-sandra',
    name: 'Glow by Sandra',
    subline: '4.9 ★ · Muyenga',
    art: AxArt.artSpa,
    gradient: AxGradients.avatarSand,
    imageAsset: 'assets/images/spa_1.jpg',
  ),
];

const List<SearchResult> kSearchResults = [
  SearchResult(
    id: 'ritahs-touch-makeup',
    name: "Ritah's Touch Makeup",
    rating: '4.9 (74) · Naguru',
    service: 'Editorial & soft glam',
    price: 'from UGX 50,000',
    art: AxArt.artMakeup,
    gradient: AxGradients.avatarRose,
    imageAsset: 'assets/images/makeup_3.jpg',
  ),
  SearchResult(
    id: 'ninas-beauty-bar',
    name: "Nina's Beauty Bar",
    rating: '4.7 (63) · Bugolobi',
    service: 'Everyday glam & makeovers',
    price: 'from UGX 35,000',
    art: AxArt.artNails,
    gradient: AxGradients.avatarSandBlush,
    imageAsset: 'assets/images/nails_2.jpg',
  ),
  SearchResult(
    id: 'comfort-namutebi-makeup',
    name: 'Comfort Namutebi Makeup',
    rating: '4.6 (21) · Kansanga',
    service: 'New to Appointex',
    price: 'from UGX 30,000',
    art: AxArt.artSpa,
    gradient: AxGradients.avatarPale,
    imageAsset: 'assets/images/spa_2.jpg',
  ),
];

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes.dart';
import '../../../../design/icons/ax_icon.dart';
import '../../../../design/icons/ax_icons.dart' show AxIcons;
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_chip.dart';
import '../data/fixtures.dart';
import 'widgets/featured_card.dart';
import 'widgets/search_result_row.dart';

/// Client_Search — search results (`/search`). The user reviews filter chips,
/// a "Featured in Makeup" carousel and the full result list, drilling into any
/// provider for detail and booking.
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.initialCategory});

  /// Category label passed from the home grid (`/search?category=Hair`).
  /// Rendered as a pre-selected chip ahead of the default filter chips.
  final String? initialCategory;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  /// The category chip is prepended unless it already exists in the default
  /// chip set, so the label never renders twice.
  late final List<SearchChip> _chips =
      widget.initialCategory == null ||
              kSearchChips.any((c) => c.label == widget.initialCategory)
          ? kSearchChips
          : [
              SearchChip(label: widget.initialCategory!, selected: true),
              ...kSearchChips,
            ];

  late final Set<String> _selected =
      _chips.where((c) => c.selected).map((c) => c.label).toSet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            _Header(
              title: kSearchTitle,
              onBack: () => context.canPop()
                  ? context.pop()
                  : context.go(AxRoutes.home),
            ),
            _FilterChipRow(
              chips: _chips,
              selected: _selected,
              onToggle: (label) =>
                  setState(() => _selected.contains(label)
                      ? _selected.remove(label)
                      : _selected.add(label)),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  AxSpace.s16,
                  AxSpace.s2,
                  AxSpace.s16,
                  AxSpace.s16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AxSpace.s16,
                  children: [
                    _FeaturedSection(
                      onCardTap: (id) => context.go('/provider/$id'),
                    ),
                    _ResultsSection(
                      onResultTap: (id) => context.go('/provider/$id'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Artboard line 20: `height:56px; gap:14px; padding:0 16px;
/// border-bottom:1px solid #ECE7DC`, back arrow, Manrope 16/700 title, trailing
/// filter icon.
class _Header extends StatelessWidget {
  const _Header({required this.title, this.onBack});

  final String title;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: AxSpace.s16),
      decoration: const BoxDecoration(
        color: AxColors.surface,
        border: Border(bottom: BorderSide(color: AxColors.border)),
      ),
      child: Row(
        spacing: AxSpace.s14,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onBack,
            child: const AxIcon(
              AxIcons.chevronLeft,
              size: 19,
              color: AxColors.brand,
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: AxType.head(AxType.title, color: AxColors.brand),
            ),
          ),
          const AxIcon(
            AxIcons.filter,
            size: 18,
            color: AxColors.brand,
          ),
        ],
      ),
    );
  }
}

/// Artboard lines 26–31: `padding:14px 16px`, chips in a horizontal scroller —
/// `white-space: nowrap` on `.chip` means the row scrolls, never wraps.
class _FilterChipRow extends StatelessWidget {
  const _FilterChipRow({
    required this.chips,
    required this.selected,
    this.onToggle,
  });

  final List<SearchChip> chips;
  final Set<String> selected;
  final ValueChanged<String>? onToggle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s16,
        vertical: AxSpace.s14,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: AxSpace.s8,
          children: [
            for (final chip in chips)
              AxChip(
                label: chip.label,
                selected: selected.contains(chip.label),
                onTap: onToggle == null ? null : () => onToggle!(chip.label),
              ),
          ],
        ),
      ),
    );
  }
}

/// Artboard lines 35–54: the "Featured in Makeup" carousel, gap 10 between the
/// fixed 108px cards.
class _FeaturedSection extends StatelessWidget {
  const _FeaturedSection({this.onCardTap});

  final ValueChanged<String>? onCardTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s8,
      children: [
        Text(
          kSearchFeaturedLabel,
          style: AxType.head(AxType.bodySm, color: AxColors.brand),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AxSpace.s10,
            children: [
              for (final provider in kSearchFeatured)
                FeaturedCard(
                  provider: provider,
                  onTap:
                      onCardTap == null ? null : () => onCardTap!(provider.id),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Artboard lines 56–97: "All makeup artists · 28" and the result rows.
class _ResultsSection extends StatelessWidget {
  const _ResultsSection({this.onResultTap});

  final ValueChanged<String>? onResultTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s10,
      children: [
        Text(
          kSearchResultsLabel,
          style: AxType.head(AxType.bodySm, color: AxColors.brand),
        ),
        for (final result in kSearchResults)
          SearchResultRow(
            result: result,
            onTap: onResultTap == null ? null : () => onResultTap!(result.id),
          ),
      ],
    );
  }
}

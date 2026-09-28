import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes.dart';
import '../../../../design/icons/ax_icon.dart';
import '../../../../design/icons/ax_icons.dart' show AxIcons;
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_gradients.dart';
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../data/fixtures.dart';
import 'widgets/urgent_match_row.dart';

/// Client_Urgent — urgent booking flow (`/home/urgent`). The user picks a
/// category and a time window, sees which providers genuinely have an open
/// slot, and drills into a provider to book.
class UrgentScreen extends StatelessWidget {
  const UrgentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            _Header(
              title: kUrgentTitle,
              onBack: () => context.canPop()
                  ? context.pop()
                  : context.go(AxRoutes.home),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AxSpace.s18,
                  vertical: AxSpace.s16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AxSpace.s16,
                  children: [
                    const _Banner(),
                    const _CategoryPicker(),
                    const _WindowPicker(),
                    const _RushNote(),
                    _MatchesSection(
                      onMatchTap: (id) => context.go('/provider/$id'),
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

/// Artboard line 19: `height:56px; gap:12px; padding:0 16px;
/// border-bottom:1px solid #ECE7DC`, back arrow, bolt, Manrope 16/700 title.
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
        spacing: AxSpace.s12,
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
          const AxIcon(
            AxIcons.boltFill,
            size: 16,
            color: AxColors.urgentTo,
          ),
          Expanded(
            child: Text(
              title,
              style: AxType.head(AxType.title, color: AxColors.brand),
            ),
          ),
        ],
      ),
    );
  }
}

/// Artboard lines 27–35: the urgent gradient banner (120deg per Rule 9) with a
/// frosted 36×36 bolt tile and the two-line pitch.
class _Banner extends StatelessWidget {
  const _Banner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s16,
        vertical: AxSpace.s14,
      ),
      decoration: const BoxDecoration(
        gradient: AxGradients.urgent,
        borderRadius: BorderRadius.all(Radius.circular(AxRadius.tile)),
      ),
      child: Row(
        spacing: AxSpace.s12,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AxColors.surface.withValues(alpha: 0.22),
              borderRadius:
                  const BorderRadius.all(Radius.circular(AxRadius.md)),
            ),
            child: const Center(
              child: AxIcon(
                AxIcons.boltFill,
                size: 18,
                color: AxColors.surface,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AxSpace.s2,
              children: [
                Text(
                  kUrgentBannerTitle,
                  style: AxType.head(
                    AxType.bodySm,
                    weight: FontWeight.w800,
                    color: AxColors.surface,
                  ),
                ),
                Text(
                  kUrgentBannerBody,
                  style: AxType.text(
                    AxType.micro,
                    color: AxColors.urgentTextSoft,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// "What do you need?" — the `.catchip` row (Tier 3, artboard lines 37–65) in
/// a horizontal scroller so the fixed 58px chips never wrap.
class _CategoryPicker extends StatelessWidget {
  const _CategoryPicker();

  /// `.catchip { width:58px }` — Client_Urgent.dc.html:14.
  static const double _catchipWidth = 58;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s8,
      children: [
        Text(
          kUrgentCategoriesLabel,
          style: AxType.head(AxType.labelSm, color: AxColors.brand),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AxSpace.s12,
            children: [
              for (final category in kUrgentCategories)
                _Catchip(category: category),
            ],
          ),
        ),
      ],
    );
  }
}

class _Catchip extends StatelessWidget {
  const _Catchip({required this.category});

  final UrgentCategory category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _CategoryPicker._catchipWidth,
      child: Column(
        spacing: AxSpace.s5,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: category.background,
              borderRadius:
                  const BorderRadius.all(Radius.circular(AxRadius.card)),
            ),
            child: Center(
              child: AxIcon(
                category.icon,
                size: 18,
                color: category.iconColor,
              ),
            ),
          ),
          Text(
            category.label,
            textAlign: TextAlign.center,
            style: AxType.text(
              AxType.nano,
              weight: category.selected ? FontWeight.w700 : FontWeight.w600,
              color: category.selected
                  ? AxColors.urgentTo
                  : AxColors.textBody,
            ),
          ),
        ],
      ),
    );
  }
}

/// "How soon?" — artboard lines 67–83. The selected window carries a 2px
/// `#E8433D` border on `#FFF3EF`; the others a 1px `#E0DBCF` border.
class _WindowPicker extends StatelessWidget {
  const _WindowPicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s8,
      children: [
        Text(
          kUrgentWindowsLabel,
          style: AxType.head(AxType.labelSm, color: AxColors.brand),
        ),
        Column(
          spacing: AxSpace.s8,
          children: [
            for (final window in kUrgentWindows) _WindowOption(window: window),
          ],
        ),
      ],
    );
  }
}

class _WindowOption extends StatelessWidget {
  const _WindowOption({required this.window});

  final UrgentWindow window;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s14,
        vertical: AxSpace.s11,
      ),
      decoration: BoxDecoration(
        color: window.selected ? AxColors.urgentBgSoft : null,
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.card)),
        border: Border.all(
          color:
              window.selected ? AxColors.urgentTo : AxColors.borderStrong,
          width: window.selected ? 2 : 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              window.label,
              style: AxType.text(
                AxType.labelSm,
                weight: window.selected ? FontWeight.w700 : FontWeight.w600,
                color:
                    window.selected ? AxColors.urgentTo : AxColors.textPrimary,
              ),
            ),
          ),
          Flexible(
            child: Text(
              window.fee,
              textAlign: TextAlign.right,
              style: AxType.text(
                AxType.captionSm,
                weight: window.selected ? FontWeight.w800 : FontWeight.w700,
                color:
                    window.selected ? AxColors.urgentTo : AxColors.textSubtle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Artboard lines 85–88: the `#F7F5F1` explainer box, clock icon nudged down
/// 2px, 10.5px copy at line-height 1.5.
class _RushNote extends StatelessWidget {
  const _RushNote();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s12,
        vertical: AxSpace.s10,
      ),
      decoration: const BoxDecoration(
        color: AxColors.surfaceWarm,
        borderRadius: BorderRadius.all(Radius.circular(AxRadius.md)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AxSpace.s8,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: AxSpace.s2),
            child: AxIcon(AxIcons.clock, size: 14, color: AxColors.brand),
          ),
          Expanded(
            child: Text(
              kUrgentNote,
              style: AxType.text(
                AxType.microSm,
                color: AxColors.textBody,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Artboard lines 90–118: the matched-provider list.
class _MatchesSection extends StatelessWidget {
  const _MatchesSection({this.onMatchTap});

  final ValueChanged<String>? onMatchTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s10,
      children: [
        Text(
          kUrgentMatchesLabel,
          style: AxType.head(AxType.labelSm, color: AxColors.brand),
        ),
        for (final match in kUrgentMatches)
          UrgentMatchRow(
            match: match,
            onTap: onMatchTap == null ? null : () => onMatchTap!(match.id),
          ),
      ],
    );
  }
}

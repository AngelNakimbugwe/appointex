import 'package:flutter/material.dart';

import '../icons/ax_icon.dart';
import '../icons/ax_icons.dart';
import '../tokens/ax_colors.dart';
import '../tokens/ax_space.dart';
import '../tokens/ax_type.dart';

/// Mobile top bar — present on 9 of 12 client screens, always the same shape:
/// back arrow (`chevron_left`, 19 px, stroke 2.2 baked into the asset), a
/// title, optional trailing action. Sits above the scrolling body
/// (`flex-shrink: 0`), never inside it.
///
/// Home is the exception: no back arrow, a two-line greeting block instead.
/// Model that with [AxMobileHeader.home].
class AxMobileHeader extends StatelessWidget {
  const AxMobileHeader(
    this.title, {
    super.key,
    this.onBack,
    this.trailing,
    this.showBack = true,
    this.titleSize = AxType.titleLg,
  });

  final String title;
  final VoidCallback? onBack;
  final Widget? trailing;
  final bool showBack;

  /// Inner pages use 16 px (Client_Search); the inventory default is 17 px.
  final double titleSize;

  /// Home header: greeting block + trailing widgets, padding `20, 20, 20, 14`.
  factory AxMobileHeader.home({
    required String greeting,
    required String title,
    List<Widget> actions = const [],
  }) {
    return _HomeHeader(greeting: greeting, title: title, actions: actions);
  }

  EdgeInsets get _padding => showBack
      ? const EdgeInsets.fromLTRB(AxSpace.s18, AxSpace.s20, AxSpace.s20, AxSpace.s14)
      : AxSpace.headerPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      child: Row(
        children: [
          if (showBack)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onBack,
              child: const Padding(
                padding: EdgeInsets.only(right: AxSpace.s14),
                child: AxIcon(
                  AxIcons.chevronLeft,
                  size: 19,
                  color: AxColors.brand,
                ),
              ),
            ),
          Expanded(
            child: Text(
              title,
              style: AxType.head(titleSize, color: AxColors.brand),
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}

/// The Home header variant (Client_Home): "Good morning" over the 17 px
/// headline, location pill and bell with a 10 px gap on the trailing side.
class _HomeHeader extends AxMobileHeader {
  const _HomeHeader({
    required this.greeting,
    required String title,
    required this.actions,
  }) : super(title);

  final String greeting;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AxSpace.headerPadding,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AxSpace.s4,
              children: [
                Text(
                  greeting,
                  style: AxType.text(AxType.caption, color: AxColors.textSubtle),
                ),
                Text(
                  title,
                  style: AxType.head(AxType.titleLg, color: AxColors.brand),
                ),
              ],
            ),
          ),
          if (actions.isNotEmpty)
            Row(spacing: AxSpace.s10, children: actions),
        ],
      ),
    );
  }
}

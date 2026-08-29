import 'package:flutter/material.dart';

import '../../../../../design/icons/ax_icon.dart';
import '../../../../../design/tokens/ax_colors.dart';
import '../../../../../design/tokens/ax_gradients.dart';
import '../../../../../design/tokens/ax_radius.dart';
import '../../../../../design/tokens/ax_space.dart';
import '../../../../../design/tokens/ax_type.dart';
import '../../data/fixtures.dart';

class HomeCategoryGrid extends StatelessWidget {
  const HomeCategoryGrid({
    super.key,
    required this.heading,
    required this.categories,
    required this.eventLabel,
    this.onEventTap,
  });

  final String heading;
  final List<HomeCategory> categories;
  final String eventLabel;
  final VoidCallback? onEventTap;

  int get _cellCount => categories.length + 1;

  Widget _cell(int index) {
    if (index < categories.length) {
      return _CategoryTile(category: categories[index]);
    }
    return _EventTile(label: eventLabel, onTap: onEventTap);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AxSpace.s10,
      children: [
        Text(
          heading,
          style: AxType.head(
            AxType.body,
            weight: FontWeight.w700,
            color: AxColors.brand,
          ),
        ),
        for (var i = 0; i < _cellCount; i += 3)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: AxSpace.s10,
              children: [
                for (var j = i; j < i + 3 && j < _cellCount; j++)
                  Expanded(child: _cell(j)),
              ],
            ),
          ),
      ],
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({required this.category});

  final HomeCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s6,
        vertical: AxSpace.s14,
      ),
      decoration: BoxDecoration(
        color: category.background,
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.tile)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AxSpace.s6,
        children: [
          AxIcon(category.icon, size: 20, color: category.iconColor),
          Text(
            category.label,
            textAlign: TextAlign.center,
            style: AxType.text(
              AxType.captionSm,
              weight: FontWeight.w700,
              color: category.labelColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _EventTile extends StatelessWidget {
  const _EventTile({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AxSpace.s6,
          vertical: AxSpace.s14,
        ),
        decoration: const BoxDecoration(
          gradient: AxGradients.logo,
          borderRadius: BorderRadius.all(Radius.circular(AxRadius.tile)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: AxType.text(
                AxType.micro,
                weight: FontWeight.w700,
                color: AxColors.eventLabel,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

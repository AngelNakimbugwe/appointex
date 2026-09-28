import 'package:flutter/material.dart';

import '../../../../../design/icons/ax_icon.dart';
import '../../../../../design/tokens/ax_colors.dart';
import '../../../../../design/tokens/ax_radius.dart';
import '../../../../../design/tokens/ax_type.dart';
import '../../data/fixtures.dart';

/// A "Featured in Makeup" card (artboard lines 38–52): fixed 108px column, a
/// 108×80 gradient art tile, name at 11.5/700 with line-height 1.25, sub-line
/// 10.5 `#8A8A8A`.
class FeaturedCard extends StatelessWidget {
  const FeaturedCard({super.key, required this.provider, this.onTap});

  final SearchFeaturedProvider provider;
  final VoidCallback? onTap;

  /// Card column width — Client_Search.dc.html:38.
  static const double _cardWidth = 108;

  /// Art tile height — Client_Search.dc.html:38.
  static const double _tileHeight = 80;

  /// Art drawn at 52% of the 80px tile height — Client_Search.dc.html:39.
  static const double _artSize = 41.6;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        width: _cardWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
          children: [
            Container(
              width: _cardWidth,
              height: _tileHeight,
              decoration: BoxDecoration(
                gradient: provider.gradient,
                borderRadius:
                    const BorderRadius.all(Radius.circular(AxRadius.card)),
              ),
              child: provider.imageAsset == null
                  ? Center(child: AxArt(provider.art, size: _artSize))
                  : ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(AxRadius.card),
                      ),
                      child: Image.asset(
                        provider.imageAsset!,
                        width: _cardWidth,
                        height: _tileHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            Text(
              provider.name,
              style: AxType.text(
                AxType.captionSm,
                weight: FontWeight.w700,
                color: AxColors.brand,
                height: 1.25,
              ),
            ),
            Text(
              provider.subline,
              style: AxType.text(
                AxType.microSm,
                color: AxColors.textSubtle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

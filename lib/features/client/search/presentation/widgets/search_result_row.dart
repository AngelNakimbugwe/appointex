import 'package:flutter/material.dart';

import '../../../../../design/icons/ax_icon.dart';
import '../../../../../design/tokens/ax_colors.dart';
import '../../../../../design/tokens/ax_radius.dart';
import '../../../../../design/tokens/ax_space.dart';
import '../../../../../design/tokens/ax_type.dart';
import '../../../../../design/widgets/ax_avatar.dart';
import '../../../../../design/widgets/ax_rating.dart';
import '../../../../../design/widgets/ax_verified_badge.dart';
import '../../data/fixtures.dart';

/// A result row under "All makeup artists" (artboard lines 59–96): padding 12,
/// `1px solid #ECE7DC`, radius 14, avatar 68/r12, name 14/700 + verified badge,
/// rating line, service line 12.5 `#7A7A7A`, price 13/700 with `margin-top:2`.
/// Kept local because no `AxProviderRow` variant carries this shape.
class SearchResultRow extends StatelessWidget {
  const SearchResultRow({super.key, required this.result, this.onTap});

  final SearchResult result;
  final VoidCallback? onTap;

  /// Art drawn at 52% of the 68px avatar — Client_Search.dc.html:60.
  static const double _avatarArtSize = 35.36;

  /// Name at 14px — no AxType token carries 14 — Client_Search.dc.html:69.
  static const double _nameSize = 14;

  /// `margin-top:2px` on the price line — Client_Search.dc.html:68.
  static const double _priceTopGap = 2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AxSpace.s12),
        decoration: BoxDecoration(
          color: AxColors.surface,
          borderRadius: const BorderRadius.all(Radius.circular(AxRadius.tile)),
          border: Border.all(color: AxColors.border),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AxSpace.s12,
          children: [
            AxAvatar(
              size: 68,
              radius: AxRadius.card,
              gradient: result.gradient,
              imageAsset: result.imageAsset,
              child: AxArt(result.art, size: _avatarArtSize),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AxSpace.s4,
                children: [
                  Row(
                    spacing: AxSpace.s5,
                    children: [
                      Flexible(
                        child: Text(
                          result.name,
                          style: AxType.text(
                            _nameSize,
                            weight: FontWeight.w700,
                            color: AxColors.brand,
                          ),
                        ),
                      ),
                      const AxVerifiedBadge(),
                    ],
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: AxRating(value: result.rating),
                  ),
                  Text(
                    result.service,
                    style: AxType.text(
                      AxType.labelSm,
                      color: AxColors.textMuted,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: _priceTopGap),
                    child: Text(
                      result.price,
                      style: AxType.text(
                        AxType.label,
                        weight: FontWeight.w700,
                        color: AxColors.brand,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

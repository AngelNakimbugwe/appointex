import 'package:flutter/material.dart';

import '../../../../../design/icons/ax_icon.dart';
import '../../../../../design/icons/ax_icons.dart' hide AxArt;
import '../../../../../design/tokens/ax_colors.dart';
import '../../../../../design/tokens/ax_radius.dart';
import '../../../../../design/tokens/ax_space.dart';
import '../../../../../design/tokens/ax_type.dart';
import '../../../../../design/widgets/ax_avatar.dart';
import '../../../../../design/widgets/ax_verified_badge.dart';
import '../../data/fixtures.dart';

class FeaturedProviderRow extends StatelessWidget {
  const FeaturedProviderRow({super.key, required this.provider, this.onTap});

  final HomeProvider provider;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AxSpace.listRowPadding),
        decoration: BoxDecoration(
          color: AxColors.surface,
          borderRadius: const BorderRadius.all(Radius.circular(AxRadius.card)),
          border: Border.all(color: AxColors.border),
        ),
        child: Row(
          spacing: AxSpace.s12,
          children: [
            AxAvatar(
              size: 56,
              radius: AxRadius.md,
              gradient: provider.avatarGradient,
              imageAsset: provider.imageAsset,
              child: provider.avatarArt == null
                  ? null
                  : AxArt(
                      provider.avatarArt!,
                      size: 56 * provider.avatarArtScale,
                    ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AxSpace.s3,
                children: [
                  Row(
                    spacing: AxSpace.s5,
                    children: [
                      Flexible(
                        child: Text(
                          provider.name,
                          style: AxType.text(
                            AxType.bodySm,
                            weight: FontWeight.w700,
                            color: AxColors.brand,
                          ),
                        ),
                      ),
                      const AxVerifiedBadge(),
                    ],
                  ),
                  Text(
                    provider.subtitle,
                    style: AxType.text(
                      AxType.captionSm,
                      color: AxColors.textSubtle,
                    ),
                  ),
                  Row(
                    spacing: AxSpace.s4,
                    children: [
                      const AxIcon(
                        AxIcons.starFill,
                        size: 12,
                        color: AxColors.brandMid,
                      ),
                      Flexible(
                        child: Text(
                          provider.rating,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AxType.text(
                            AxType.captionSm,
                            color: AxColors.textBody,
                          ),
                        ),
                      ),
                    ],
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

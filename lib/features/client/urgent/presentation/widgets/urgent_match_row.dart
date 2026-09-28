import 'package:flutter/material.dart';

import '../../../../../design/icons/ax_icon.dart';
import '../../../../../design/icons/ax_icons.dart' show AxIcons;
import '../../../../../design/tokens/ax_colors.dart';
import '../../../../../design/tokens/ax_radius.dart';
import '../../../../../design/tokens/ax_space.dart';
import '../../../../../design/tokens/ax_type.dart';
import '../../../../../design/widgets/ax_avatar.dart';
import '../../../../../design/widgets/ax_verified_badge.dart';
import '../../data/fixtures.dart';

/// A provider match row on Client_Urgent (artboard lines 93–117): padding 12,
/// `1px solid #ECE7DC`, radius 14, avatar 56/r12, name 13/700 + verified badge,
/// sub-line 11 `#8A8A8A`, slot-time bolt pill, and a rush-fee line whose total
/// is a bold `#6B3F3A` nested span. Kept local because the shared
/// `AxProviderRow.urgent` renders `feeSummary` as flat text.
class UrgentMatchRow extends StatelessWidget {
  const UrgentMatchRow({super.key, required this.match, this.onTap});

  final UrgentMatch match;
  final VoidCallback? onTap;

  /// Art drawn at 52% of the 56px avatar — Client_Urgent.dc.html:94.
  static const double _avatarArtSize = 29.12;

  /// `margin-top:1px` on the fee line — Client_Urgent.dc.html:102.
  static const double _feeTopGap = 1;

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
              size: 56,
              radius: AxRadius.card,
              gradient: match.gradient,
              imageAsset: match.imageAsset,
              child: AxArt(match.art, size: _avatarArtSize),
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
                          match.name,
                          style: AxType.text(
                            AxType.label,
                            weight: FontWeight.w700,
                            color: AxColors.brand,
                          ),
                        ),
                      ),
                      const AxVerifiedBadge(),
                    ],
                  ),
                  Text(
                    match.subtitle,
                    style: AxType.text(
                      AxType.micro,
                      color: AxColors.textSubtle,
                    ),
                  ),
                  Row(
                    spacing: AxSpace.s4,
                    children: [
                      const AxIcon(
                        AxIcons.boltFill,
                        size: 11,
                        color: AxColors.urgentTo,
                      ),
                      Flexible(
                        child: Text(
                          match.slotTime,
                          style: AxType.text(
                            AxType.microSm,
                            weight: FontWeight.w700,
                            color: AxColors.urgentTo,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: _feeTopGap),
                    child: Text.rich(
                      TextSpan(
                        style: AxType.text(
                          AxType.captionSm,
                          color: AxColors.textPrimary,
                        ),
                        children: [
                          TextSpan(text: match.feeBase),
                          TextSpan(
                            text: match.feeTotal,
                            style: AxType.text(
                              AxType.captionSm,
                              weight: FontWeight.w800,
                              color: AxColors.brand,
                            ),
                          ),
                        ],
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

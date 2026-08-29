import 'package:flutter/material.dart';

import '../icons/ax_icon.dart';
import '../icons/ax_icons.dart';
import '../tokens/ax_colors.dart';
import '../tokens/ax_radius.dart';
import '../tokens/ax_space.dart';
import '../tokens/ax_type.dart';
import 'ax_avatar.dart';
import 'ax_rating.dart';
import 'ax_verified_badge.dart';

enum _RowKind { standard, compact, featured, urgent }

/// Provider list row (docs/04 §AxProviderRow): the single most reused
/// composite — Home "Featured near you", Search results, Urgent matches.
///
/// Standard (Client_Home): padding 10, `1px solid #ECE7DC`, radius 12, gap 12,
/// avatar 56/r10, name 13.5/700 brand + verified badge (gap 5), sub-line
/// 11.5 `#8A8A8A`, rating below (column gap 3).
///
/// Variants are named constructors, not booleans: `.compact` drops the rating,
/// `.featured` adds the AD badge, `.urgent` matches Client_Urgent (padding 12,
/// radius 14, name 13, subtitle 11, slot-time pill + rush-fee line).
class AxProviderRow extends StatelessWidget {
  const AxProviderRow({
    super.key,
    required this.name,
    required this.subtitle,
    required this.rating,
    this.avatarArt,
    this.avatarGradient,
    this.onTap,
  })  : slotTime = null,
        feeSummary = null,
        _kind = _RowKind.standard;

  const AxProviderRow.compact({
    super.key,
    required this.name,
    required this.subtitle,
    this.avatarArt,
    this.avatarGradient,
    this.onTap,
  })  : rating = null,
        slotTime = null,
        feeSummary = null,
        _kind = _RowKind.compact;

  const AxProviderRow.featured({
    super.key,
    required this.name,
    required this.subtitle,
    required this.rating,
    this.avatarArt,
    this.avatarGradient,
    this.onTap,
  })  : slotTime = null,
        feeSummary = null,
        _kind = _RowKind.featured;

  const AxProviderRow.urgent({
    super.key,
    required this.name,
    required this.subtitle,
    this.slotTime,
    this.feeSummary,
    this.avatarArt,
    this.avatarGradient,
    this.onTap,
  })  : rating = null,
        _kind = _RowKind.urgent;

  final String name;
  final String subtitle;
  final String? rating;

  /// Slot-time label for the urgent variant, e.g. "Free at 3:15pm today".
  final String? slotTime;

  /// Rush-fee line for the urgent variant, e.g. "UGX 60,000 + 25% rush → UGX 75,000".
  final String? feeSummary;

  final String? avatarArt;
  final Gradient? avatarGradient;
  final VoidCallback? onTap;
  final _RowKind _kind;

  @override
  Widget build(BuildContext context) {
    final urgent = _kind == _RowKind.urgent;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(urgent ? AxSpace.s12 : AxSpace.listRowPadding),
        decoration: BoxDecoration(
          color: AxColors.surface,
          borderRadius: BorderRadius.all(
            Radius.circular(urgent ? AxRadius.tile : AxRadius.card),
          ),
          border: Border.all(color: AxColors.border),
        ),
        child: Row(
          crossAxisAlignment:
              urgent ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          spacing: AxSpace.s12,
          children: [
            AxAvatar(
              size: 56,
              radius: urgent ? AxRadius.card : AxRadius.md,
              art: avatarArt,
              gradient: avatarGradient,
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
                          name,
                          style: AxType.text(
                            urgent ? AxType.label : AxType.bodySm,
                            weight: FontWeight.w700,
                            color: AxColors.brand,
                          ),
                        ),
                      ),
                      const AxVerifiedBadge(),
                      if (_kind == _RowKind.featured) const _AdBadge(),
                    ],
                  ),
                  Text(
                    subtitle,
                    style: AxType.text(
                      urgent ? AxType.micro : AxType.captionSm,
                      color: AxColors.textSubtle,
                    ),
                  ),
                  if (_kind == _RowKind.urgent) ...[
                    if (slotTime != null)
                      Row(
                        spacing: AxSpace.s4,
                        children: [
                          const AxIcon(
                            AxIcons.boltFill,
                            size: 11,
                            color: AxColors.urgentTo,
                          ),
                          Text(
                            slotTime!,
                            style: AxType.text(
                              AxType.microSm,
                              weight: FontWeight.w700,
                              color: AxColors.urgentTo,
                            ),
                          ),
                        ],
                      ),
                    if (feeSummary != null)
                      Text(
                        feeSummary!,
                        style: AxType.text(
                          AxType.captionSm,
                          color: AxColors.textPrimary,
                        ),
                      ),
                  ] else if (rating != null)
                    AxRating(value: rating!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The "AD" disclosure badge (Client_Home carousel): 8.5/800 `#6B3F3A` on
/// `#FFB5A7`, padding 2/7, radius 6, letter-spacing 0.03em.
class _AdBadge extends StatelessWidget {
  const _AdBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s7,
        vertical: AxSpace.s2,
      ),
      decoration: BoxDecoration(
        color: AxColors.salmon,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Text(
        'AD',
        style: AxType.text(
          AxType.tiny,
          weight: FontWeight.w800,
          color: AxColors.brand,
          letterSpacingEm: 0.03,
        ),
      ),
    );
  }
}

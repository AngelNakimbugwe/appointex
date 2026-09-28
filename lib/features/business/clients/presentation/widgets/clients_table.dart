import 'package:flutter/material.dart';

import '../../../../../design/icons/ax_icon.dart' hide AxArt;
import '../../../../../design/icons/ax_icons.dart';
import '../../../../../design/tokens/ax_colors.dart';
import '../../../../../design/tokens/ax_space.dart';
import '../../../../../design/tokens/ax_type.dart';
import '../../../../../design/widgets/ax_avatar.dart';
import '../../data/fixtures.dart';

/// Biz_Clients.dc.html lines 70-74: column flexes `1.6, 1, 0.8, 1, 1.4`,
/// scaled ×5 to whole flex units.
const List<int> _columnFlexes = [8, 5, 4, 5, 7];

/// The Clients table — `.row` + `.th` chrome with the artboard's
/// per-cell content. Kept local to the feature rather than shared:
/// `AxDataTable` takes string rows only (no avatar cells) and has no
/// per-column `textAlign` for the centred "Visits" column. Its chrome values
/// are copied exactly: header padding `6,16,6,13` over a `1px #E8E3D8` rule,
/// `.th` 11/700 `#9A9A9A` uppercase `0.03em`, rows gap 14, padding
/// `13px 6px`, `1px #F1EEE6` rules between rows only.
class ClientsTable extends StatelessWidget {
  const ClientsTable({super.key});

  /// Biz_Clients.dc.html line 72: the Visits column is `text-align:center`.
  static const int _centeredColumn = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
            AxSpace.s6,
            AxSpace.s16,
            AxSpace.s6,
            AxSpace.s13,
          ),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AxColors.borderSoft)),
          ),
          child: Row(
            spacing: AxSpace.s14,
            children: [
              for (var i = 0; i < kColumns.length; i++)
                Expanded(
                  flex: _columnFlexes[i],
                  child: Text(
                    kColumns[i].toUpperCase(),
                    textAlign:
                        i == _centeredColumn ? TextAlign.center : null,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AxType.text(
                      AxType.micro,
                      weight: FontWeight.w700,
                      color: AxColors.textFaint,
                      letterSpacingEm: 0.03,
                    ),
                  ),
                ),
            ],
          ),
        ),
        for (var i = 0; i < kClients.length; i++)
          _ClientRow(
            client: kClients[i],
            showDivider: i < kClients.length - 1,
          ),
      ],
    );
  }
}

class _ClientRow extends StatelessWidget {
  const _ClientRow({required this.client, required this.showDivider});

  /// Biz_Clients.dc.html line 77: avatar `width:32px; height:32px;
  /// border-radius:50%`.
  static const double _avatarSize = 32;

  /// Biz_Clients.dc.html line 77: `border-radius:50%` on 32px = half size.
  static const double _avatarRadius = _avatarSize / 2;

  /// Biz_Clients.dc.html line 77: `<svg width="55%" height="55%">` of 32px.
  static const double _avatarIconSize = _avatarSize * 0.55;

  /// Biz_Clients.dc.html line 77: person svg `fill="#FFFFFF" opacity="0.92"`.
  static const double _avatarIconOpacity = 0.92;

  final ClientRecord client;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s6,
        vertical: AxSpace.s13,
      ),
      decoration: showDivider
          ? const BoxDecoration(
              border: Border(bottom: BorderSide(color: AxColors.panelWarm)),
            )
          : null,
      child: Row(
        spacing: AxSpace.s14,
        children: [
          Expanded(
            flex: _columnFlexes[0],
            child: Row(
              spacing: AxSpace.s10,
              children: [
                AxAvatar(
                  size: _avatarSize,
                  radius: _avatarRadius,
                  gradient: client.gradient,
                  child: AxIcon(
                    AxIcons.personFill,
                    size: _avatarIconSize,
                    color: AxColors.surface.withValues(alpha: _avatarIconOpacity),
                  ),
                ),
                Expanded(
                  child: Text(
                    client.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
          Expanded(
            flex: _columnFlexes[1],
            child: Text(
              client.lastVisit,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AxType.text(AxType.labelSm, color: AxColors.textBody),
            ),
          ),
          Expanded(
            flex: _columnFlexes[2],
            child: Text(
              client.visits,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AxType.text(AxType.labelSm, color: AxColors.textBody),
            ),
          ),
          Expanded(
            flex: _columnFlexes[3],
            child: Text(
              client.totalSpend,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AxType.text(
                AxType.labelSm,
                weight: FontWeight.w700,
                color: AxColors.brand,
              ),
            ),
          ),
          Expanded(
            flex: _columnFlexes[4],
            child: Text(
              client.favouriteService,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AxType.text(AxType.labelSm, color: AxColors.textBody),
            ),
          ),
        ],
      ),
    );
  }
}

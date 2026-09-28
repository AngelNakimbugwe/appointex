import 'package:flutter/material.dart';

import '../../../../design/icons/ax_icon.dart' hide AxArt;
import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_sidebar.dart';
import '../../shell/biz_shell.dart';
import '../data/fixtures.dart';
import 'widgets/clients_table.dart';

/// `/biz/clients` — Biz_Clients: the "Clients" title with a search field
/// above the client table, inside [BizShell].
class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.canvas,
      body: BizShell(
        current: AxSidebarItem.clients,
        child: const _ClientsContent(),
      ),
    );
  }
}

class _ClientsContent extends StatelessWidget {
  const _ClientsContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AxSpace.s18,
      children: const [
        _ClientsHeader(),
        Expanded(child: _ClientsTableCard()),
      ],
    );
  }
}

class _ClientsHeader extends StatelessWidget {
  const _ClientsHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          kPageTitle,
          style: AxType.head(
            AxType.h4,
            weight: FontWeight.w800,
            color: AxColors.brand,
          ),
        ),
        const _SearchField(),
      ],
    );
  }
}

/// The header search box — `width:280px; height:40px; border-radius:9px;
/// border:1px solid #E0DBCF; padding:0 14px; gap:8px` with a 14px search
/// icon and the placeholder hint. Local because `AxField` has no
/// leading-icon slot and its desktop height is 44, not 40.
class _SearchField extends StatelessWidget {
  const _SearchField();

  /// Biz_Clients.dc.html line 62: `width:280px; height:40px`.
  static const double _width = 280;
  static const double _height = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      padding: const EdgeInsets.symmetric(horizontal: AxSpace.s14),
      decoration: BoxDecoration(
        color: AxColors.surface,
        border: Border.all(color: AxColors.borderStrong),
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.xs)),
      ),
      child: Row(
        spacing: AxSpace.s8,
        children: [
          AxIcon(AxIcons.search, size: 14, color: AxColors.textFaint),
          Expanded(
            child: Text(
              kSearchHint,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AxType.text(AxType.labelSm, color: AxColors.textFaint),
            ),
          ),
        ],
      ),
    );
  }
}

class _ClientsTableCard extends StatelessWidget {
  const _ClientsTableCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s22,
        vertical: AxSpace.s6,
      ),
      decoration: BoxDecoration(
        color: AxColors.surface,
        border: Border.all(color: AxColors.border),
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.tile)),
      ),
      child: const ClientsTable(),
    );
  }
}

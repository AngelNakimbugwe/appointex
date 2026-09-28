import 'package:flutter/material.dart';

import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_gradients.dart';
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_sidebar.dart';
import '../../shell/biz_shell.dart';
import '../data/fixtures.dart';
import 'widgets/services_table.dart';

/// `/biz/services` — Biz_Services: the "Services" title with the add-service
/// chip and the services & pricing table, inside [BizShell].
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.canvas,
      body: BizShell(
        current: AxSidebarItem.services,
        child: const _ServicesContent(),
      ),
    );
  }
}

class _ServicesContent extends StatelessWidget {
  const _ServicesContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AxSpace.s16,
      children: const [
        _HeaderRow(),
        Expanded(child: _ServicesTableCard()),
      ],
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow();

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
        const _AddServiceChip(),
      ],
    );
  }
}

/// Biz_Services.dc.html line 64: `height:38px; padding:0 16px;
/// border-radius:19px; background:linear-gradient(135deg,#FEC89A,#FFB5A7)` —
/// those are the documented stops of `AxGradients.avatarPeach` (the
/// §AxPrimaryButton gradient precedent), and radius 19 on height 38 is a
/// stadium, so `StadiumBorder`.
class _AddServiceChip extends StatelessWidget {
  const _AddServiceChip();

  /// Biz_Services.dc.html line 64: `height:38px`.
  static const double _height = 38;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: const EdgeInsets.symmetric(horizontal: AxSpace.s16),
      alignment: Alignment.center,
      decoration: const ShapeDecoration(
        gradient: AxGradients.avatarPeach,
        shape: StadiumBorder(),
      ),
      child: Text(
        kAddServiceLabel,
        style: AxType.text(
          AxType.labelSm,
          weight: FontWeight.w700,
          color: AxColors.brand,
        ),
      ),
    );
  }
}

/// Biz_Services.dc.html line 67: the table card — `background:#FFFFFF;
/// border:1px solid #ECE7DC; border-radius:14px; padding:6px 22px`. Owns the
/// Active-column toggle state so taps flip the row.
class _ServicesTableCard extends StatefulWidget {
  const _ServicesTableCard();

  @override
  State<_ServicesTableCard> createState() => _ServicesTableCardState();
}

class _ServicesTableCardState extends State<_ServicesTableCard> {
  late final List<bool> _active = [for (final s in kServices) s.active];

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
      child: ServicesTable(
        active: _active,
        onToggle: (index) => setState(() => _active[index] = !_active[index]),
      ),
    );
  }
}

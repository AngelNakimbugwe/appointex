import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes.dart';
import '../../../../design/icons/ax_icon.dart';
import '../../../../design/icons/ax_icons.dart' show AxIcons;
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_gradients.dart';
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_primary_button.dart';
import '../data/fixtures.dart';

/// Client_Confirmation (`/confirmation`) — the success leg of the booking
/// flow. A centred hero and a summary card confirm the booking; the user can
/// jump to the booking or add it to their calendar.
class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key, this.confirmation = kConfirmation});

  final Confirmation confirmation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AxSpace.s32),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: AxSpace.s18,
                children: [
                  const Center(child: _Hero()),
                  _TitleBlock(
                    title: confirmation.title,
                    subtitle: confirmation.subtitle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: AxSpace.s6),
                    child: _DetailsCard(
                      details: confirmation.details,
                      amountLabel: confirmation.amountLabel,
                      amountValue: confirmation.amountValue,
                    ),
                  ),
                  Text(
                    confirmation.footnote,
                    textAlign: TextAlign.center,
                    style: AxType.text(
                      AxType.micro,
                      color: AxColors.textFaint,
                      height: 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: AxSpace.s2),
                    child: _Buttons(
                      primaryLabel: confirmation.primaryLabel,
                      secondaryLabel: confirmation.secondaryLabel,
                      onPrimary: () => context.go(AxRoutes.bookings),
                      onSecondary: () => context.go(AxRoutes.home),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// The 120×120 hero (Client_Confirmation.dc.html lines 19–27): gradient disc
/// with a white check, ringed by four confetti dots. The dots are plain
/// filled circles, not SVG assets (docs/05 "Not icons at all").
class _Hero extends StatelessWidget {
  const _Hero();

  static const double _boxSize = 120; // Client_Confirmation.dc.html:19
  static const double _discSize = 76; // Client_Confirmation.dc.html:24
  static const double _iconSize = 38; // Client_Confirmation.dc.html:25

  Widget _dot(double size, Color color) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _boxSize,
      height: _boxSize,
      child: Stack(
        children: [
          Positioned(
            top: AxSpace.s6,
            left: AxSpace.s14,
            child: _dot(AxSpace.s10, AxColors.roseGlow),
          ),
          Positioned(
            top: AxSpace.s20,
            right: AxSpace.s8,
            child: _dot(AxSpace.s8, AxColors.peach),
          ),
          Positioned(
            bottom: AxSpace.s10,
            left: AxSpace.s2,
            child: _dot(
              AxSpace.s12,
              AxColors.salmon.withValues(alpha: 0.85),
            ),
          ),
          Positioned(
            bottom: AxSpace.s18,
            right: AxSpace.s16,
            child: _dot(
              AxSpace.s9,
              AxColors.brand.withValues(alpha: 0.7),
            ),
          ),
          Center(
            child: Container(
              width: _discSize,
              height: _discSize,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AxGradients.avatarRose,
              ),
              child: const AxIcon(
                AxIcons.checkCircle24,
                size: _iconSize,
                color: AxColors.surface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Headline + WhatsApp note (lines 28–31), centred.
class _TitleBlock extends StatelessWidget {
  const _TitleBlock({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AxSpace.s6,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AxType.head(
            AxType.h4,
            weight: FontWeight.w800,
            color: AxColors.brand,
          ),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AxType.text(
            AxType.label,
            color: AxColors.textMuted,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

/// The summary card (lines 33–39): label/value rows, a rule, the amount held.
class _DetailsCard extends StatelessWidget {
  const _DetailsCard({
    required this.details,
    required this.amountLabel,
    required this.amountValue,
  });

  final List<ConfirmationDetail> details;
  final String amountLabel;
  final String amountValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AxSpace.s16),
      decoration: const BoxDecoration(
        color: AxColors.surfaceWarm,
        borderRadius: BorderRadius.all(Radius.circular(AxRadius.tile)),
      ),
      child: Column(
        spacing: AxSpace.s9,
        children: [
          for (final detail in details) _DetailRow(detail: detail),
          const _Rule(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  amountLabel,
                  style: AxType.text(
                    AxType.caption,
                    color: AxColors.textSubtle,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  amountValue,
                  textAlign: TextAlign.right,
                  style: AxType.text(
                    AxType.label,
                    weight: FontWeight.w800,
                    color: AxColors.brand,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.detail});

  final ConfirmationDetail detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            detail.label,
            style: AxType.text(AxType.caption, color: AxColors.textSubtle),
          ),
        ),
        Flexible(
          child: Text(
            detail.value,
            textAlign: TextAlign.right,
            style: AxType.text(
              AxType.labelSm,
              weight: FontWeight.w700,
              color: AxColors.brand,
            ),
          ),
        ),
      ],
    );
  }
}

/// `height:1px; background:#E8E3D8; margin:2px 0` — line 37.
class _Rule extends StatelessWidget {
  const _Rule();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: AxSpace.s2),
      color: AxColors.borderSoft,
    );
  }
}

/// "View booking" and "Add to calendar" (lines 43–50) — 48 px stadium pair.
class _Buttons extends StatelessWidget {
  const _Buttons({
    required this.primaryLabel,
    required this.secondaryLabel,
    required this.onPrimary,
    this.onSecondary,
  });

  static const double _buttonHeight = 48; // Client_Confirmation.dc.html:44

  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback onPrimary;
  final VoidCallback? onSecondary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AxSpace.s10,
      children: [
        AxPrimaryButton(
          label: primaryLabel,
          height: _buttonHeight,
          labelSize: AxType.body14,
          onPressed: onPrimary,
        ),
        AxPrimaryButton(
          label: secondaryLabel,
          height: _buttonHeight,
          labelSize: AxType.body14,
          style: AxButtonStyle.outline,
          onPressed: onSecondary,
        ),
      ],
    );
  }
}

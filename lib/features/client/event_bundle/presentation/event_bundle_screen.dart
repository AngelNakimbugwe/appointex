import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes.dart';
import '../../../../design/icons/ax_icon.dart';
import '../../../../design/icons/ax_icons.dart' show AxIcons;
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_avatar.dart';
import '../../../../design/widgets/ax_chip.dart';
import '../../../../design/widgets/ax_primary_button.dart';
import '../data/fixtures.dart';

/// Client_EventBundle — plan an event (`/event`). The user names the event
/// type, sees the date and the assembled provider team, and reviews the
/// bundle total before paying.
class EventBundleScreen extends StatelessWidget {
  const EventBundleScreen({super.key, this.bundle = kEventBundle});

  final EventBundle bundle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            _HeaderBar(
              title: bundle.title,
              onBack: () => context.canPop()
                  ? context.pop()
                  : context.go(AxRoutes.home),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AxSpace.s18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: AxSpace.s20,
                  children: [
                    _IntroSection(bundle: bundle),
                    _DateCard(
                      dateLabel: bundle.dateLabel,
                      changeLabel: bundle.changeLabel,
                    ),
                    _TeamSection(bundle: bundle),
                  ],
                ),
              ),
            ),
            _FooterBar(
              providersLabel: bundle.providersLabel,
              totalLabel: bundle.totalLabel,
              ctaLabel: bundle.ctaLabel,
              onCta: () => context.go(AxRoutes.checkout),
            ),
          ],
        ),
      ),
    );
  }
}

/// Client_EventBundle.dc.html line 19: `height:56px; gap:14px; padding:0 16px;
/// border-bottom:1px solid #ECE7DC`, back arrow + Manrope 16/700 title.
class _HeaderBar extends StatelessWidget {
  const _HeaderBar({required this.title, required this.onBack});

  static const double _height = 56; // Client_EventBundle.dc.html:19

  final String title;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      padding: const EdgeInsets.symmetric(horizontal: AxSpace.s16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AxColors.border)),
      ),
      child: Row(
        spacing: AxSpace.s14,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onBack,
            child: const AxIcon(
              AxIcons.chevronLeft,
              size: 19,
              color: AxColors.brand,
            ),
          ),
          Text(
            title,
            style: AxType.head(AxType.title, color: AxColors.brand),
          ),
        ],
      ),
    );
  }
}

/// Intro line + the `.etype` chip row (lines 25–33), horizontally scrollable
/// per docs/04 §AxChip.
class _IntroSection extends StatelessWidget {
  const _IntroSection({required this.bundle});

  final EventBundle bundle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s10,
      children: [
        Text(
          bundle.intro,
          style: AxType.text(AxType.labelSm, color: AxColors.textMuted),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: AxSpace.s8,
            children: [
              for (final type in bundle.types)
                AxChip(
                  label: type.label,
                  selected: type.selected,
                  type: true,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

/// The date strip — lines 35–41.
class _DateCard extends StatelessWidget {
  const _DateCard({required this.dateLabel, required this.changeLabel});

  final String dateLabel;
  final String changeLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s14,
        vertical: AxSpace.s12,
      ),
      decoration: const BoxDecoration(
        color: AxColors.surfaceWarm,
        borderRadius: BorderRadius.all(Radius.circular(AxRadius.card)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              spacing: AxSpace.s10,
              children: [
                const AxIcon(AxIcons.calendar, size: 17, color: AxColors.brand),
                Flexible(
                  child: Text(
                    dateLabel,
                    style: AxType.text(
                      AxType.label,
                      weight: FontWeight.w600,
                      color: AxColors.brand,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            changeLabel,
            style: AxType.text(
              AxType.caption,
              weight: FontWeight.w700,
              color: AxColors.brandMid,
            ),
          ),
        ],
      ),
    );
  }
}

/// "Your event team" — lines 43–77.
class _TeamSection extends StatelessWidget {
  const _TeamSection({required this.bundle});

  final EventBundle bundle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s10,
      children: [
        Text(
          bundle.teamLabel,
          style: AxType.head(AxType.bodySm, color: AxColors.brand),
        ),
        for (final service in bundle.services)
          _ServiceRow(service: service),
        _AddServiceRow(label: bundle.addServiceLabel),
      ],
    );
  }
}

class _ServiceRow extends StatelessWidget {
  const _ServiceRow({required this.service});

  static const double _avatarSize = 38; // Client_EventBundle.dc.html:47
  static const double _avatarRadius = 10; // Client_EventBundle.dc.html:47

  final EventBundleService service;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AxSpace.s12),
      decoration: BoxDecoration(
        border: Border.all(color: AxColors.border),
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.card)),
      ),
      child: Row(
        spacing: AxSpace.s12,
        children: [
          AxAvatar(
            size: _avatarSize,
            radius: _avatarRadius,
            art: service.art,
            gradient: service.gradient,
            artScale: service.artScale,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AxSpace.s2,
              children: [
                Text(
                  service.title,
                  style: AxType.text(
                    AxType.label,
                    weight: FontWeight.w700,
                    color: AxColors.brand,
                  ),
                ),
                Text(
                  service.detail,
                  style: AxType.text(
                    AxType.captionSm,
                    color: AxColors.textSubtle,
                  ),
                ),
              ],
            ),
          ),
          const AxIcon(AxIcons.check, size: 18, color: AxColors.verified),
        ],
      ),
    );
  }
}

/// The dashed "Add another service" affordance — lines 73–76.
class _AddServiceRow extends StatelessWidget {
  const _AddServiceRow({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: const _DashedBorderPainter(
        color: AxColors.dividerWarm,
        radius: AxRadius.card,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AxSpace.s13),
        child: Row(
          spacing: AxSpace.s10,
          children: [
            const AxIcon(AxIcons.plus24, size: 16, color: AxColors.brandMid),
            Flexible(
              child: Text(
                label,
                style: AxType.text(
                  AxType.labelSm,
                  weight: FontWeight.w600,
                  color: AxColors.brandMid,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// `1.5px dashed` rounded-rect border — Client_EventBundle.dc.html line 73.
/// CSS `dashed` alternates 3×/3× the border width (4.5 px on 4.5 px here).
class _DashedBorderPainter extends CustomPainter {
  const _DashedBorderPainter({
    required this.color,
    required this.radius,
  });

  static const double _strokeWidth = 1.5;
  static const double _dashLength = 4.5;
  static const double _gapLength = 4.5;

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(radius)),
      );
    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      var start = 0.0;
      while (start < metric.length) {
        final end = math.min(start + _dashLength, metric.length);
        canvas.drawPath(metric.extractPath(start, end), paint);
        start = end + _gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.radius != radius;
  }
}

/// The fixed summary bar — lines 80–88.
class _FooterBar extends StatelessWidget {
  const _FooterBar({
    required this.providersLabel,
    required this.totalLabel,
    required this.ctaLabel,
    required this.onCta,
  });

  final String providersLabel;
  final String totalLabel;
  final String ctaLabel;
  final VoidCallback onCta;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(AxSpace.s18, AxSpace.s14, AxSpace.s18, AxSpace.s22),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AxColors.border)),
      ),
      child: Row(
        spacing: AxSpace.s14,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                providersLabel,
                style: AxType.text(AxType.captionSm, color: AxColors.textSubtle),
              ),
              Text(
                totalLabel,
                style: AxType.text(
                  AxType.body,
                  weight: FontWeight.w800,
                  color: AxColors.brand,
                ),
              ),
            ],
          ),
          Expanded(
            child: AxPrimaryButton(
              label: ctaLabel,
              labelSize: AxType.body,
              onPressed: onCta,
            ),
          ),
        ],
      ),
    );
  }
}

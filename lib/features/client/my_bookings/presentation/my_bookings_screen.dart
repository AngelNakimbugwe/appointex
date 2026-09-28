import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_gradients.dart';
import '../../../../design/tokens/ax_radius.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_bottom_nav.dart';
import '../data/fixtures.dart';

/// Client_MyBookings — the Bookings tab (`/bookings`): upcoming cards with a
/// confirmed status pill, a PAST section, and one past card carrying rebook /
/// review actions. Tabs are visual (the artboard is static); filtering is
/// Phase 4.
class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  static const double _pastSectionTopGap = 6; // margin-top:6px — Client_MyBookings.dc.html line 52

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(
                AxSpace.s18,
                AxSpace.s20,
                AxSpace.s18,
                AxSpace.s8,
              ),
              child: Text(
                kMyBookingsTitle,
                style: AxType.head(
                  AxType.h5,
                  weight: FontWeight.w800,
                  color: AxColors.brand,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(AxSpace.s18, AxSpace.s10, AxSpace.s18, 0),
              child: Row(
                spacing: AxSpace.s22,
                children: [
                  _BookingTab(label: kMyBookingsUpcomingTab, active: true),
                  _BookingTab(label: kMyBookingsPastTab, active: false),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AxSpace.s18,
                  vertical: AxSpace.s14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: AxSpace.s12,
                  children: [
                    for (final booking in kMyBookingsUpcoming)
                      _UpcomingBookingCard(booking: booking),
                    Padding(
                      padding: const EdgeInsets.only(top: _pastSectionTopGap),
                      child: Text(
                        kMyBookingsPastSectionLabel.toUpperCase(),
                        style: AxType.text(
                          AxType.captionSm,
                          weight: FontWeight.w700,
                          color: AxColors.textFaint,
                          letterSpacingEm: 0.05,
                        ),
                      ),
                    ),
                    for (final booking in kMyBookingsPast)
                      _PastBookingCard(booking: booking),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MediaQuery.withClampedTextScaling(
        maxScaleFactor: 1.2,
        child: AxBottomNav(
          current: AxNavItem.bookings,
          onTap: (item) {
            switch (item) {
              case AxNavItem.home:
                context.go(AxRoutes.home);
              case AxNavItem.bookings:
                context.go(AxRoutes.bookings);
              case AxNavItem.chat:
                context.go(AxRoutes.chat);
              case AxNavItem.profile:
                context.go(AxRoutes.profile);
            }
          },
        ),
      ),
    );
  }
}

class _BookingTab extends StatelessWidget {
  const _BookingTab({required this.label, required this.active});

  static const double _underlineWidth = 2.5; // border-bottom:2.5px solid #FFB5A7 — Client_MyBookings.dc.html line 23

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: AxSpace.s10),
      decoration: BoxDecoration(
        border: active
            ? const Border(
                bottom: BorderSide(color: AxColors.salmon, width: _underlineWidth),
              )
            : null,
      ),
      child: Text(
        label,
        style: active
            ? AxType.text(
                AxType.bodySm,
                weight: FontWeight.w700,
                color: AxColors.brand,
              )
            : AxType.text(
                AxType.bodySm,
                weight: FontWeight.w600,
                color: AxColors.textFaint,
              ),
      ),
    );
  }
}

class _DateBadge extends StatelessWidget {
  const _DateBadge({
    required this.month,
    required this.day,
    required this.active,
  });

  static const double _width = 46; // width:46px — Client_MyBookings.dc.html line 29

  final String month;
  final String day;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      padding: const EdgeInsets.symmetric(vertical: AxSpace.s8),
      decoration: BoxDecoration(
        color: active ? AxColors.brand : AxColors.panelNeutral,
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.md)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            month,
            style: AxType.text(
              AxType.nano,
              weight: FontWeight.w700,
              color: active ? AxColors.peach : AxColors.textFaint,
            ),
          ),
          Text(
            day,
            style: AxType.text(
              AxType.title,
              weight: FontWeight.w800,
              color: active ? AxColors.surface : AxColors.textBody,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s9,
        vertical: AxSpace.s4,
      ),
      decoration: const BoxDecoration(
        color: AxColors.verifiedBg,
        borderRadius: BorderRadius.all(Radius.circular(AxRadius.sm)),
      ),
      child: Text(
        label,
        style: AxType.text(
          AxType.microSm,
          weight: FontWeight.w700,
          color: AxColors.verified,
        ),
      ),
    );
  }
}

class _UpcomingBookingCard extends StatelessWidget {
  const _UpcomingBookingCard({required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AxSpace.s13),
      decoration: BoxDecoration(
        border: Border.all(color: AxColors.border),
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.tile)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AxSpace.s12,
        children: [
          _DateBadge(month: booking.month, day: booking.day, active: true),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AxSpace.s3,
              children: [
                Text(
                  booking.title,
                  style: AxType.text(
                    AxType.bodySm,
                    weight: FontWeight.w700,
                    color: AxColors.brand,
                  ),
                ),
                Text(
                  booking.detail,
                  style: AxType.text(AxType.caption, color: AxColors.textSubtle),
                ),
              ],
            ),
          ),
          if (booking.status case final status?)
            _StatusPill(label: status),
        ],
      ),
    );
  }
}

class _PastBookingCard extends StatelessWidget {
  const _PastBookingCard({required this.booking});

  static const double _actionsLeftInset = 58; // padding-left:58px — Client_MyBookings.dc.html line 65
  static const double _actionsGap = 8; // gap:8px — Client_MyBookings.dc.html line 65

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.85,
      child: Container(
        padding: const EdgeInsets.all(AxSpace.s13),
        decoration: BoxDecoration(
          border: Border.all(color: AxColors.border),
          borderRadius: const BorderRadius.all(Radius.circular(AxRadius.tile)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AxSpace.s9,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AxSpace.s12,
              children: [
                _DateBadge(month: booking.month, day: booking.day, active: false),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AxSpace.s3,
                    children: [
                      Text(
                        booking.title,
                        style: AxType.text(
                          AxType.bodySm,
                          weight: FontWeight.w700,
                          color: AxColors.brand,
                        ),
                      ),
                      Text(
                        booking.detail,
                        style: AxType.text(
                          AxType.caption,
                          color: AxColors.textSubtle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: _actionsLeftInset),
              child: Wrap(
                spacing: _actionsGap,
                runSpacing: _actionsGap,
                children: [
                  _GradientActionPill(label: kMyBookingsRebookLabel),
                  _OutlineActionPill(label: kMyBookingsReviewLabel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GradientActionPill extends StatelessWidget {
  const _GradientActionPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s14,
        vertical: AxSpace.s8,
      ),
      decoration: const BoxDecoration(
        gradient: AxGradients.avatarPeach,
        borderRadius: BorderRadius.all(Radius.circular(AxRadius.lg)),
      ),
      child: Text(
        label,
        style: AxType.text(
          AxType.caption,
          weight: FontWeight.w700,
          color: AxColors.brand,
        ),
      ),
    );
  }
}

class _OutlineActionPill extends StatelessWidget {
  const _OutlineActionPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s14,
        vertical: AxSpace.s8,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AxColors.borderStrong),
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.lg)),
      ),
      child: Text(
        label,
        style: AxType.text(
          AxType.caption,
          weight: FontWeight.w600,
          color: AxColors.textPrimary,
        ),
      ),
    );
  }
}

/// Copy and rows from `.design-src/Biz_Dashboard.dc.html`, verbatim.
library;

import 'package:flutter/material.dart';

import '../../../../design/tokens/ax_colors.dart';

const String kGreeting = 'Good morning, Patricia';
const String kDateLine = 'Wednesday, 26 August';

/// One `.stat` tile: label, value and its `border-top-color`.
class DashboardStat {
  const DashboardStat({
    required this.label,
    required this.value,
    required this.accent,
  });

  final String label;
  final String value;
  final Color accent;
}

const List<DashboardStat> kStats = [
  DashboardStat(
    label: "Today's bookings",
    value: '6',
    accent: AxColors.salmon,
  ),
  DashboardStat(
    label: "Today's takings",
    value: 'UGX 410K',
    accent: AxColors.salmon,
  ),
  DashboardStat(
    label: 'Held, pending payout',
    value: 'UGX 96K',
    accent: AxColors.peach,
  ),
  DashboardStat(
    label: 'Rating',
    value: '5.0 ★',
    accent: AxColors.brandMid,
  ),
];

const String kScheduleTitle = "Today's schedule";
const String kStatusConfirmed = 'Confirmed';
const String kStatusPending = 'Pending';

/// One row of the Today's schedule card.
class ScheduleEntry {
  const ScheduleEntry({
    required this.time,
    required this.client,
    required this.service,
    required this.confirmed,
  });

  final String time;
  final String client;
  final String service;
  final bool confirmed;

  String get status => confirmed ? kStatusConfirmed : kStatusPending;
}

const List<ScheduleEntry> kSchedule = [
  ScheduleEntry(
    time: '9:00 am',
    client: 'Aisha K.',
    service: 'Everyday glam',
    confirmed: true,
  ),
  ScheduleEntry(
    time: '12:00 pm',
    client: 'Diana N.',
    service: 'Bridal makeup, full glam',
    confirmed: true,
  ),
  ScheduleEntry(
    time: '3:30 pm',
    client: 'Ruth M.',
    service: 'Photoshoot makeup',
    confirmed: false,
  ),
];

const String kReviewsTitle = 'Recent reviews';

/// Biz_Dashboard.dc.html line 97: five `12px` filled stars.
const int kReviewStars = 5;

const String kReviewQuote =
    '“Patricia made me look and feel amazing on my big day.”';
const String kReviewAuthor = '— Diana N.';

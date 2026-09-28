/// Copy and rows from `.design-src/Biz_Settings.dc.html`, verbatim.
library;

import 'package:flutter/material.dart';

import '../../../../design/tokens/ax_gradients.dart';

const String kPageTitle = 'Settings';

const String kBusinessProfileTitle = 'Business profile';
const String kBusinessName = 'Patricia Glam Studio';
const String kBusinessLocation = 'Makeup · Kampala, Kansanga';
const String kPortfolioSummary = '12 photos, 2 videos on your profile';
const String kManagePortfolio = 'Manage portfolio';

const String kTeamTitle = 'Team';

/// One team row of the Team card.
class TeamMember {
  const TeamMember({required this.name, required this.role, required this.gradient});

  final String name;
  final String role;
  final Gradient gradient;
}

const List<TeamMember> kTeam = [
  TeamMember(
    name: 'Gukiina Patricia',
    role: 'Owner',
    gradient: AxGradients.avatarPale,
  ),
  TeamMember(
    name: 'Sarah Nakato',
    role: 'Assistant',
    gradient: AxGradients.avatarSand,
  ),
];

const String kUrgentTitle = 'Urgent bookings';
const String kUrgentDescription =
    'Show up when clients need someone today. Only slots you actually have open are offered, based on your calendar.';

/// One rush-rate tile of the Urgent bookings card.
class RushRate {
  const RushRate({required this.label, required this.value});

  final String label;
  final String value;
}

const List<RushRate> kUrgentRates = [
  RushRate(label: 'Today', value: '+15%'),
  RushRate(label: '3 hrs', value: '+25%'),
  RushRate(label: 'ASAP', value: '+40%'),
];

const String kUrgentFootnote =
    'Platform-set rates, shown to clients before they book. Appointex takes a larger share of the rush portion only.';

const String kMobileTitle = 'Mobile service';
const String kMobileDescription =
    "Travel to a client's home or venue instead of your salon. They pay a small travel fee on top of your service price — your rate stays the same.";
const String kTravelFeeLabel = 'Client travel fee';
const String kTravelFeeValue = '+5%';
const String kMobileFootnote =
    'Platform-set rate, shown to clients before they book. Your standard commission still applies to the service price only.';

const String kPayoutTitle = 'Payout account';
const String kPayoutAccount = 'MTN Mobile Money, ending 4456';
const String kPayoutChange = 'Change';

const String kCommissionTitle = 'Commission plan';
const String kCurrentPlanEyebrow = 'CURRENT PLAN';
const String kCurrentPlanValue = '9%';
const String kCurrentPlanDescription = 'Standard rate, no conditions';
const String kAvailablePlanEyebrow = 'AVAILABLE';
const String kAvailablePlanValue = '5%';
const String kAvailablePlanDescription =
    'Reduced rate for providers who keep bookings and payments on Appointex';
const String kCommissionFootnote =
    'You qualify for the reduced rate once your last 20 bookings were all booked and paid in the app. Your progress: 14 of 20.';

const String kNotificationsTitle = 'Notifications';
const String kNotifyBookings = 'New booking requests';
const String kNotifyPayouts = 'Payout confirmations';
const String kNotifyMarketing = 'Marketing tips';

/// Toggle states as drawn in the artboard (on / on / on / on / off).
const bool kUrgentEnabled = true;
const bool kMobileEnabled = true;
const bool kBookingRequestsEnabled = true;
const bool kPayoutConfirmationsEnabled = true;
const bool kMarketingTipsEnabled = false;

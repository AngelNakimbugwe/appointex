/// Fixture data for Client_MyBookings — every string is verbatim from
/// .design-src/Client_MyBookings.dc.html.
class Booking {
  const Booking({
    required this.month,
    required this.day,
    required this.title,
    required this.detail,
    this.status,
    this.past = false,
  });

  /// Date-badge month label, already uppercase in the artboard ('AUG').
  final String month;

  /// Date-badge day label ('26').
  final String day;

  final String title;
  final String detail;

  /// Status pill label ('Confirmed'); null on past bookings.
  final String? status;

  /// Past bookings render the muted date badge, the 0.85 card opacity and
  /// the rebook / review action row.
  final bool past;
}

const String kMyBookingsTitle = 'My bookings';
const String kMyBookingsUpcomingTab = 'Upcoming';
const String kMyBookingsPastTab = 'Past';
const String kMyBookingsPastSectionLabel = 'Past';
const String kMyBookingsRebookLabel = 'Rebook';
const String kMyBookingsReviewLabel = 'Leave a review';

const List<Booking> kMyBookingsUpcoming = [
  Booking(
    month: 'AUG',
    day: '26',
    title: 'Patricia Glam Studio',
    detail: 'Bridal makeup, full glam · 12:00 pm',
    status: 'Confirmed',
  ),
  Booking(
    month: 'SEP',
    day: '12',
    title: 'Event: Wedding team',
    detail: 'Hair, makeup & photography · from 9:00 am',
    status: 'Confirmed',
  ),
];

const List<Booking> kMyBookingsPast = [
  Booking(
    month: 'JUL',
    day: '14',
    title: 'Grace Nabbosa Braids',
    detail: 'Box braids · Completed',
    past: true,
  ),
];

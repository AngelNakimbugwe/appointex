/// Copy and rows from `.design-src/Biz_Calendar.dc.html`, verbatim.
library;

const String kPageTitle = 'Calendar';
const String kWeekRange = '24 to 30 August';
const String kMakeAppointment = '+ Make an appointment';

/// The three `.appt` colour families in the artboard: confirmed
/// (`#EAF3EC` / `#2E8B57`), pending (`#FBF3E7` / `#9A6B1E`) and the
/// Saturday wedding block (`#6B3F3A` with `#FEC89A` time text).
enum AppointmentTone { confirmed, pending, wedding }

/// One `.appt` block inside a `.daycol`.
class CalendarAppointment {
  const CalendarAppointment({
    required this.time,
    required this.client,
    required this.tone,
  });

  final String time;
  final String client;
  final AppointmentTone tone;
}

/// One `.daycol`: the weekday label plus its appointment blocks. [today] is
/// the `WED 26` highlight pill.
class CalendarDay {
  const CalendarDay({
    required this.label,
    this.today = false,
    this.appointments = const [],
  });

  final String label;
  final bool today;
  final List<CalendarAppointment> appointments;
}

const List<CalendarDay> kWeek = [
  CalendarDay(
    label: 'MON 24',
    appointments: [
      CalendarAppointment(
        time: '9:00',
        client: 'Aisha K.',
        tone: AppointmentTone.confirmed,
      ),
    ],
  ),
  CalendarDay(label: 'TUE 25'),
  CalendarDay(
    label: 'WED 26',
    today: true,
    appointments: [
      CalendarAppointment(
        time: '9:00',
        client: 'Aisha K.',
        tone: AppointmentTone.confirmed,
      ),
      CalendarAppointment(
        time: '12:00',
        client: 'Diana N.',
        tone: AppointmentTone.confirmed,
      ),
      CalendarAppointment(
        time: '3:30',
        client: 'Ruth M. · pending',
        tone: AppointmentTone.pending,
      ),
    ],
  ),
  CalendarDay(
    label: 'THU 27',
    appointments: [
      CalendarAppointment(
        time: '2:00',
        client: 'Fiona T.',
        tone: AppointmentTone.confirmed,
      ),
    ],
  ),
  CalendarDay(label: 'FRI 28'),
  CalendarDay(
    label: 'SAT 29',
    appointments: [
      CalendarAppointment(
        time: '9:00',
        client: 'Wedding: Namono',
        tone: AppointmentTone.wedding,
      ),
    ],
  ),
  CalendarDay(label: 'SUN 30'),
];

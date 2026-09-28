import 'package:flutter/material.dart';

import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_gradients.dart';

enum BookDayState { open, partial, unavailable, selected }

class BookDay {
  const BookDay(this.label, [this.state = BookDayState.open]);

  final String? label;
  final BookDayState state;
}

enum BookSlotState { available, selected, disabled }

class BookSlot {
  const BookSlot(this.label, [this.state = BookSlotState.available]);

  final String label;
  final BookSlotState state;
}

class BookLocationOption {
  const BookLocationOption({
    required this.icon,
    required this.label,
    this.note,
    this.selected = false,
  });

  final String icon;
  final String label;
  final String? note;
  final bool selected;
}

class BookLegendItem {
  const BookLegendItem({required this.label, this.color, this.gradient});

  final String label;
  final Color? color;
  final Gradient? gradient;
}

class BookAppointment {
  const BookAppointment({
    required this.title,
    required this.rushLabel,
    required this.locationTitle,
    required this.locations,
    required this.monthLabel,
    required this.weekdays,
    required this.days,
    required this.legend,
    required this.timesTitle,
    required this.slots,
    required this.summaryTitle,
    required this.serviceName,
    required this.servicePrice,
    required this.detailLine,
    required this.locationLine,
    required this.continueLabel,
  });

  final String title;
  final String rushLabel;
  final String locationTitle;
  final List<BookLocationOption> locations;
  final String monthLabel;
  final List<String> weekdays;
  final List<BookDay> days;
  final List<BookLegendItem> legend;
  final String timesTitle;
  final List<BookSlot> slots;
  final String summaryTitle;
  final String serviceName;
  final String servicePrice;
  final String detailLine;
  final String locationLine;
  final String continueLabel;
}

const kBookWeekdays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

const kBookDays = [
  BookDay(null),
  BookDay(null),
  BookDay(null),
  BookDay(null),
  BookDay(null),
  BookDay(null),
  BookDay('1'),
  BookDay('2'),
  BookDay('3'),
  BookDay('4'),
  BookDay('5'),
  BookDay('6'),
  BookDay('7'),
  BookDay('8'),
  BookDay('9'),
  BookDay('10'),
  BookDay('11'),
  BookDay('12'),
  BookDay('13'),
  BookDay('14'),
  BookDay('15'),
  BookDay('16'),
  BookDay('17'),
  BookDay('18'),
  BookDay('19'),
  BookDay('20', BookDayState.unavailable),
  BookDay('21'),
  BookDay('22'),
  BookDay('23'),
  BookDay('24', BookDayState.partial),
  BookDay('25'),
  BookDay('26', BookDayState.selected),
  BookDay('27', BookDayState.partial),
  BookDay('28'),
  BookDay('29', BookDayState.unavailable),
  BookDay('30'),
  BookDay('31'),
  BookDay(null),
  BookDay(null),
  BookDay(null),
  BookDay(null),
  BookDay(null),
];

const kBookLocations = [
  BookLocationOption(icon: AxIcons.store, label: 'At the salon'),
  BookLocationOption(
    icon: AxIcons.mapPin20,
    label: 'At my location',
    note: '+5% mobile fee',
    selected: true,
  ),
];

const kBookSlots = [
  BookSlot('9:00 am'),
  BookSlot('10:30 am'),
  BookSlot('12:00 pm', BookSlotState.selected),
  BookSlot('1:30 pm'),
  BookSlot('3:00 pm', BookSlotState.disabled),
  BookSlot('4:30 pm'),
];

const kBookLegend = [
  BookLegendItem(label: 'Some booked', color: AxColors.salmon),
  BookLegendItem(label: 'Fully booked', gradient: AxGradients.avatarBlush),
  BookLegendItem(label: 'Selected', color: AxColors.brand),
];

const kBookAppointment = BookAppointment(
  title: 'Make an appointment',
  rushLabel: '+25% rush',
  locationTitle: 'Where would you like this?',
  locations: kBookLocations,
  monthLabel: 'August 2026',
  weekdays: kBookWeekdays,
  days: kBookDays,
  legend: kBookLegend,
  timesTitle: 'Available times, Wed 26 Aug',
  slots: kBookSlots,
  summaryTitle: 'Appointment summary',
  serviceName: 'Bridal makeup, full glam',
  servicePrice: 'UGX 180,000',
  detailLine: 'Patricia Glam Studio · Wed 26 Aug, 12:00 pm',
  locationLine: 'At my location · +5% mobile fee',
  continueLabel: 'Continue to checkout',
);

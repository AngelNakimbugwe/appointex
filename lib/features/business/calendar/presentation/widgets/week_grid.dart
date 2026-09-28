import 'package:flutter/material.dart';

import '../../../../../design/tokens/ax_colors.dart';
import '../../../../../design/tokens/ax_radius.dart';
import '../../../../../design/tokens/ax_space.dart';
import '../../../../../design/tokens/ax_type.dart';
import '../../data/fixtures.dart';

/// The week grid — the `flex:1` body of Biz_Calendar: white card, `1px solid
/// #ECE7DC`, radius 14, `padding:16px 12px`, holding the seven `.daycol`
/// columns. Tier 3 per docs/04-COMPONENT-INVENTORY.md — `.daycol` / `.appt`
/// stay local to the Calendar feature.
class WeekGrid extends StatelessWidget {
  const WeekGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s12,
        vertical: AxSpace.s16,
      ),
      decoration: BoxDecoration(
        color: AxColors.surface,
        border: Border.all(color: AxColors.border),
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.tile)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < kWeek.length; i++)
            Expanded(child: _DayColumn(day: kWeek[i], showLeftBorder: i > 0)),
        ],
      ),
    );
  }
}

/// `.daycol` — `flex:1; flex-direction:column; gap:8px;
/// border-left:1px solid #F1EEE6; padding:0 8px` (first column has
/// `border-left:none`).
class _DayColumn extends StatelessWidget {
  const _DayColumn({required this.day, required this.showLeftBorder});

  final CalendarDay day;
  final bool showLeftBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AxSpace.s8),
      decoration: showLeftBorder
          ? const BoxDecoration(
              border: Border(left: BorderSide(color: AxColors.panelWarm)),
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AxSpace.s8,
        children: [
          _DayHeader(label: day.label, today: day.today),
          for (final appointment in day.appointments)
            _AppointmentBlock(appointment: appointment),
        ],
      ),
    );
  }
}

class _DayHeader extends StatelessWidget {
  const _DayHeader({required this.label, required this.today});

  /// Biz_Calendar.dc.html line 81: `border-radius:6px` on the today pill.
  static const double _todayRadius = 6;

  final String label;
  final bool today;

  @override
  Widget build(BuildContext context) {
    if (today) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: AxSpace.s2),
        decoration: const BoxDecoration(
          color: AxColors.surfaceWarm,
          borderRadius: BorderRadius.all(Radius.circular(_todayRadius)),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: AxType.head(
            AxType.micro,
            weight: FontWeight.w800,
            color: AxColors.brand,
          ),
        ),
      );
    }
    return Text(
      label,
      textAlign: TextAlign.center,
      style: AxType.text(
        AxType.micro,
        weight: FontWeight.w700,
        color: AxColors.textFaint,
      ),
    );
  }
}

/// `.appt` — `border-radius:8px; padding:7px 9px; flex-direction:column;
/// gap:2px`, time 10.5/700 above the client name at 10.5/400.
class _AppointmentBlock extends StatelessWidget {
  const _AppointmentBlock({required this.appointment});

  final CalendarAppointment appointment;

  @override
  Widget build(BuildContext context) {
    final (background, timeColor, clientColor) = switch (appointment.tone) {
      AppointmentTone.confirmed => (
          AxColors.verifiedBg,
          AxColors.verified,
          AxColors.verified,
        ),
      AppointmentTone.pending => (
          AxColors.pendingBg,
          AxColors.pending,
          AxColors.pending,
        ),
      AppointmentTone.wedding => (
          AxColors.brand,
          AxColors.peach,
          AxColors.surface,
        ),
    };
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AxSpace.s9,
        vertical: AxSpace.s7,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.sm)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AxSpace.s2,
        children: [
          Text(
            appointment.time,
            style: AxType.text(
              AxType.microSm,
              weight: FontWeight.w700,
              color: timeColor,
            ),
          ),
          Text(
            appointment.client,
            style: AxType.text(AxType.microSm, color: clientColor),
          ),
        ],
      ),
    );
  }
}

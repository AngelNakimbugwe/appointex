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
import '../data/fixtures.dart';
import 'widgets/month_picker.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key, this.appointment = kBookAppointment});

  final BookAppointment appointment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            _HeaderBar(
              title: appointment.title,
              rushLabel: appointment.rushLabel,
              onBack: () => context.canPop()
                  ? context.pop()
                  : context.go(AxRoutes.home),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(AxSpace.s18, AxSpace.s16, AxSpace.s18, AxSpace.s16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: AxSpace.s13,
                  children: [
                    _LocationSection(
                      title: appointment.locationTitle,
                      options: appointment.locations,
                    ),
                    BookMonthPicker(
                      monthLabel: appointment.monthLabel,
                      weekdays: appointment.weekdays,
                      days: appointment.days,
                      legend: appointment.legend,
                    ),
                    _TimeSlots(title: appointment.timesTitle, slots: appointment.slots),
                    _SummaryCard(appointment: appointment),
                  ],
                ),
              ),
            ),
            _FooterBar(
              label: appointment.continueLabel,
              onPressed: () => context.go(AxRoutes.checkout),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderBar extends StatelessWidget {
  const _HeaderBar({required this.title, required this.rushLabel, required this.onBack});

  static const double _height = 56; // Client_Book.dc.html:21

  final String title;
  final String rushLabel;
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
            child: const AxIcon(AxIcons.chevronLeft, size: 19, color: AxColors.brand),
          ),
          Expanded(
            child: Text(
              title,
              style: AxType.head(AxType.title, color: AxColors.brand),
            ),
          ),
          _RushPill(label: rushLabel),
        ],
      ),
    );
  }
}

class _RushPill extends StatelessWidget {
  const _RushPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AxSpace.s9, vertical: AxSpace.s5),
      decoration: const BoxDecoration(
        color: AxColors.urgentBgSoft,
        borderRadius: BorderRadius.all(Radius.circular(AxRadius.md)),
      ),
      child: Row(
        spacing: AxSpace.s4,
        children: [
          const AxIcon(AxIcons.boltFill, size: 10, color: AxColors.urgentTo),
          Text(
            label,
            style: AxType.text(AxType.nano, weight: FontWeight.w800, color: AxColors.urgentTo),
          ),
        ],
      ),
    );
  }
}

class _LocationSection extends StatelessWidget {
  const _LocationSection({required this.title, required this.options});

  final String title;
  final List<BookLocationOption> options;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s7,
      children: [
        Text(
          title,
          style: AxType.head(AxType.labelSm, color: AxColors.brand),
        ),
        Row(
          spacing: AxSpace.s9,
          children: [
            for (final option in options) Expanded(child: _LocationCard(option: option)),
          ],
        ),
      ],
    );
  }
}

class _LocationCard extends StatelessWidget {
  const _LocationCard({required this.option});

  final BookLocationOption option;

  @override
  Widget build(BuildContext context) {
    final selected = option.selected;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AxSpace.s6, vertical: AxSpace.s9),
      decoration: BoxDecoration(
        color: selected ? AxColors.escrowBg : null,
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.card)),
        border: Border.all(
          color: selected ? AxColors.escrow : AxColors.borderStrong,
          width: selected ? 2 : 1,
        ),
      ),
      child: Column(
        spacing: AxSpace.s3,
        children: [
          AxIcon(
            option.icon,
            size: 15,
            color: selected ? AxColors.escrow : AxColors.textSubtle,
          ),
          Text(
            option.label,
            textAlign: TextAlign.center,
            style: selected
                ? AxType.text(AxType.micro, weight: FontWeight.w700, color: AxColors.escrow)
                : AxType.text(AxType.micro, weight: FontWeight.w600, color: AxColors.textBody),
          ),
          if (option.note != null)
            Text(
              option.note!,
              textAlign: TextAlign.center,
              style: AxType.text(9, weight: FontWeight.w700, color: AxColors.escrow),
            ),
        ],
      ),
    );
  }
}

class _TimeSlots extends StatelessWidget {
  const _TimeSlots({required this.title, required this.slots});

  final String title;
  final List<BookSlot> slots;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s7,
      children: [
        Text(
          title,
          style: AxType.head(AxType.bodySm, color: AxColors.brand),
        ),
        Column(
          spacing: AxSpace.s8,
          children: [
            for (var i = 0; i < slots.length; i += 3)
              Row(
                spacing: AxSpace.s8,
                children: [
                  for (final slot in slots.skip(i).take(3))
                    Expanded(child: _SlotChip(slot: slot)),
                ],
              ),
          ],
        ),
      ],
    );
  }
}

class _SlotChip extends StatelessWidget {
  const _SlotChip({required this.slot});

  final BookSlot slot;

  @override
  Widget build(BuildContext context) {
    final selected = slot.state == BookSlotState.selected;
    final disabled = slot.state == BookSlotState.disabled;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AxSpace.s11),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selected ? AxColors.salmon : null,
        borderRadius: const BorderRadius.all(Radius.circular(AxRadius.xl)),
        border: selected ? null : Border.all(color: AxColors.borderStrong),
      ),
      child: Text(
        slot.label,
        textAlign: TextAlign.center,
        style: selected
            ? AxType.text(AxType.labelSm, weight: FontWeight.w700, color: AxColors.brand)
            : AxType.text(
                AxType.labelSm,
                weight: FontWeight.w600,
                color: disabled ? AxColors.dividerMid : AxColors.textPrimary,
              ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.appointment});

  final BookAppointment appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AxSpace.s14),
      decoration: const BoxDecoration(
        color: AxColors.surfaceWarm,
        borderRadius: BorderRadius.all(Radius.circular(AxRadius.tile)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AxSpace.s9,
        children: [
          Text(
            appointment.summaryTitle.toUpperCase(),
            style: AxType.text(
              AxType.captionSm,
              weight: FontWeight.w700,
              color: AxColors.textFaint,
              letterSpacingEm: 0.04,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  appointment.serviceName,
                  style: AxType.text(AxType.label, color: AxColors.textPrimary),
                ),
              ),
              Text(
                appointment.servicePrice,
                style: AxType.text(AxType.label, weight: FontWeight.w700, color: AxColors.brand),
              ),
            ],
          ),
          Text(
            appointment.detailLine,
            style: AxType.text(AxType.caption, color: AxColors.textSubtle),
          ),
          Row(
            spacing: AxSpace.s4,
            children: [
              const AxIcon(AxIcons.mapPin24, size: 10, color: AxColors.escrow),
              Flexible(
                child: Text(
                  appointment.locationLine,
                  style: AxType.text(AxType.captionSm, weight: FontWeight.w600, color: AxColors.escrow),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterBar extends StatelessWidget {
  const _FooterBar({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(AxSpace.s18, AxSpace.s14, AxSpace.s18, AxSpace.s22),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AxColors.border)),
      ),
      child: _ContinueButton(label: label, onPressed: onPressed),
    );
  }
}

class _ContinueButton extends StatelessWidget {
  const _ContinueButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: AxSpace.buttonHeight,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: const ShapeDecoration(
          gradient: AxGradients.avatarPeach,
          shape: StadiumBorder(),
        ),
        child: Text(
          label,
          style: AxType.text(AxType.body, weight: FontWeight.w700, color: AxColors.brand),
        ),
      ),
    );
  }
}

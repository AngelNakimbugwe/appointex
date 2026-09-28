import 'package:flutter/material.dart';

import '../../../../design/icons/ax_icon.dart' hide AxArt;
import '../../../../design/icons/ax_icons.dart';
import '../../../../design/tokens/ax_colors.dart';
import '../../../../design/tokens/ax_gradients.dart';
import '../../../../design/tokens/ax_space.dart';
import '../../../../design/tokens/ax_type.dart';
import '../../../../design/widgets/ax_sidebar.dart';
import '../../shell/biz_shell.dart';
import '../data/fixtures.dart';
import 'widgets/week_grid.dart';

/// `/biz/calendar` — Biz_Calendar: title, week switcher and the "Make an
/// appointment" CTA above the seven-day appointment grid, inside [BizShell].
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.canvas,
      body: BizShell(
        current: AxSidebarItem.calendar,
        child: const _CalendarContent(),
      ),
    );
  }
}

class _CalendarContent extends StatelessWidget {
  const _CalendarContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AxSpace.s18,
      children: const [
        _CalendarHeader(),
        Expanded(child: WeekGrid()),
      ],
    );
  }
}

class _CalendarHeader extends StatelessWidget {
  const _CalendarHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          kPageTitle,
          style: AxType.head(
            AxType.h4,
            weight: FontWeight.w800,
            color: AxColors.brand,
          ),
        ),
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: AxSpace.s14,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: AxSpace.s10,
                  children: [
                    AxIcon(AxIcons.chevronLeft, size: 16, color: AxColors.brand),
                    Flexible(
                      child: Text(
                        kWeekRange,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AxType.text(
                          AxType.label,
                          weight: FontWeight.w700,
                          color: AxColors.brand,
                        ),
                      ),
                    ),
                    AxIcon(AxIcons.chevronRight, size: 16, color: AxColors.brand),
                  ],
                ),
              ),
              const Flexible(child: _MakeAppointmentButton()),
            ],
          ),
        ),
      ],
    );
  }
}

/// The `+ Make an appointment` CTA — `height:38px; padding:0 16px;
/// border-radius:19px` over `linear-gradient(135deg,#FEC89A,#FFB5A7)`.
/// Local because `AxPrimaryButton` has no horizontal padding; radius 19 on
/// height 38 is a stadium, so [StadiumBorder] renders it exactly. The label
/// ellipsizes under extreme text scale rather than overflowing the header.
class _MakeAppointmentButton extends StatelessWidget {
  const _MakeAppointmentButton();

  /// Biz_Calendar.dc.html line 68: `height:38px`.
  static const double _height = 38;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AxSpace.s16),
      decoration: const ShapeDecoration(
        gradient: AxGradients.avatarPeach,
        shape: StadiumBorder(),
      ),
      child: SizedBox(
        height: _height,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                kMakeAppointment,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AxType.text(
                  AxType.labelSm,
                  weight: FontWeight.w700,
                  color: AxColors.brand,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

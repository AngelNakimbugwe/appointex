import 'package:flutter/material.dart';

import '../../../../../design/icons/ax_icon.dart';
import '../../../../../design/icons/ax_icons.dart' show AxIcons;
import '../../../../../design/tokens/ax_colors.dart';
import '../../../../../design/tokens/ax_space.dart';
import '../../../../../design/tokens/ax_type.dart';
import '../../data/fixtures.dart';

class BookMonthPicker extends StatelessWidget {
  const BookMonthPicker({
    super.key,
    required this.monthLabel,
    required this.weekdays,
    required this.days,
    required this.legend,
  });

  final String monthLabel;
  final List<String> weekdays;
  final List<BookDay> days;
  final List<BookLegendItem> legend;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s7,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AxIcon(AxIcons.chevronLeft23, size: 15, color: AxColors.brand),
            Text(
              monthLabel,
              style: AxType.head(AxType.bodySm, color: AxColors.brand),
            ),
            const AxIcon(AxIcons.chevronRight23, size: 15, color: AxColors.brand),
          ],
        ),
        Row(
          spacing: AxSpace.s3,
          children: [
            for (final weekday in weekdays)
              Expanded(
                child: Center(
                  child: Text(
                    weekday,
                    style: AxType.text(AxType.nano, weight: FontWeight.w700, color: AxColors.textFaint),
                  ),
                ),
              ),
          ],
        ),
        Column(
          spacing: AxSpace.s3,
          children: [
            for (var i = 0; i < days.length; i += 7)
              Row(
                spacing: AxSpace.s3,
                children: [
                  for (final day in days.skip(i).take(7))
                    Expanded(
                      child: AspectRatio(aspectRatio: 1, child: _DayCell(day: day)),
                    ),
                ],
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: AxSpace.s2),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: AxSpace.s14,
              children: [
                for (final item in legend)
                  Row(
                    spacing: AxSpace.s5,
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: item.color,
                          gradient: item.gradient,
                        ),
                      ),
                      Text(
                        item.label,
                        style: AxType.text(AxType.nano, color: AxColors.textSubtle),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({required this.day});

  final BookDay day;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: switch (day.state) {
          BookDayState.unavailable => AxColors.panelNeutral,
          BookDayState.selected => AxColors.brand,
          _ => null,
        },
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AxSpace.s2,
        children: [
          if (day.label != null)
            Text(
              day.label!,
              style: switch (day.state) {
                BookDayState.unavailable => AxType.text(
                    AxType.caption,
                    weight: FontWeight.w600,
                    color: AxColors.dividerMid,
                  ),
                BookDayState.selected => AxType.text(
                    AxType.caption,
                    weight: FontWeight.w800,
                    color: AxColors.surface,
                  ),
                _ => AxType.text(AxType.caption, weight: FontWeight.w600, color: AxColors.textPrimary),
              },
            ),
          if (day.state == BookDayState.partial)
            Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: AxColors.salmon),
            ),
        ],
      ),
    );
  }
}

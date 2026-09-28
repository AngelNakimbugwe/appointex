import 'dart:ui' show ImageByteFormat;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appointex/design/tokens/ax_colors.dart';
import 'package:appointex/design/widgets/ax_pill.dart';
import 'package:appointex/design/widgets/ax_sidebar.dart';
import 'package:appointex/design/widgets/ax_stat_tile.dart';
import 'package:appointex/features/business/earnings/data/fixtures.dart';
import 'package:appointex/features/business/earnings/presentation/earnings_screen.dart';
import 'package:appointex/features/business/earnings/presentation/widgets/earnings_table.dart';

import '../helpers/golden_harness.dart';

Future<Color> _pixel(WidgetTester tester, Offset point) async {
  final element = tester.element(find.byType(EarningsScreen));
  final color = await tester.runAsync<Color>(() async {
    final image = await captureImage(element);
    final bytes = await image.toByteData(format: ImageByteFormat.rawRgba);
    final data = bytes!.buffer.asUint8List();
    final i = (point.dy.round() * image.width + point.dx.round()) * 4;
    return Color.fromARGB(data[i + 3], data[i], data[i + 1], data[i + 2]);
  });
  return color!;
}

bool _hasBottomRule(Widget widget, Color color) {
  if (widget is! Container) return false;
  final decoration = widget.decoration;
  if (decoration is! BoxDecoration) return false;
  final border = decoration.border;
  return border is Border && border.bottom.color == color;
}

bool _isPayoutChip(Widget widget) {
  if (widget is! Container) return false;
  final decoration = widget.decoration;
  return decoration is ShapeDecoration && decoration.shape is StadiumBorder;
}

void main() {
  testWidgets('Biz_Earnings matches artboard golden', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const EarningsScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(EarningsScreen),
      matchesGoldenFile('../goldens/biz_earnings.png'),
    );
  });

  testWidgets('Biz_Earnings copy inventory is verbatim', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const EarningsScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    const sidebar = [
      'Appointex',
      'FOR BUSINESS',
      'Dashboard',
      'Calendar',
      'Clients',
      'Earnings',
      'Services',
      'Featured Spots',
      'Settings',
    ];
    final copy = <String>[
      kPageTitle,
      kPayoutAccount,
      for (final column in kColumns) column.toUpperCase(),
      for (final stat in kStats) ...[stat.label, stat.value],
      for (final entry in kPayouts) ...[
        entry.date,
        entry.clientService,
        entry.amount,
        entry.commission,
      ],
      kHeldLabel,
      kReleasedLabel,
      kFootnote,
      ...sidebar,
    ];
    for (final text in copy) {
      expect(find.text(text), findsWidgets, reason: text);
    }
    expect(find.text(kReleasedLabel), findsNWidgets(3));
  });

  testWidgets('Biz_Earnings geometry matches the artboard', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const EarningsScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(tester.getRect(find.byType(AxSidebar)).size, const Size(220, 760));

    final title = tester.widget(find.text(kPageTitle).last) as Text;
    expect(title.style!.fontFamily, 'Manrope');
    expect(title.style!.fontSize, 20);
    expect(title.style!.fontWeight, FontWeight.w800);
    expect(title.style!.color, AxColors.brand);

    final chipText = tester.widget(find.text(kPayoutAccount)) as Text;
    expect(chipText.style!.fontSize, 12.5);
    expect(chipText.style!.fontWeight, FontWeight.w700);
    expect(chipText.style!.color, AxColors.brand);
    expect(chipText.style!.fontFamily, isNull);

    final chip = tester.getRect(find.byWidgetPredicate(_isPayoutChip));
    expect(chip.height, 38);
    expect(chip.top, 26);
    expect(chip.right, 1128);

    final tiles = find.byType(AxStatTile);
    expect(tiles, findsNWidgets(4));
    final first = tester.getRect(tiles.at(0));
    expect(first.top, 80);
    expect(first.left, 252);
    expect(first.width, closeTo(207, 0.5));
    expect(tester.getRect(tiles.at(3)).left, closeTo(921, 1));
    final tileHeight = first.height;
    for (var i = 1; i < 4; i++) {
      expect(tester.getRect(tiles.at(i)).height, tileHeight);
    }

    final label = tester.widget(find.text(kStats.first.label)) as Text;
    expect(label.style!.fontSize, 11.5);
    expect(label.style!.color, AxColors.textSubtle);
    expect(label.style!.fontFamily, isNull);

    final value = tester.widget(find.text(kStats.first.value)) as Text;
    expect(value.style!.fontFamily, 'Manrope');
    expect(value.style!.fontSize, 22);
    expect(value.style!.fontWeight, FontWeight.w800);
    expect(value.style!.color, AxColors.brand);

    final darkLabel = tester.widget(find.text(kStats.last.label)) as Text;
    expect(darkLabel.style!.color, AxColors.peach);
    final darkValue = tester.widget(find.text(kStats.last.value)) as Text;
    expect(darkValue.style!.fontFamily, 'Manrope');
    expect(darkValue.style!.fontSize, 22);
    expect(darkValue.style!.fontWeight, FontWeight.w800);
    expect(darkValue.style!.color, AxColors.surface);

    final dateHeader = tester.widget(find.text('DATE')) as Text;
    expect(dateHeader.style!.fontSize, 11);
    expect(dateHeader.style!.fontWeight, FontWeight.w700);
    expect(dateHeader.style!.color, AxColors.textFaint);
    expect(dateHeader.style!.letterSpacing, closeTo(0.33, 0.01));
    expect(tester.getRect(find.text('DATE')).left, closeTo(281, 1));

    expect(
      tester.getRect(find.byType(EarningsTable)).top,
      closeTo(first.bottom + 16 + 7, 1),
    );

    final date = tester.widget(find.text(kPayouts.first.date)) as Text;
    expect(date.style!.fontSize, 12.5);
    expect(date.style!.color, AxColors.textBody);
    expect(date.style!.fontFamily, isNull);

    final client =
        tester.widget(find.text(kPayouts.first.clientService)) as Text;
    expect(client.style!.fontSize, 12.5);
    expect(client.style!.fontWeight, FontWeight.w600);
    expect(client.style!.color, AxColors.brand);

    final pills = find.byType(AxPill);
    expect(pills, findsNWidgets(4));
    final held = tester.widget(
      find.byWidgetPredicate((w) => w is AxPill && w.label == kHeldLabel),
    ) as AxPill;
    expect(held.background, AxColors.pendingBg);
    expect(held.foreground, AxColors.pending);
    final released = find.byWidgetPredicate(
      (w) => w is AxPill && w.label == kReleasedLabel,
    );
    expect(released, findsNWidgets(3));
    expect(
      (tester.widget(released.first) as AxPill).background,
      AxColors.verifiedBg,
    );
    expect((tester.widget(released.first) as AxPill).foreground, AxColors.verified);
    final heldText = tester.widget(find.text(kHeldLabel)) as Text;
    expect(heldText.style!.fontSize, 10.5);
    expect(heldText.style!.fontWeight, FontWeight.w700);

    final footnote = tester.widget(find.text(kFootnote)) as Text;
    expect(footnote.style!.fontSize, 11);
    expect(footnote.style!.color, AxColors.textFaint);

    expect(
      find.byWidgetPredicate((w) => _hasBottomRule(w, AxColors.panelWarm)),
      findsNWidgets(3),
    );
    expect(
      find.byWidgetPredicate((w) => _hasBottomRule(w, AxColors.borderSoft)),
      findsNWidgets(1),
    );
  });

  testWidgets('Biz_Earnings paints artboard colours', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const EarningsScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(await _pixel(tester, const Offset(1150, 12)), AxColors.canvas);
    expect(await _pixel(tester, const Offset(200, 700)), AxColors.blushPale);
    expect(await _pixel(tester, const Offset(1000, 500)), AxColors.surface);

    final tiles = find.byType(AxStatTile);
    final light = tester.getRect(tiles.at(0));
    expect(
      await _pixel(tester, Offset(light.left + 3, light.center.dy)),
      AxColors.surface,
    );
    final dark = tester.getRect(tiles.at(3));
    expect(
      await _pixel(tester, Offset(dark.left + 3, dark.center.dy)),
      AxColors.brand,
    );
  });

  const sizes = [Size(900, 700), Size(1160, 760), Size(1440, 900)];

  for (final size in sizes) {
    testWidgets('no overflow at ${size.width}×${size.height}', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(harness(const EarningsScreen(), size: size));
      await precacheIcons(tester);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets(
      'no overflow at ${size.width}×${size.height} at 1.3× text scale',
      (tester) async {
        await tester.binding.setSurfaceSize(size);
        await tester.pumpWidget(
          harness(
            const EarningsScreen(),
            size: size,
            textScaler: TextScaler.linear(1.3),
          ),
        );
        await precacheIcons(tester);
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      },
    );
  }
}

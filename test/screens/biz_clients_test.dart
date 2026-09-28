import 'dart:ui' show ImageByteFormat;

import 'package:appointex/design/icons/ax_icon.dart';
import 'package:appointex/design/icons/ax_icons.dart';
import 'package:appointex/design/tokens/ax_colors.dart';
import 'package:appointex/design/widgets/ax_avatar.dart';
import 'package:appointex/design/widgets/ax_sidebar.dart';
import 'package:appointex/features/business/clients/data/fixtures.dart';
import 'package:appointex/features/business/clients/presentation/clients_screen.dart';
import 'package:appointex/features/business/clients/presentation/widgets/clients_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/golden_harness.dart';

Future<Color> _pixel(WidgetTester tester, Offset point) async {
  final element = tester.element(find.byType(ClientsScreen));
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

void main() {
  testWidgets('Biz_Clients matches artboard golden', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const ClientsScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(ClientsScreen),
      matchesGoldenFile('../goldens/biz_clients.png'),
    );
  });

  testWidgets('Biz_Clients copy inventory is verbatim', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const ClientsScreen(), size: const Size(1160, 760)),
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
      kSearchHint,
      for (final column in kColumns) column.toUpperCase(),
      for (final client in kClients) ...[
        client.name,
        client.lastVisit,
        client.visits,
        client.totalSpend,
        client.favouriteService,
      ],
      ...sidebar,
    ];
    for (final text in copy) {
      expect(find.text(text), findsWidgets, reason: text);
    }
  });

  testWidgets('Biz_Clients geometry matches the artboard', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const ClientsScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(tester.getRect(find.byType(AxSidebar)).size, const Size(220, 760));

    final searchIcon = find.byWidgetPredicate(
      (w) => w is AxIcon && w.asset == AxIcons.search,
    );
    expect(searchIcon, findsOneWidget);
    final icon = tester.getRect(searchIcon);
    expect(icon.size, const Size(14, 14));
    expect(icon.left, closeTo(862, 1));
    expect(icon.top, closeTo(39, 2));

    final searchField = find.byWidgetPredicate(
      (w) => _hasBottomRule(w, AxColors.borderStrong),
    );
    expect(searchField, findsOneWidget);
    final fieldRect = tester.getRect(searchField);
    expect(fieldRect.size, const Size(280, 40));
    expect(fieldRect.top, 26);
    expect(fieldRect.right, 1128);

    expect(tester.getRect(find.byType(ClientsTable)).top, closeTo(91, 1));

    final nameHeader = tester.getRect(find.text('CLIENT'));
    expect(nameHeader.left, closeTo(281, 1));

    final visitsHeader = tester.widget(find.text('VISITS')) as Text;
    expect(visitsHeader.textAlign, TextAlign.center);
    expect(visitsHeader.style!.fontSize, 11);
    expect(visitsHeader.style!.fontWeight, FontWeight.w700);
    expect(visitsHeader.style!.color, AxColors.textFaint);
    expect(visitsHeader.style!.letterSpacing, closeTo(0.33, 0.01));
    final visitsHeaderCenter = tester.getRect(find.text('VISITS')).center.dx;
    expect(visitsHeaderCenter, closeTo(703, 2));

    expect(
      tester.getRect(find.text(kClients.first.visits)).center.dx,
      closeTo(703, 2),
    );
    expect(
      tester.getRect(find.text(kClients.last.visits)).center.dx,
      closeTo(703, 2),
    );

    final avatars = find.byType(AxAvatar);
    expect(avatars, findsNWidgets(5));
    for (var i = 0; i < kClients.length; i++) {
      final avatar = tester.widget(avatars.at(i)) as AxAvatar;
      expect(avatar.size, 32);
      expect(avatar.radius, 16);
      expect(avatar.gradient, kClients[i].gradient);
      expect(tester.getRect(avatars.at(i)).size, const Size(32, 32));
    }
    expect(tester.getRect(avatars.at(0)).left, closeTo(281, 1));
    expect(tester.getRect(avatars.at(0)).top, closeTo(150.5, 2));

    expect(
      find.byWidgetPredicate((w) => _hasBottomRule(w, AxColors.panelWarm)),
      findsNWidgets(4),
    );

    final title = tester.widget(find.text(kPageTitle).last) as Text;
    expect(title.style!.fontFamily, 'Manrope');
    expect(title.style!.fontSize, 20);
    expect(title.style!.fontWeight, FontWeight.w800);
    expect(title.style!.color, AxColors.brand);

    final hint = tester.widget(find.text(kSearchHint)) as Text;
    expect(hint.style!.fontSize, 12.5);
    expect(hint.style!.color, AxColors.textFaint);
    expect(hint.style!.fontFamily, isNull);

    final name = tester.widget(find.text(kClients.first.name)) as Text;
    expect(name.style!.fontSize, 13);
    expect(name.style!.fontWeight, FontWeight.w700);
    expect(name.style!.color, AxColors.brand);

    final visit = tester.widget(find.text('26 Aug 2026').first) as Text;
    expect(visit.style!.fontSize, 12.5);
    expect(visit.style!.color, AxColors.textBody);

    final spend = tester.widget(find.text(kClients.first.totalSpend)) as Text;
    expect(spend.style!.fontSize, 12.5);
    expect(spend.style!.fontWeight, FontWeight.w700);
    expect(spend.style!.color, AxColors.brand);
  });

  testWidgets('Biz_Clients paints artboard colours', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1160, 760));
    await tester.pumpWidget(
      harness(const ClientsScreen(), size: const Size(1160, 760)),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(await _pixel(tester, const Offset(1150, 12)), AxColors.canvas);
    expect(await _pixel(tester, const Offset(200, 700)), AxColors.blushPale);
    expect(await _pixel(tester, const Offset(1000, 500)), AxColors.surface);

    final icon = tester.getRect(
      find.byWidgetPredicate(
        (w) => w is AxIcon && w.asset == AxIcons.search,
      ),
    );
    expect(
      await _pixel(tester, Offset(icon.left - 5, icon.center.dy)),
      AxColors.surface,
    );
  });

  const sizes = [Size(900, 700), Size(1160, 760), Size(1440, 900)];

  for (final size in sizes) {
    testWidgets('no overflow at ${size.width}×${size.height}', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(harness(const ClientsScreen(), size: size));
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
            const ClientsScreen(),
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

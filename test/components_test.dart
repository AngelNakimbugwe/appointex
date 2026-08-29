import 'package:appointex/design/icons/ax_icons.dart';
import 'package:appointex/design/tokens/ax_gradients.dart';
import 'package:appointex/design/tokens/ax_radius.dart';
import 'package:appointex/design/widgets/ax_avatar.dart';
import 'package:appointex/design/widgets/ax_bottom_nav.dart';
import 'package:appointex/design/widgets/ax_card.dart';
import 'package:appointex/design/widgets/ax_chip.dart';
import 'package:appointex/design/widgets/ax_data_table.dart';
import 'package:appointex/design/widgets/ax_field.dart';
import 'package:appointex/design/widgets/ax_mobile_header.dart';
import 'package:appointex/design/widgets/ax_pill.dart';
import 'package:appointex/design/widgets/ax_primary_button.dart';
import 'package:appointex/design/widgets/ax_provider_row.dart';
import 'package:appointex/design/widgets/ax_rating.dart';
import 'package:appointex/design/widgets/ax_sidebar.dart';
import 'package:appointex/design/widgets/ax_stat_tile.dart';
import 'package:appointex/design/widgets/ax_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  testWidgets('AxMobileHeader renders title and back arrow', (tester) async {
    await tester.pumpWidget(wrap(const AxMobileHeader('Search')));
    expect(find.text('Search'), findsOneWidget);
  });

  testWidgets('AxMobileHeader.home renders greeting block', (tester) async {
    await tester.pumpWidget(
      wrap(
        AxMobileHeader.home(greeting: 'Good morning', title: 'Where to today?'),
      ),
    );
    expect(find.text('Good morning'), findsOneWidget);
    expect(find.text('Where to today?'), findsOneWidget);
  });

  testWidgets('AxBottomNav renders four tabs and fires taps', (tester) async {
    AxNavItem? tapped;
    await tester.pumpWidget(
      wrap(
        AxBottomNav(
          current: AxNavItem.home,
          onTap: (item) => tapped = item,
        ),
      ),
    );
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Bookings'), findsOneWidget);
    expect(find.text('Chat'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
    await tester.tap(find.text('Bookings'));
    expect(tapped, AxNavItem.bookings);
  });

  testWidgets('AxSidebar renders seven items and fires taps', (tester) async {
    AxSidebarItem? tapped;
    await tester.pumpWidget(
      wrap(
        SizedBox(
          width: 220,
          child: AxSidebar(
            current: AxSidebarItem.dashboard,
            onTap: (item) => tapped = item,
          ),
        ),
      ),
    );
    expect(find.text('Appointex'), findsOneWidget);
    expect(find.text('FOR BUSINESS'), findsOneWidget);
    expect(find.text('Featured Spots'), findsOneWidget);
    await tester.tap(find.text('Calendar'));
    expect(tapped, AxSidebarItem.calendar);
  });

  testWidgets('AxAvatar renders all sizes', (tester) async {
    await tester.pumpWidget(
      wrap(
        const Row(
          children: [
            AxAvatar(
              size: 56,
              radius: AxRadius.md,
              art: AxArt.artBraids,
              gradient: AxGradients.avatarPale,
            ),
            AxAvatar(
              size: 44,
              radius: AxRadius.md,
              art: AxArt.artMakeup,
              gradient: AxGradients.avatarBlush,
            ),
            AxAvatar(
              size: 30,
              radius: AxRadius.sm,
              art: AxArt.artSpa,
              gradient: AxGradients.avatarRose,
            ),
          ],
        ),
      ),
    );
    expect(find.byType(AxAvatar), findsNWidgets(3));
  });

  testWidgets('AxRating renders value', (tester) async {
    await tester.pumpWidget(wrap(const AxRating(value: '4.9')));
    expect(find.text('4.9'), findsOneWidget);
  });

  testWidgets('AxProviderRow renders name, subtitle, rating', (tester) async {
    await tester.pumpWidget(
      wrap(
        const AxProviderRow(
          name: 'Bella Rose Studio',
          subtitle: 'Hair & Makeup · 2.4 km',
          rating: '4.9',
        ),
      ),
    );
    expect(find.text('Bella Rose Studio'), findsOneWidget);
    expect(find.text('Hair & Makeup · 2.4 km'), findsOneWidget);
    expect(find.text('4.9'), findsOneWidget);
  });

  testWidgets('AxCard renders child', (tester) async {
    await tester.pumpWidget(wrap(const AxCard(child: Text('Card content'))));
    expect(find.text('Card content'), findsOneWidget);
  });

  testWidgets('AxChip toggles selection via tap', (tester) async {
    var selected = false;
    await tester.pumpWidget(
      wrap(
        AxChip(
          label: 'Hair',
          selected: selected,
          onTap: () => selected = true,
        ),
      ),
    );
    await tester.tap(find.text('Hair'));
    expect(selected, isTrue);
  });

  testWidgets('AxField accepts input', (tester) async {
    final controller = TextEditingController();
    await tester.pumpWidget(
      wrap(AxField(hint: 'Full name', controller: controller)),
    );
    await tester.enterText(find.byType(TextField), 'Amara');
    expect(controller.text, 'Amara');
  });

  testWidgets('AxPrimaryButton fires onPressed', (tester) async {
    var pressed = false;
    await tester.pumpWidget(
      wrap(
        AxPrimaryButton(label: 'Continue', onPressed: () => pressed = true),
      ),
    );
    await tester.tap(find.text('Continue'));
    expect(pressed, isTrue);
  });

  testWidgets('AxStatTile renders value and label', (tester) async {
    await tester.pumpWidget(
      wrap(const AxStatTile(label: 'Bookings', value: '128')),
    );
    expect(find.text('128'), findsOneWidget);
    expect(find.text('Bookings'), findsOneWidget);
  });

  testWidgets('AxToggle fires onChanged', (tester) async {
    var value = false;
    await tester.pumpWidget(
      wrap(AxToggle(value: value, onChanged: (v) => value = v)),
    );
    await tester.tap(find.byType(AxToggle));
    expect(value, isTrue);
  });

  testWidgets('AxPill renders label', (tester) async {
    await tester.pumpWidget(wrap(const AxPill(label: 'CONFIRMED')));
    expect(find.text('CONFIRMED'), findsOneWidget);
  });

  testWidgets('AxDataTable renders columns and rows', (tester) async {
    await tester.pumpWidget(
      wrap(
        AxDataTable(
          columns: const ['Client', 'Service'],
          rows: const [
            ['Amara', 'Bridal makeup'],
          ],
        ),
      ),
    );
    expect(find.text('CLIENT'), findsOneWidget);
    expect(find.text('SERVICE'), findsOneWidget);
    expect(find.text('Amara'), findsOneWidget);
    expect(find.text('Bridal makeup'), findsOneWidget);
  });
}

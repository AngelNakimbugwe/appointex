import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appointex/design/icons/ax_icon.dart';
import 'package:appointex/design/icons/ax_icons.dart';
import 'package:appointex/design/tokens/ax_colors.dart';
import 'package:appointex/design/widgets/ax_avatar.dart';
import 'package:appointex/design/widgets/ax_bottom_nav.dart';
import 'package:appointex/features/client/chat/presentation/chat_inbox_screen.dart';
import 'package:appointex/features/client/chat/presentation/chat_screen.dart';

import '../helpers/golden_harness.dart';

void main() {
  testWidgets('Client_Chat matches artboard', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const ChatScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(ChatScreen),
      matchesGoldenFile('../goldens/client_chat.png'),
    );
  });

  testWidgets('Client_Chat copy inventory is verbatim', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const ChatScreen()));
    await precacheIcons(tester);
    const copy = [
      'Patricia Glam Studio',
      'Online',
      'Hi! Do you have anything free on the 26th for bridal makeup?',
      "Yes, 12:00 pm is open. I can also do a trial the week before if you'd like.",
      "That'd be great. Easier if we just sort the rest on WhatsApp, call me on 0772…",
      'Message blocked — phone numbers and contact details are shared automatically once your deposit is paid',
      "Ah okay, makes sense. I'll just book it here then.",
      'Numbers and contact info are blocked before checkout',
      'Message Patricia…',
      'Home',
      'Bookings',
      'Chat',
      'Profile',
    ];
    for (final text in copy) {
      expect(find.text(text), findsOneWidget, reason: text);
    }

    final name = tester.widget<Text>(find.text('Patricia Glam Studio'));
    expect(name.style?.fontSize, 13.5);
    expect(name.style?.fontWeight, FontWeight.w700);
    expect(name.style?.color, AxColors.brand);
    expect(name.style?.fontFamily, isNull);

    final online = tester.widget<Text>(find.text('Online'));
    expect(online.style?.fontSize, 11);
    expect(online.style?.color, AxColors.verifiedSoft);

    final incoming = tester.widget<Text>(
      find.text('Hi! Do you have anything free on the 26th for bridal makeup?'),
    );
    expect(incoming.style?.fontSize, 13);
    expect(incoming.style?.height, 1.45);
    expect(incoming.style?.color, AxColors.textStrong);

    final outgoing = tester.widget<Text>(
      find.text(
        "Yes, 12:00 pm is open. I can also do a trial the week before if you'd like.",
      ),
    );
    expect(outgoing.style?.color, AxColors.surface);

    final notice = tester.widget<Text>(
      find.text(
        'Message blocked — phone numbers and contact details are shared automatically once your deposit is paid',
      ),
    );
    expect(notice.style?.fontSize, 11);
    expect(notice.style?.height, 1.4);
    expect(notice.style?.color, AxColors.brandMid);

    final placeholder = tester.widget<Text>(find.text('Message Patricia…'));
    expect(placeholder.style?.fontSize, 12.5);
    expect(placeholder.style?.color, AxColors.textFaint);
  });

  testWidgets('Client_Chat geometry probes', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const ChatScreen()));
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    final chevron = tester.getRect(
      find.byWidgetPredicate(
        (widget) => widget is AxIcon && widget.asset == AxIcons.chevronLeft,
      ),
    );
    expect(chevron.left, 16);
    expect(chevron.center.dy, 29.5);

    final avatar = tester.getRect(find.byType(AxAvatar));
    expect(avatar, const Rect.fromLTWH(47, 12.5, 34, 34));

    final name = tester.getRect(find.text('Patricia Glam Studio'));
    expect(name.left, 93);
    final online = tester.getRect(find.text('Online'));
    expect(online.left, 93);
    expect(online.top, greaterThanOrEqualTo(name.bottom));

    final outgoingBubble = tester.getRect(_bubbleWith(color: AxColors.brand));
    expect(outgoingBubble.right, 374);
    expect(outgoingBubble.width, lessThanOrEqualTo(358 * 0.78 + 0.5));
    expect(outgoingBubble.width, greaterThan(150));

    final incomingBubbles = _bubbleWith(color: AxColors.panelNeutral);
    expect(tester.widgetList(incomingBubbles), hasLength(3));
    final firstIncoming = tester.getRect(incomingBubbles.first);
    expect(firstIncoming.left, 16);

    final notice = tester.getRect(_notice());
    expect(notice.center.dx, closeTo(195, 0.5));
    expect(notice.width, closeTo(358 * 0.88, 1));

    final thirdIncoming = tester.getRect(incomingBubbles.at(1));
    expect(notice.top - thirdIncoming.bottom, 14);

    final placeholder = tester.getRect(find.text('Message Patricia…'));
    expect(placeholder.left, 32);

    final sendIcon = tester.getRect(
      find.byWidgetPredicate(
        (widget) => widget is AxIcon && widget.asset == AxIcons.send,
      ),
    );
    expect(sendIcon.left, 345);
    expect(sendIcon.size, const Size(16, 16));
    expect(sendIcon.center.dy, placeholder.center.dy);

    final nav = tester.getRect(find.byType(AxBottomNav));
    expect(nav, const Rect.fromLTWH(0, 780, 390, 64));
  });

  testWidgets('Client_Chat pixel probes', (tester) async {
    final key = GlobalKey();
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(
      RepaintBoundary(key: key, child: harness(const ChatScreen())),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    final incomingText = tester.getRect(
      find.text('Hi! Do you have anything free on the 26th for bridal makeup?'),
    );
    final outgoingText = tester.getRect(
      find.text(
        "Yes, 12:00 pm is open. I can also do a trial the week before if you'd like.",
      ),
    );
    final noticeText = tester.getRect(
      find.text(
        'Message blocked — phone numbers and contact details are shared automatically once your deposit is paid',
      ),
    );
    final sendIcon = tester.getRect(
      find.byWidgetPredicate(
        (widget) => widget is AxIcon && widget.asset == AxIcons.send,
      ),
    );
    final noteIcon = tester.getRect(
      find.byWidgetPredicate(
        (widget) => widget is AxIcon && widget.asset == AxIcons.lock24,
      ),
    );

    final pixels = await _capturePixels(tester, key);

    expect(pixels.at(const Offset(5, 30)), AxColors.surface);
    expect(pixels.at(const Offset(195, 66)), AxColors.surfaceBright);
    expect(
      pixels.at(Offset(outgoingText.left - 6, outgoingText.top - 5)),
      AxColors.brand,
    );
    expect(
      pixels.at(Offset(incomingText.left - 6, incomingText.top - 5)),
      AxColors.panelNeutral,
    );
    expect(
      pixels.at(Offset(noticeText.left - 6, noticeText.center.dy)),
      AxColors.pendingBg,
    );
    expect(
      pixels.at(Offset(sendIcon.center.dx + 10, sendIcon.center.dy + 10)),
      AxColors.salmon,
    );
    expect(pixels.at(Offset(5, noteIcon.center.dy)), AxColors.surface);
  });

  testWidgets('Client_ChatInbox copy inventory is verbatim', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(harness(const ChatInboxScreen()));
    await precacheIcons(tester);
    expect(find.text('Chat'), findsNWidgets(2));
    expect(find.text('Patricia Glam Studio'), findsOneWidget);
    expect(
      find.text("Ah okay, makes sense. I'll just book it here then."),
      findsOneWidget,
    );
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Bookings'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });

  const screens = <String, Widget>{
    'Client_Chat': ChatScreen(),
    'Client_ChatInbox': ChatInboxScreen(),
  };

  for (final size in [const Size(320, 640), const Size(390, 844), const Size(430, 932)]) {
    for (final screen in screens.entries) {
      testWidgets('${screen.key} has no overflow at $size', (tester) async {
        await tester.binding.setSurfaceSize(size);
        await tester.pumpWidget(harness(screen.value, size: size));
        await precacheIcons(tester);
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      });

      testWidgets(
        '${screen.key} has no overflow at $size with textScaler 1.3',
        (tester) async {
          await tester.binding.setSurfaceSize(size);
          await tester.pumpWidget(
            harness(
              screen.value,
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
}

Finder _bubbleWith({required Color color}) {
  return find.byWidgetPredicate((widget) {
    if (widget is! Container) return false;
    final decoration = widget.decoration;
    return decoration is BoxDecoration && decoration.color == color;
  });
}

Finder _notice() {
  return find.byWidgetPredicate((widget) {
    if (widget is! Container) return false;
    final decoration = widget.decoration;
    return decoration is BoxDecoration &&
        decoration.color == AxColors.pendingBg;
  });
}

class _Pixels {
  _Pixels(this._data, this.width);

  final ByteData _data;
  final int width;

  Color at(Offset point) {
    final x = point.dx.round();
    final y = point.dy.round();
    final offset = (y * width + x) * 4;
    return Color.fromARGB(
      _data.getUint8(offset + 3),
      _data.getUint8(offset),
      _data.getUint8(offset + 1),
      _data.getUint8(offset + 2),
    );
  }
}

Future<_Pixels> _capturePixels(WidgetTester tester, GlobalKey key) {
  final boundary =
      key.currentContext!.findRenderObject() as RenderRepaintBoundary;
  return tester.runAsync(() async {
    final image = await boundary.toImage(pixelRatio: 1);
    final data = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
    return _Pixels(data!, image.width);
  }).then((pixels) => pixels!);
}

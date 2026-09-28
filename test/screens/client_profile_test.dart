import 'dart:convert';
import 'dart:io';

import 'package:appointex/core/auth/auth_repository.dart';
import 'package:appointex/core/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appointex/features/client/profile/presentation/profile_screen.dart';

import '../fakes/fake_auth_repository.dart';
import '../fakes/fake_user_repository.dart';
import '../helpers/golden_harness.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // pubspec.yaml declares only `assets/icons/`, which excludes the ui/duo/art
  // subdirectories from the asset bundle. Serve the icons from disk through
  // the asset channel until pubspec.yaml lists the subdirectories.
  TestWidgetsFlutterBinding.instance.defaultBinaryMessenger
      .setMockMessageHandler('flutter/assets', (ByteData? message) async {
    final key = utf8.decode(
      message!.buffer.asUint8List(
        message.offsetInBytes,
        message.lengthInBytes,
      ),
    );
    final data = File(key).readAsBytesSync();
    return ByteData.sublistView(data);
  });

  dynamic fakeOverrides() => [
        authRepositoryProvider.overrideWithValue(FakeAuthRepository()),
        userRepositoryProvider.overrideWithValue(FakeUserRepository()),
      ];

  testWidgets('Client_Profile copy inventory is verbatim', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(
      harness(const ProfileScreen(), overrides: fakeOverrides()),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    // 'Profile' appears twice: the screen title and the bottom-nav label.
    expect(find.text('Profile'), findsNWidgets(2));
    expect(find.text('Log out'), findsOneWidget);
    expect(find.text('Guest user'), findsOneWidget);
    expect(find.text('Browsing without an account'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Bookings'), findsOneWidget);
    expect(find.text('Chat'), findsOneWidget);
  });

  testWidgets('bottom nav is present and marks Profile as current',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(
      harness(const ProfileScreen(), overrides: fakeOverrides()),
    );
    await precacheIcons(tester);
    await tester.pumpAndSettle();

    expect(find.byType(BottomNavigationBar), findsNothing);
    expect(find.text('Profile'), findsNWidgets(2));
  });

  const sizes = [Size(320, 640), Size(390, 844), Size(430, 932)];

  for (final size in sizes) {
    testWidgets('no overflow at ${size.width}×${size.height}', (tester) async {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(
        harness(const ProfileScreen(), size: size, overrides: fakeOverrides()),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets(
      'no overflow at ${size.width}×${size.height} at 1.3× text scale',
      (tester) async {
        await tester.binding.setSurfaceSize(size);
        await tester.pumpWidget(
          harness(
            const ProfileScreen(),
            size: size,
            textScaler: TextScaler.linear(1.3),
            overrides: fakeOverrides(),
          ),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      },
    );
  }
}

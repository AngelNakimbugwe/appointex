import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Layer 4 of docs/06-VERIFICATION.md — a crude grep that catches the one
/// failure mode that quietly destroys design-system consistency: a hardcoded
/// value creeping in during a rushed screen.
void main() {
  Iterable<File> dartFilesOutsideTokens() {
    return Directory('lib')
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('.dart'))
        .where((f) => !f.path.contains(r'design\tokens'))
        .where((f) => !f.path.contains('design/icons/ax_icons.dart'));
  }

  test('no raw colours outside design/tokens', () {
    final offenders = dartFilesOutsideTokens()
        .where((f) => RegExp(r'Color\(0x').hasMatch(f.readAsStringSync()))
        .map((f) => f.path)
        .toList();
    expect(offenders, isEmpty, reason: 'Use AxColors');
  });

  test('no raw fontSize outside design/tokens', () {
    final offenders = dartFilesOutsideTokens()
        .where((f) => RegExp(r'fontSize:').hasMatch(f.readAsStringSync()))
        .map((f) => f.path)
        .toList();
    expect(offenders, isEmpty, reason: 'Use AxType');
  });

  test('no raw BorderRadius.circular outside design/tokens', () {
    final offenders = dartFilesOutsideTokens()
        .where((f) => RegExp(r'BorderRadius\.circular\(')
            .hasMatch(f.readAsStringSync()))
        .map((f) => f.path)
        .toList();
    expect(offenders, isEmpty, reason: 'Use AxRadius');
  });
}

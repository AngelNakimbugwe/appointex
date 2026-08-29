import 'package:flutter/material.dart';

/// Two families, strictly split: Manrope for `.head`/headings (weights
/// 500/600/700/800, bundled), system UI for everything else (fontFamily null).
/// See docs/01-DESIGN-TOKENS.md.
abstract final class AxType {
  static const String family = 'Manrope';

  // The scale — half-steps are deliberate, keep them.
  static const double display = 34;
  static const double h1 = 26;
  static const double h2 = 24;
  static const double h3 = 23;
  static const double h4 = 20;
  static const double h5 = 19;
  static const double titleLg = 17;
  static const double title = 16;
  static const double bodyLg = 15;
  static const double body = 14.5;
  static const double bodySm = 13.5;
  static const double label = 13;
  static const double labelSm = 12.5;
  static const double caption = 12;
  static const double captionSm = 11.5;
  static const double micro = 11;
  static const double microSm = 10.5;
  static const double nano = 10;
  static const double nanoSm = 9.5;
  static const double tiny = 8.5;

  /// CSS `letter-spacing: 0.06em` → Flutter `letterSpacing: fontSize * 0.06`.
  /// Flutter's letterSpacing is logical px, not em — this is the one unit
  /// conversion in the whole port (Rule 8).
  static double emToPx(double fontSize, double em) => fontSize * em;

  /// Manrope heading/label style (the `.head` class).
  static TextStyle head(
    double size, {
    FontWeight weight = FontWeight.w700,
    Color? color,
    double? height,
    double? letterSpacingEm,
  }) {
    return TextStyle(
      fontFamily: family,
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing:
          letterSpacingEm == null ? null : emToPx(size, letterSpacingEm),
    );
  }

  /// System-UI body style — fontFamily stays null on purpose; the two-family
  /// contrast is part of how the design reads.
  static TextStyle text(
    double size, {
    FontWeight weight = FontWeight.w400,
    Color? color,
    double? height,
    double? letterSpacingEm,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing:
          letterSpacingEm == null ? null : emToPx(size, letterSpacingEm),
    );
  }
}

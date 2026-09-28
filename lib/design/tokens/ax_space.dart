import 'package:flutter/material.dart';

/// The design uses a warm, slightly irregular rhythm — do NOT round these onto
/// a 4/8 grid. See docs/01-DESIGN-TOKENS.md.
abstract final class AxSpace {
  static const double s2 = 2;
  static const double s3 = 3;
  static const double s4 = 4;
  static const double s5 = 5;
  static const double s6 = 6;
  static const double s7 = 7;
  static const double s8 = 8;
  static const double s9 = 9;
  static const double s10 = 10;
  static const double s11 = 11;
  static const double s12 = 12;
  static const double s13 = 13;
  static const double s14 = 14;
  static const double s15 = 15;
  static const double s16 = 16;
  static const double s18 = 18;
  static const double s20 = 20;
  static const double s22 = 22;
  static const double s24 = 24;
  static const double s26 = 26;
  static const double s28 = 28;
  static const double s32 = 32;

  // Structural constants
  /// Mobile page horizontal padding.
  static const double pageH = 20;

  /// Mobile header padding: `20, 20, 20, 14`.
  static const EdgeInsets headerPadding = EdgeInsets.fromLTRB(20, 20, 20, 14);

  /// Mobile bottom nav height, with `border-top: 1px solid #ECE7DC`.
  static const double bottomNavHeight = 64;

  /// `.btn` height (§AxPrimaryButton).
  static const double buttonHeight = 50;

  /// AxField two sizes (§AxField).
  static const double fieldHeightMobile = 48;
  static const double fieldHeightDesktop = 44;

  /// Business sidebar width, padding `22, 14`.
  static const double sidebarWidth = 220;
  static const EdgeInsets sidebarPadding = EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 22,
  );

  /// Business content padding: `26, 32` (vertical, horizontal —
  /// `padding:26px 32px`, Biz_Dashboard.dc.html line 58).
  static const EdgeInsets bizContentPadding = EdgeInsets.symmetric(
    horizontal: 32,
    vertical: 26,
  );

  /// Business section gap.
  static const double bizSectionGap = 22;

  /// Stat-tile inner padding: `16, 18`.
  static const EdgeInsets statTilePadding = EdgeInsets.symmetric(
    horizontal: 18,
    vertical: 16,
  );

  /// List-row inner padding.
  static const double listRowPadding = 10;
}

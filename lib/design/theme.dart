import 'package:flutter/material.dart';

import 'tokens/ax_colors.dart';

/// One ThemeData for both apps. The design has no shadows anywhere — depth is
/// expressed through 1px borders and background tint — so elevation is zero
/// globally. See docs/01-DESIGN-TOKENS.md § Elevation.
abstract final class AxTheme {
  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: null, // system UI — Manrope is applied per-style via AxType
      colorScheme: const ColorScheme.light(
        primary: AxColors.brand,
        onPrimary: AxColors.surface,
        secondary: AxColors.brandMid,
        onSecondary: AxColors.surface,
        surface: AxColors.surface,
        onSurface: AxColors.textBody,
        error: AxColors.urgentTo,
        onError: AxColors.surface,
      ),
      scaffoldBackgroundColor: AxColors.surface,
      canvasColor: AxColors.surface,
      dividerColor: AxColors.border,
      splashFactory: NoSplash.splashFactory,
      shadowColor: Colors.transparent,
    );

    return base.copyWith(
      // Kill every Material shadow the design does not have.
      appBarTheme: const AppBarTheme(
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AxColors.surface,
      ),
      cardTheme: const CardThemeData(
        elevation: 0,
        shadowColor: Colors.transparent,
        color: AxColors.surface,
        margin: EdgeInsets.zero,
      ),
      dialogTheme: const DialogThemeData(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: AxColors.surface,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: AxColors.surface,
        surfaceTintColor: Colors.transparent,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: AxColors.surface,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AxColors.brand,
          foregroundColor: AxColors.surface,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AxColors.border,
        thickness: 1,
        space: 1,
      ),
    );
  }
}

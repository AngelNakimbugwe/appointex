import 'package:flutter/material.dart';

/// Every colour below was read out of the artboard markup — see
/// docs/01-DESIGN-TOKENS.md. A literal `Color(0xFF…)` outside this folder is a
/// defect.
abstract final class AxColors {
  // Brand ramp
  static const Color brand = Color(0xFF6B3F3A);
  static const Color brandMid = Color(0xFFA66A5D);
  static const Color brandDark = Color(0xFF4A2B27);
  static const Color brandMuted = Color(0xFFC9A79D);
  static const Color brandDeepAlt = Color(0xFF5A3A33);

  // Accent ramp
  static const Color salmon = Color(0xFFFFB5A7);
  static const Color peach = Color(0xFFFEC89A);
  static const Color sand = Color(0xFFF9DCC4);
  static const Color blush = Color(0xFFFCD5CE);
  static const Color blushPale = Color(0xFFF8EDEB);
  static const Color pinkPale = Color(0xFFF5DEE0);

  // Surfaces & borders
  static const Color surface = Color(0xFFFFFFFF);
  static const Color canvas = Color(0xFFFBFAF7);
  static const Color surfaceWarm = Color(0xFFF7F5F1);
  static const Color border = Color(0xFFECE7DC);
  static const Color borderStrong = Color(0xFFE0DBCF);
  static const Color borderSoft = Color(0xFFE8E3D8);

  // Also present in the markup, mapped 1:1
  static const Color panelWarm = Color(0xFFF1EEE6);
  static const Color panelNeutral = Color(0xFFF0EEE9);
  static const Color panelSoft = Color(0xFFEDEAE2);
  static const Color dividerWarm = Color(0xFFD7D1C2);
  static const Color dividerMid = Color(0xFFC7C2B6);
  static const Color dividerDeep = Color(0xFFB3ADA0);
  static const Color surfaceBright = Color(0xFFFDFCFA);
  static const Color greyPanel = Color(0xFFEFEFEF);
  static const Color roseMuted = Color(0xFFD9BFB8);

  // Also present in the markup, mapped 1:1 (promoted from screen-local
  // constants — each traces to the artboards listed)
  /// Hero decorative blob rose — Client_Onboarding, Client_Urgent,
  /// Client_Search, Client_Provider, Client_Confirmation, Biz_FeaturedSpots.
  static const Color roseGlow = Color(0xFFD98B96);

  /// Onboarding tagline text — Client_Onboarding.
  static const Color tagline = Color(0xFF7A4F48);

  /// Dark video-overlay navy, used with alpha — Client_Provider.
  static const Color navyOverlay = Color(0xFF1B2A4A);

  // Text ramp
  static const Color textStrong = Color(0xFF2A2A2A);
  static const Color textPrimary = Color(0xFF3A3A3A);
  static const Color textBody = Color(0xFF5B5B5B);
  static const Color textMuted = Color(0xFF7A7A7A);
  static const Color textSubtle = Color(0xFF8A8A8A);
  static const Color textFaint = Color(0xFF9A9A9A);
  static const Color textDisabled = Color(0xFFB3B3B3);

  // Semantic — verified
  static const Color verified = Color(0xFF2E8B57);
  static const Color verifiedSoft = Color(0xFF5FA777);
  static const Color verifiedBg = Color(0xFFEAF3EC);

  // Semantic — urgent
  static const Color urgentFrom = Color(0xFFFF7A4D);
  static const Color urgentTo = Color(0xFFE8433D);
  static const Color urgentBgSoft = Color(0xFFFFF3EF);
  static const Color urgentTextSoft = Color(0xFFFFE4DA);

  // Semantic — escrow / held payment
  static const Color escrow = Color(0xFF3D8B85);
  static const Color escrowMid = Color(0xFF4E827E);
  static const Color escrowDeep = Color(0xFF2E6864);
  static const Color escrowBg = Color(0xFFEAF4F3);
  static const Color escrowBorder = Color(0xFFBFDCDA);

  // Semantic — pending
  static const Color pending = Color(0xFF9A6B1E);
  static const Color pendingBg = Color(0xFFFBF3E7);

  // Category colours — used as a set (bg + label + icon)
  static const Color hairBg = sand;
  static const Color hairLabel = Color(0xFFB3654A);
  static const Color hairIcon = Color(0xFFC97A5D);

  static const Color makeupBg = peach;
  static const Color makeupLabel = Color(0xFFA84658);
  static const Color makeupIcon = Color(0xFFC15B6B);

  static const Color nailsBg = pinkPale;
  static const Color nailsLabel = Color(0xFF855868);
  static const Color nailsIcon = Color(0xFF9C6B7A);

  static const Color spaBg = blushPale;
  static const Color spaLabel = Color(0xFF9C6539);
  static const Color spaIcon = Color(0xFFB37B4E);

  static const Color photoBg = salmon;
  static const Color photoLabel = brandDeepAlt;
  static const Color photoIcon = Color(0xFF6B4A42);

  static const Color eventLabel = sand;

  // Payment brands (external values — do not fold into the ramps)
  static const Color mtn = Color(0xFFFFCC08);
  static const Color airtel = Color(0xFFED1C24);
}

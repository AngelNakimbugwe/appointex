import 'package:flutter/material.dart';

import '../tokens/ax_colors.dart';
import '../tokens/ax_radius.dart';
import '../tokens/ax_space.dart';
import '../tokens/ax_type.dart';

/// Text field. Mobile (Register / mobile OTP): 48 high, radius 12, border
/// `#E0DBCF`, padding `0 14`, font 13.5. Desktop (Biz_Onboarding): 44 high,
/// radius 9, font 13. Placeholder `#9A9A9A`, entered text `#3A3A3A` — the
/// static artboard only shows the empty state, so entered text is a
/// deliberate extension (docs/04 §AxField).
class AxField extends StatelessWidget {
  const AxField({
    super.key,
    this.controller,
    this.hint,
    this.keyboardType,
    this.obscureText = false,
    this.desktop = false,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? hint;
  final TextInputType? keyboardType;
  final bool obscureText;

  /// Desktop variant: 44 high, radius 9, font 13.
  final bool desktop;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final height =
        desktop ? AxSpace.fieldHeightDesktop : AxSpace.fieldHeightMobile;
    final radius = desktop ? AxRadius.xs : AxRadius.card;
    final fontSize = desktop ? AxType.label : AxType.bodySm;

    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        style: AxType.text(fontSize, color: AxColors.textPrimary),
        cursorColor: AxColors.brand,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AxType.text(fontSize, color: AxColors.textFaint),
          filled: true,
          fillColor: AxColors.surface,
          contentPadding: const EdgeInsets.symmetric(horizontal: AxSpace.s14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            borderSide: const BorderSide(color: AxColors.borderStrong),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            borderSide: const BorderSide(color: AxColors.brand),
          ),
        ),
      ),
    );
  }
}

/// Field label — 12/600 `#3A3A3A` (Client_Register), 6 px above the field
/// (`.field { gap:6px }`).
class AxFieldLabel extends StatelessWidget {
  const AxFieldLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AxType.text(AxType.caption,
          weight: FontWeight.w600, color: AxColors.textPrimary),
    );
  }
}

/// Label + field column with the artboard's 6 px gap.
class AxLabeledField extends StatelessWidget {
  const AxLabeledField(
    this.label, {
    super.key,
    this.controller,
    this.hint,
    this.keyboardType,
    this.obscureText = false,
    this.desktop = false,
    this.onChanged,
  });

  final String label;
  final TextEditingController? controller;
  final String? hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool desktop;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AxSpace.s6,
      children: [
        AxFieldLabel(label),
        AxField(
          controller: controller,
          hint: hint,
          keyboardType: keyboardType,
          obscureText: obscureText,
          desktop: desktop,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

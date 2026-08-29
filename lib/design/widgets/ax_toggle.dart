import 'package:flutter/material.dart';

import '../tokens/ax_colors.dart';
import '../tokens/ax_radius.dart';
import '../tokens/ax_space.dart';

/// 36×20 toggle, knob 16, track radius 10, padding 2 (`.toggle` + `.knob`,
/// Biz_Services / Biz_Settings). On: `#6B3F3A`; off: `#D7D1C2`. Built from a
/// `Container` + `AnimatedAlign` — Flutter's `Switch` is 59×40 with a ripple
/// and cannot match this geometry.
class AxToggle extends StatefulWidget {
  const AxToggle({super.key, required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<AxToggle> createState() => _AxToggleState();
}

class _AxToggleState extends State<AxToggle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 36,
        height: 20,
        decoration: BoxDecoration(
          color: widget.value ? AxColors.brand : AxColors.dividerWarm,
          borderRadius: const BorderRadius.all(Radius.circular(AxRadius.md)),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: widget.value
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.all(AxSpace.s2),
            decoration: const BoxDecoration(
              color: AxColors.surface,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

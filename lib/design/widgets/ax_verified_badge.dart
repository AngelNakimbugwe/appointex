import 'package:flutter/material.dart';

import '../icons/ax_icon.dart';
import '../icons/ax_icons.dart';

/// The ID-verified badge: a 12 px `#2E8B57` circle with a white check
/// (`M8 12l2.5 2.5L16 9`, stroke-width 2.6). That exact mark is the two-tone
/// `check_circle.svg` asset — its colours are baked in, so it is never tinted.
class AxVerifiedBadge extends StatelessWidget {
  const AxVerifiedBadge({super.key, this.size = 12});

  final double size;

  @override
  Widget build(BuildContext context) {
    return AxDuoIcon(AxDuoIcons.checkCircle, size: size);
  }
}

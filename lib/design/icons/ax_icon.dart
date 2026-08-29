import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Monochrome UI icon, tintable via [color]. Stroke widths are baked into the
/// extracted SVG assets — never try to override them here.
class AxIcon extends StatelessWidget {
  const AxIcon(this.asset, {super.key, this.size = 20, this.color});

  final String asset;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        asset,
        width: size,
        height: size,
        colorFilter: color == null
            ? null
            : ColorFilter.mode(color!, BlendMode.srcIn),
      );
}

/// Two-tone icon (verified badge, logo mark). Carries its own colours —
/// tinting destroys it, so no `color` parameter exists.
class AxDuoIcon extends StatelessWidget {
  const AxDuoIcon(this.asset, {super.key, this.size = 20});

  final String asset;
  final double size;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        asset,
        width: size,
        height: size,
      );
}

/// 48×48 illustrative art for avatars. Carries its own colours — never tinted.
class AxArt extends StatelessWidget {
  const AxArt(this.asset, {super.key, this.size = 48});

  final String asset;
  final double size;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        asset,
        width: size,
        height: size,
      );
}

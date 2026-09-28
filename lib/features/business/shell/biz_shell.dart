import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routes.dart';
import '../../../design/icons/ax_icon.dart';
import '../../../design/icons/ax_icons.dart';
import '../../../design/tokens/ax_colors.dart';
import '../../../design/tokens/ax_gradients.dart';
import '../../../design/tokens/ax_radius.dart';
import '../../../design/tokens/ax_space.dart';
import '../../../design/tokens/ax_type.dart';
import '../../../design/widgets/ax_sidebar.dart';

/// Shared scaffold for the seven in-shell business screens
/// (`/biz/dashboard` … `/biz/settings`).
///
/// Compose it as the Scaffold body — never nested in a scroll view:
///
/// ```dart
/// Scaffold(
///   body: BizShell(
///     current: AxSidebarItem.dashboard,
///     child: DashboardContent(),
///   ),
/// )
/// ```
///
/// Layout: the fixed 220 px [AxSidebar] beside an [Expanded] content pane on
/// [AxColors.canvas] with the artboard's `26px 32px` pane padding.
/// Sidebar taps navigate via `context.go` to the route matching the item.
///
/// The pane scrolls ([SingleChildScrollView], Rule 3). [child] is laid out
/// with a tight height of *at least* the pane's inner height, so a trailing
/// `Expanded` section fills the pane exactly like the artboards' `flex:1`
/// bodies, and taller content (or large text scale) scrolls instead of
/// overflowing.
///
/// Below 900 px width (docs/03 Rule 12) the shell is replaced by a
/// "use a larger screen" panel — a documented interim call
/// (BUILD_PLAN.md § Known gaps), built only from existing tokens.
class BizShell extends StatelessWidget {
  const BizShell({super.key, required this.current, required this.child});

  /// Sidebar section this screen belongs to; highlights the matching row.
  final AxSidebarItem current;

  /// The screen content, laid out inside the scrolling content pane.
  final Widget child;

  /// docs/03-RESPONSIVE-RULES.md Rule 12 — the business dashboard is out of
  /// scope below 900 px.
  static const double _minSupportedWidth = 900;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < _minSupportedWidth) {
            return const _LargerScreenPanel();
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AxSidebar(
                current: current,
                onTap: (item) => context.go(_pathFor(item)),
              ),
              Expanded(
                child: ColoredBox(
                  color: AxColors.canvas,
                  child: LayoutBuilder(
                  builder: (context, pane) => SingleChildScrollView(
                      padding: AxSpace.bizContentPadding,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: (pane.maxHeight -
                                  AxSpace.bizContentPadding.vertical)
                              .clamp(0.0, double.infinity),
                        ),
                        child: IntrinsicHeight(child: child),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static String _pathFor(AxSidebarItem item) {
    return switch (item) {
      AxSidebarItem.dashboard => AxRoutes.bizDashboard,
      AxSidebarItem.calendar => AxRoutes.bizCalendar,
      AxSidebarItem.clients => AxRoutes.bizClients,
      AxSidebarItem.earnings => AxRoutes.bizEarnings,
      AxSidebarItem.services => AxRoutes.bizServices,
      AxSidebarItem.featured => AxRoutes.bizFeatured,
      AxSidebarItem.settings => AxRoutes.bizSettings,
    };
  }
}

/// Interim "use a larger screen" panel (BUILD_PLAN.md § Known gaps). The copy
/// is the documented call's wording; the lockup reuses the sidebar brand block
/// values (Biz_Dashboard.dc.html lines 21-25).
class _LargerScreenPanel extends StatelessWidget {
  const _LargerScreenPanel();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AxColors.canvas,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: AxSpace.s12,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                gradient: AxGradients.logo,
                borderRadius: BorderRadius.all(Radius.circular(AxRadius.sm)),
              ),
              alignment: Alignment.center,
              child: const AxDuoIcon(AxDuoIcons.logoMark, size: 16),
            ),
            Text(
              'Appointex for Business',
              style: AxType.head(
                AxType.titleLg,
                weight: FontWeight.w800,
                color: AxColors.brand,
              ),
            ),
            Text(
              'Use a larger screen',
              style: AxType.text(AxType.body, color: AxColors.textSubtle),
            ),
          ],
        ),
      ),
    );
  }
}

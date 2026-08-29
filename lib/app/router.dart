import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../design/tokens/ax_colors.dart';
import '../design/tokens/ax_type.dart';
import '../dev/gallery.dart';
import 'routes.dart';

/// Phase 0 placeholder — every route renders this until its screen is built.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AxColors.surface,
      body: SafeArea(
        child: Center(
          child: Text(
            title,
            style: AxType.head(AxType.titleLg, color: AxColors.brand),
          ),
        ),
      ),
    );
  }
}

final GoRouter axRouter = GoRouter(
  initialLocation: AxRoutes.onboarding,
  routes: [
    GoRoute(
      path: AxRoutes.onboarding,
      builder: (context, state) => const PlaceholderScreen('Client Onboarding'),
    ),
    GoRoute(
      path: AxRoutes.register,
      builder: (context, state) => const PlaceholderScreen('Register'),
    ),
    GoRoute(
      path: AxRoutes.home,
      builder: (context, state) => const PlaceholderScreen('Home'),
    ),
    GoRoute(
      path: AxRoutes.urgent,
      builder: (context, state) => const PlaceholderScreen('Urgent booking'),
    ),
    GoRoute(
      path: AxRoutes.search,
      builder: (context, state) => const PlaceholderScreen('Search'),
    ),
    GoRoute(
      path: AxRoutes.provider,
      builder: (_, state) => PlaceholderScreen(
        'Provider ${state.pathParameters['id'] ?? ''}',
      ),
    ),
    GoRoute(
      path: AxRoutes.book,
      builder: (_, state) => PlaceholderScreen(
        'Book ${state.pathParameters['id'] ?? ''}',
      ),
    ),
    GoRoute(
      path: AxRoutes.event,
      builder: (context, state) => const PlaceholderScreen('Plan an event'),
    ),
    GoRoute(
      path: AxRoutes.checkout,
      builder: (context, state) => const PlaceholderScreen('Checkout'),
    ),
    GoRoute(
      path: AxRoutes.confirmation,
      builder: (context, state) => const PlaceholderScreen('Confirmation'),
    ),
    GoRoute(
      path: AxRoutes.bookings,
      builder: (context, state) => const PlaceholderScreen('My bookings'),
    ),
    GoRoute(
      path: AxRoutes.chat,
      builder: (context, state) => const PlaceholderScreen('Chat'),
    ),
    GoRoute(
      path: AxRoutes.chatThread,
      builder: (_, state) => PlaceholderScreen(
        'Chat ${state.pathParameters['threadId'] ?? ''}',
      ),
    ),
    GoRoute(
      path: AxRoutes.profile,
      builder: (context, state) => const PlaceholderScreen('Profile'),
    ),
    GoRoute(
      path: AxRoutes.bizOnboarding,
      builder: (context, state) => const PlaceholderScreen('Biz Onboarding'),
    ),
    GoRoute(
      path: AxRoutes.bizDashboard,
      builder: (context, state) => const PlaceholderScreen('Biz Dashboard'),
    ),
    GoRoute(
      path: AxRoutes.bizCalendar,
      builder: (context, state) => const PlaceholderScreen('Biz Calendar'),
    ),
    GoRoute(
      path: AxRoutes.bizClients,
      builder: (context, state) => const PlaceholderScreen('Biz Clients'),
    ),
    GoRoute(
      path: AxRoutes.bizEarnings,
      builder: (context, state) => const PlaceholderScreen('Biz Earnings'),
    ),
    GoRoute(
      path: AxRoutes.bizServices,
      builder: (context, state) => const PlaceholderScreen('Biz Services'),
    ),
    GoRoute(
      path: AxRoutes.bizFeatured,
      builder: (context, state) => const PlaceholderScreen('Biz Featured Spots'),
    ),
    GoRoute(
      path: AxRoutes.bizSettings,
      builder: (context, state) => const PlaceholderScreen('Biz Settings'),
    ),
    GoRoute(
      path: '/dev/gallery',
      builder: (context, state) => const ComponentGallery(),
    ),
  ],
);

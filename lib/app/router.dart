import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/auth/auth_repository.dart';
import '../core/user/user_repository.dart';
import '../design/tokens/ax_colors.dart';
import '../design/tokens/ax_type.dart';
import '../features/business/calendar/presentation/calendar_screen.dart';
import '../features/business/clients/presentation/clients_screen.dart';
import '../features/business/dashboard/presentation/dashboard_screen.dart';
import '../features/business/earnings/presentation/earnings_screen.dart';
import '../features/business/featured_spots/presentation/featured_spots_screen.dart';
import '../features/business/onboarding/presentation/onboarding_screen.dart'
    as biz;
import '../features/business/services/presentation/services_screen.dart';
import '../features/business/settings/presentation/settings_screen.dart';
import '../features/client/book/presentation/book_screen.dart';
import '../features/client/chat/presentation/chat_inbox_screen.dart';
import '../features/client/chat/presentation/chat_screen.dart';
import '../features/client/checkout/presentation/checkout_screen.dart';
import '../features/client/confirmation/presentation/confirmation_screen.dart';
import '../features/client/event_bundle/presentation/event_bundle_screen.dart';
import '../features/client/home/presentation/home_screen.dart';
import '../features/client/login/presentation/login_screen.dart';
import '../features/client/my_bookings/presentation/my_bookings_screen.dart';
import '../features/client/onboarding/presentation/onboarding_screen.dart';
import '../features/client/profile/presentation/profile_screen.dart';
import '../features/client/provider/presentation/provider_screen.dart';
import '../features/client/register/presentation/register_screen.dart';
import '../features/client/search/presentation/search_screen.dart';
import '../features/client/splash/presentation/splash_screen.dart';
import '../features/client/urgent/presentation/urgent_screen.dart';
import '../dev/gallery.dart';
import 'routes.dart';

/// The Profile tab has no artboard (see BUILD_PLAN.md § Known gaps) — it stays
/// on this placeholder until a design exists for it.
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

const _authRoutes = {
  AxRoutes.splash,
  AxRoutes.onboarding,
  AxRoutes.login,
  AxRoutes.register,
  AxRoutes.bizOnboarding,
};

/// Business screens require a signed-in business account. Everything else
/// (all client routes) is browsable as a guest — a signed-out visitor may
/// explore home, search, bookings, chat and profile without an account.
const _bizRoutes = {
  AxRoutes.bizDashboard,
  AxRoutes.bizCalendar,
  AxRoutes.bizClients,
  AxRoutes.bizEarnings,
  AxRoutes.bizServices,
  AxRoutes.bizFeatured,
  AxRoutes.bizSettings,
};

/// Bridges Riverpod's auth/profile providers to go_router's [ChangeNotifier]
/// -based [GoRouter.refreshListenable] so `redirect` re-evaluates on every
/// sign-in/sign-out/profile-load transition, without ever recreating the
/// [GoRouter] instance itself. A single, stable router is what lets a
/// screen's own `context.go(...)` call (e.g. right after Google sign-in)
/// land reliably — recreating the router mid-navigation was discarding that
/// call and racing it back to the onboarding splash.
class _AuthRefreshNotifier extends ChangeNotifier {
  _AuthRefreshNotifier(Ref ref) {
    _authSub = ref.listen(authStateChangesProvider, (_, _) => notifyListeners());
    _userSub = ref.listen(currentAppUserProvider, (_, _) => notifyListeners());
  }

  late final ProviderSubscription<AsyncValue<AuthUser?>> _authSub;
  late final ProviderSubscription<AsyncValue<AppUser?>> _userSub;

  @override
  void dispose() {
    _authSub.close();
    _userSub.close();
    super.dispose();
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final refresh = _AuthRefreshNotifier(ref);
  ref.onDispose(refresh.dispose);

  return GoRouter(
    initialLocation: AxRoutes.splash,
    refreshListenable: refresh,
    redirect: (context, state) {
      final firebaseUser = ref.read(authStateChangesProvider).value;
      final atAuthRoute = _authRoutes.contains(state.matchedLocation);

      if (firebaseUser == null) {
        // Guests may browse every client route; only business screens
        // require an account, so bounce those back to onboarding.
        if (atAuthRoute) return null;
        return _bizRoutes.contains(state.matchedLocation)
            ? AxRoutes.onboarding
            : null;
      }
      final profileState = ref.read(currentAppUserProvider);
      final appUser = profileState.value;
      if (appUser == null) {
        // Profile doc still loading (or not created yet mid-onboarding) —
        // don't guess a destination; `redirect` re-runs the moment it
        // resolves, via the refreshListenable above.
        //
        // A Firestore failure puts the provider in an error state whose
        // `.value` stays null forever — waiting would strand the user on the
        // auth screen. In that case let guests browse the client routes
        // (bounce business routes to onboarding) and let the profile
        // listener's retry re-trigger this redirect once the doc loads.
        if (profileState.hasError) {
          if (atAuthRoute) return null;
          return _bizRoutes.contains(state.matchedLocation)
              ? AxRoutes.onboarding
              : null;
        }
        return null;
      }
      if (!atAuthRoute) return null;
      return appUser.role == AppUserRole.business
          ? AxRoutes.bizDashboard
          : AxRoutes.home;
    },
    routes: _routes,
  );
});

final List<RouteBase> _routes = [
    GoRoute(
      path: AxRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AxRoutes.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: AxRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AxRoutes.register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: AxRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AxRoutes.urgent,
      builder: (context, state) => const UrgentScreen(),
    ),
    GoRoute(
      path: AxRoutes.search,
      builder: (_, state) => SearchScreen(
        initialCategory: state.uri.queryParameters['category'],
      ),
    ),
    GoRoute(
      path: AxRoutes.provider,
      builder: (_, state) => ProviderScreen(
        providerId: state.pathParameters['id'] ?? '1',
      ),
    ),
    GoRoute(
      path: AxRoutes.book,
      builder: (context, state) => const BookScreen(),
    ),
    GoRoute(
      path: AxRoutes.event,
      builder: (context, state) => const EventBundleScreen(),
    ),
    GoRoute(
      path: AxRoutes.checkout,
      builder: (context, state) => const CheckoutScreen(),
    ),
    GoRoute(
      path: AxRoutes.confirmation,
      builder: (context, state) => const ConfirmationScreen(),
    ),
    GoRoute(
      path: AxRoutes.bookings,
      builder: (context, state) => const MyBookingsScreen(),
    ),
    GoRoute(
      path: AxRoutes.chat,
      builder: (context, state) => const ChatInboxScreen(),
    ),
    GoRoute(
      path: AxRoutes.chatThread,
      builder: (_, state) =>
          ChatScreen(threadId: state.pathParameters['threadId']),
    ),
    GoRoute(
      path: AxRoutes.profile,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: AxRoutes.bizOnboarding,
      builder: (context, state) => const biz.OnboardingScreen(),
    ),
    GoRoute(
      path: AxRoutes.bizDashboard,
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: AxRoutes.bizCalendar,
      builder: (context, state) => const CalendarScreen(),
    ),
    GoRoute(
      path: AxRoutes.bizClients,
      builder: (context, state) => const ClientsScreen(),
    ),
    GoRoute(
      path: AxRoutes.bizEarnings,
      builder: (context, state) => const EarningsScreen(),
    ),
    GoRoute(
      path: AxRoutes.bizServices,
      builder: (context, state) => const ServicesScreen(),
    ),
    GoRoute(
      path: AxRoutes.bizFeatured,
      builder: (context, state) => const FeaturedSpotsScreen(),
    ),
    GoRoute(
      path: AxRoutes.bizSettings,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/dev/gallery',
      builder: (context, state) => const ComponentGallery(),
    ),
];

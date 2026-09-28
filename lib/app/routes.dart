/// Route path constants — docs/02-ARCHITECTURE.md.
abstract final class AxRoutes {
  // Client
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String urgent = '/home/urgent';
  static const String search = '/search';
  static const String provider = '/provider/:id';
  static const String book = '/provider/:id/book';
  static const String event = '/event';
  static const String checkout = '/checkout';
  static const String confirmation = '/confirmation';
  static const String bookings = '/bookings';
  static const String chat = '/chat';
  static const String chatThread = '/chat/:threadId';
  static const String profile = '/profile';

  // Business
  static const String bizOnboarding = '/biz/onboarding';
  static const String bizDashboard = '/biz/dashboard';
  static const String bizCalendar = '/biz/calendar';
  static const String bizClients = '/biz/clients';
  static const String bizEarnings = '/biz/earnings';
  static const String bizServices = '/biz/services';
  static const String bizFeatured = '/biz/featured';
  static const String bizSettings = '/biz/settings';
}

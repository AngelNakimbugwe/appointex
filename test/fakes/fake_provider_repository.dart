import 'package:appointex/features/business/onboarding/data/provider_repository.dart';

class FakeProviderRepository implements ProviderRepository {
  final Map<String, BusinessProviderProfile> profiles = {};
  final Map<String, List<Map<String, Object?>>> services = {};

  @override
  Future<void> createOrUpdate(BusinessProviderProfile profile) async {
    profiles[profile.uid] = profile;
  }

  @override
  Future<void> addFirstService({
    required String providerId,
    required String category,
    required String name,
    required int durationMinutes,
    required int priceUgx,
  }) async {
    (services[providerId] ??= []).add({
      'category': category,
      'name': name,
      'durationMinutes': durationMinutes,
      'priceUgx': priceUgx,
    });
  }
}

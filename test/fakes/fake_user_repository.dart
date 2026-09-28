import 'package:appointex/core/user/user_repository.dart';

class FakeUserRepository implements UserRepository {
  final Map<String, AppUser> _users = {};

  /// Uids that had no stored profile when [createIfMissing] was called.
  Iterable<String> get createdUids => _users.keys;

  @override
  Future<AppUser?> fetchUser(String uid) async => _users[uid];

  @override
  Future<AppUser> createIfMissing({
    required String uid,
    required AppUserRole role,
    required String displayName,
    String? phoneNumber,
    String? email,
    String? photoUrl,
  }) async {
    final existing = _users[uid];
    if (existing != null) return existing;
    final user = AppUser(
      uid: uid,
      role: role,
      displayName: displayName,
      phoneNumber: phoneNumber,
      email: email,
      photoUrl: photoUrl,
    );
    _users[uid] = user;
    return user;
  }
}

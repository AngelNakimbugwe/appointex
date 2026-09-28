import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/auth_repository.dart';
import '../firebase/firebase_providers.dart';

/// The two account kinds Appointex supports. Stored on the user doc as a
/// UI/routing hint — Firestore rules gate writes by uid, not by this field
/// (see firestore.rules), so a client flipping their own `role` string gains
/// no extra access.
enum AppUserRole { client, business }

AppUserRole appUserRoleFromString(String value) {
  return value == 'business' ? AppUserRole.business : AppUserRole.client;
}

class AppUser {
  const AppUser({
    required this.uid,
    required this.role,
    required this.displayName,
    this.phoneNumber,
    this.email,
    this.photoUrl,
  });

  final String uid;
  final AppUserRole role;
  final String displayName;
  final String? phoneNumber;
  final String? email;
  final String? photoUrl;

  factory AppUser.fromMap(String uid, Map<String, dynamic> data) {
    return AppUser(
      uid: uid,
      role: appUserRoleFromString(data['role'] as String? ?? 'client'),
      displayName: data['displayName'] as String? ?? '',
      phoneNumber: data['phoneNumber'] as String?,
      email: data['email'] as String?,
      photoUrl: data['photoUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'role': role.name,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'email': email,
      'photoUrl': photoUrl,
    };
  }
}

abstract class UserRepository {
  Future<AppUser?> fetchUser(String uid);

  /// Creates `users/{uid}` if it doesn't exist yet; a no-op for a returning
  /// user so re-authenticating never overwrites their stored role/name.
  Future<AppUser> createIfMissing({
    required String uid,
    required AppUserRole role,
    required String displayName,
    String? phoneNumber,
    String? email,
    String? photoUrl,
  });
}

class FirestoreUserRepository implements UserRepository {
  FirestoreUserRepository(this._firestore);

  final FirebaseFirestore _firestore;

  DocumentReference<Map<String, dynamic>> _doc(String uid) =>
      _firestore.collection('users').doc(uid);

  @override
  Future<AppUser?> fetchUser(String uid) async {
    final snapshot = await _doc(uid).get();
    final data = snapshot.data();
    if (data == null) return null;
    return AppUser.fromMap(uid, data);
  }

  @override
  Future<AppUser> createIfMissing({
    required String uid,
    required AppUserRole role,
    required String displayName,
    String? phoneNumber,
    String? email,
    String? photoUrl,
  }) async {
    final ref = _doc(uid);
    final existing = await ref.get();
    if (existing.exists) {
      return AppUser.fromMap(uid, existing.data()!);
    }
    final user = AppUser(
      uid: uid,
      role: role,
      displayName: displayName,
      phoneNumber: phoneNumber,
      email: email,
      photoUrl: photoUrl,
    );
    await ref.set({
      ...user.toMap(),
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
    return user;
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return FirestoreUserRepository(ref.watch(firestoreProvider));
});

/// The signed-in user's Firestore profile, or `null` while signed out.
/// Drives the router's post-auth redirect (§ router.dart) — kept as a
/// [FutureProvider] rather than a stream since the profile only needs to be
/// (re)read right after a sign-in/sign-out transition, not watched live.
final currentAppUserProvider = FutureProvider<AppUser?>((ref) async {
  final firebaseUser = ref.watch(authStateChangesProvider).value;
  if (firebaseUser == null) return null;
  return ref.watch(userRepositoryProvider).fetchUser(firebaseUser.uid);
});

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/firebase/firebase_providers.dart';

class BusinessProviderProfile {
  const BusinessProviderProfile({
    required this.uid,
    required this.businessName,
    required this.category,
    required this.phone,
  });

  final String uid;
  final String businessName;
  final String category;
  final String phone;
}

abstract class ProviderRepository {
  /// Creates `providers/{uid}` on first call, updates the editable fields on
  /// later calls without touching `createdAt`/`verified`/rating fields.
  Future<void> createOrUpdate(BusinessProviderProfile profile);

  /// Adds the first `providers/{uid}/services/{id}` doc and flips
  /// `onboardingComplete` — a newly-onboarded provider must not be published
  /// with an empty service list (nothing to book).
  Future<void> addFirstService({
    required String providerId,
    required String category,
    required String name,
    required int durationMinutes,
    required int priceUgx,
  });
}

class FirestoreProviderRepository implements ProviderRepository {
  FirestoreProviderRepository(this._firestore);

  final FirebaseFirestore _firestore;

  DocumentReference<Map<String, dynamic>> _doc(String uid) =>
      _firestore.collection('providers').doc(uid);

  @override
  Future<void> createOrUpdate(BusinessProviderProfile profile) async {
    final ref = _doc(profile.uid);
    final existing = await ref.get();
    final existingData = existing.data();
    await ref.set({
      'ownerUid': profile.uid,
      'businessName': profile.businessName,
      'category': profile.category,
      'phone': profile.phone,
      'location': existingData?['location'] ?? '',
      'mobileServiceOffered': existingData?['mobileServiceOffered'] ?? false,
      'mobileFeePercent': existingData?['mobileFeePercent'] ?? 0,
      'rushFeePercent': existingData?['rushFeePercent'] ?? 0,
      'verified': existingData?['verified'] ?? false,
      'ratingAvg': existingData?['ratingAvg'] ?? 0,
      'ratingCount': existingData?['ratingCount'] ?? 0,
      'onboardingComplete': existingData?['onboardingComplete'] ?? false,
      'updatedAt': FieldValue.serverTimestamp(),
      if (!existing.exists) 'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  @override
  Future<void> addFirstService({
    required String providerId,
    required String category,
    required String name,
    required int durationMinutes,
    required int priceUgx,
  }) async {
    await _doc(providerId).collection('services').add({
      'name': name,
      'category': category,
      'durationMinutes': durationMinutes,
      'priceUgx': priceUgx,
      'active': true,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
    await _doc(providerId).set({
      'onboardingComplete': true,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}

final providerRepositoryProvider = Provider<ProviderRepository>((ref) {
  return FirestoreProviderRepository(ref.watch(firestoreProvider));
});

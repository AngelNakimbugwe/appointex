import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../firebase/firebase_providers.dart';

/// A signed-in identity, decoupled from `firebase_auth`'s [User] type so the
/// rest of the app (and tests, via an in-memory fake) never needs a real
/// Firebase app just to hold a "who's signed in" value.
class AuthUser {
  const AuthUser({
    required this.uid,
    this.phoneNumber,
    this.email,
    this.displayName,
    this.photoUrl,
  });

  final String uid;
  final String? phoneNumber;
  final String? email;
  final String? displayName;
  final String? photoUrl;
}

/// Result of [AuthRepository.sendPhoneCode]. [autoVerified] is true when the
/// platform (Android, via SMS auto-retrieval) completed sign-in before the
/// caller ever needed to show an OTP-entry screen.
class PhoneCodeSent {
  const PhoneCodeSent({
    required this.verificationId,
    this.resendToken,
    this.autoVerified = false,
  });

  final String verificationId;
  final int? resendToken;
  final bool autoVerified;
}

abstract class AuthRepository {
  Stream<AuthUser?> authStateChanges();

  AuthUser? get currentUser;

  Future<PhoneCodeSent> sendPhoneCode({
    required String phoneNumber,
    int? forceResendingToken,
  });

  Future<void> confirmPhoneCode({
    required String verificationId,
    required String smsCode,
  });

  Future<void> signInWithGoogle();

  Future<void> signOut();
}

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository(this._auth, this._googleSignIn);

  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  static AuthUser? _map(User? user) {
    if (user == null) return null;
    return AuthUser(
      uid: user.uid,
      phoneNumber: user.phoneNumber,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }

  @override
  Stream<AuthUser?> authStateChanges() => _auth.authStateChanges().map(_map);

  @override
  AuthUser? get currentUser => _map(_auth.currentUser);

  @override
  Future<PhoneCodeSent> sendPhoneCode({
    required String phoneNumber,
    int? forceResendingToken,
  }) {
    final completer = Completer<PhoneCodeSent>();
    _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      forceResendingToken: forceResendingToken,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
        if (!completer.isCompleted) {
          completer.complete(
            const PhoneCodeSent(verificationId: '', autoVerified: true),
          );
        }
      },
      verificationFailed: (e) {
        if (!completer.isCompleted) completer.completeError(e);
      },
      codeSent: (verificationId, resendToken) {
        if (!completer.isCompleted) {
          completer.complete(
            PhoneCodeSent(
              verificationId: verificationId,
              resendToken: resendToken,
            ),
          );
        }
      },
      codeAutoRetrievalTimeout: (verificationId) {
        if (!completer.isCompleted) {
          completer.complete(PhoneCodeSent(verificationId: verificationId));
        }
      },
    );
    return completer.future;
  }

  @override
  Future<void> confirmPhoneCode({
    required String verificationId,
    required String smsCode,
  }) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    await _auth.signInWithCredential(credential);
  }

  @override
  Future<void> signInWithGoogle() async {
    final account = await _googleSignIn.authenticate();
    final idToken = account.authentication.idToken;
    final credential = GoogleAuthProvider.credential(idToken: idToken);
    await _auth.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return FirebaseAuthRepository(
    ref.watch(firebaseAuthProvider),
    ref.watch(googleSignInProvider),
  );
});

final authStateChangesProvider = StreamProvider<AuthUser?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
});

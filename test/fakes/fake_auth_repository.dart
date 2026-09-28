import 'dart:async';

import 'package:appointex/core/auth/auth_repository.dart';

/// In-memory [AuthRepository] for widget tests — no real Firebase call ever
/// happens. [sendPhoneCode] always "sends a code" (never auto-verifies);
/// [confirmPhoneCode] and [signInWithGoogle] both sign in as [nextUser].
class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository({AuthUser? initialUser})
      : _controller = StreamController<AuthUser?>.broadcast() {
    _current = initialUser;
  }

  final StreamController<AuthUser?> _controller;
  AuthUser? _current;

  /// The identity [confirmPhoneCode]/[signInWithGoogle] sign in as. Tests can
  /// override this before triggering the flow to control the resulting uid.
  AuthUser nextUser = const AuthUser(uid: 'test-uid', phoneNumber: '+256700000000');

  bool throwOnSendCode = false;

  @override
  Stream<AuthUser?> authStateChanges() async* {
    // Mirrors Firebase's real authStateChanges(): a new listener sees the
    // current identity immediately, then subsequent sign-in/out events.
    yield _current;
    yield* _controller.stream;
  }

  @override
  AuthUser? get currentUser => _current;

  @override
  Future<PhoneCodeSent> sendPhoneCode({
    required String phoneNumber,
    int? forceResendingToken,
  }) async {
    if (throwOnSendCode) {
      throw StateError('Could not send a verification code.');
    }
    return const PhoneCodeSent(verificationId: 'fake-verification-id');
  }

  @override
  Future<void> confirmPhoneCode({
    required String verificationId,
    required String smsCode,
  }) async {
    _current = nextUser;
    _controller.add(_current);
  }

  @override
  Future<void> signInWithGoogle() async {
    _current = nextUser;
    _controller.add(_current);
  }

  @override
  Future<void> signOut() async {
    _current = null;
    _controller.add(null);
  }

  void dispose() => _controller.close();
}

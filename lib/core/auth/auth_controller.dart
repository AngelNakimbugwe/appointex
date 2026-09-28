import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_repository.dart';

/// Firebase Phone Auth only accepts E.164 numbers (`+256…`), but Ugandan
/// users habitually type local formats — `07…`, `7…` or bare `256…`. Fold
/// those into E.164 before sending; anything already valid passes through.
String normalizeUgandanPhone(String raw) {
  final digits = raw.replaceAll(RegExp(r'[\s\-()]'), '');
  if (digits.startsWith('+')) return digits;
  if (digits.startsWith('0') && digits.length == 10) {
    return '+256${digits.substring(1)}';
  }
  if (digits.startsWith('256')) return '+$digits';
  if (digits.startsWith('7') && digits.length == 9) return '+256$digits';
  return digits;
}

String _describeError(Object error) {
  final text = error.toString();
  // FirebaseAuthException.toString() is verbose ("[firebase_auth/...] ...");
  // strip the bracketed code prefix when present, otherwise use it as-is.
  final match = RegExp(r'^\[[^\]]+\]\s*(.*)$').firstMatch(text);
  return match?.group(1) ?? text;
}

enum AuthFlowStatus {
  idle,
  sendingCode,
  codeSent,
  verifyingCode,
  signingInWithGoogle,
  error,
}

class AuthFlowState {
  const AuthFlowState({
    this.status = AuthFlowStatus.idle,
    this.verificationId,
    this.resendToken,
    this.phoneNumber,
    this.errorMessage,
  });

  final AuthFlowStatus status;
  final String? verificationId;
  final int? resendToken;
  final String? phoneNumber;
  final String? errorMessage;
}

/// Drives the interactive phone-OTP + Google sign-in flow. Sign-in success
/// itself is observed via [authStateChangesProvider] — this controller only
/// tracks the in-between states (code sent, verifying, error) a raw auth
/// stream can't express.
class AuthController extends Notifier<AuthFlowState> {
  @override
  AuthFlowState build() => const AuthFlowState();

  AuthRepository get _repository => ref.read(authRepositoryProvider);

  Future<void> sendOtp(String phoneNumber) async {
    final e164 = normalizeUgandanPhone(phoneNumber);
    state = AuthFlowState(
      status: AuthFlowStatus.sendingCode,
      phoneNumber: e164,
    );
    try {
      final sent = await _repository
          .sendPhoneCode(phoneNumber: e164)
          .timeout(const Duration(seconds: 30));
      state = sent.autoVerified
          ? const AuthFlowState()
          : AuthFlowState(
              status: AuthFlowStatus.codeSent,
              phoneNumber: e164,
              verificationId: sent.verificationId,
              resendToken: sent.resendToken,
            );
    } on TimeoutException {
      state = AuthFlowState(
        status: AuthFlowStatus.error,
        phoneNumber: e164,
        errorMessage: 'Request timed out — check your connection and retry.',
      );
    } catch (e) {
      state = AuthFlowState(
        status: AuthFlowStatus.error,
        phoneNumber: e164,
        errorMessage: _describeError(e),
      );
    }
  }

  Future<void> verifyOtp(String smsCode) async {
    final verificationId = state.verificationId;
    if (verificationId == null) return;
    state = AuthFlowState(
      status: AuthFlowStatus.verifyingCode,
      phoneNumber: state.phoneNumber,
      verificationId: verificationId,
    );
    try {
      await _repository.confirmPhoneCode(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      state = const AuthFlowState();
    } catch (e) {
      state = AuthFlowState(
        status: AuthFlowStatus.error,
        phoneNumber: state.phoneNumber,
        verificationId: verificationId,
        errorMessage: _describeError(e),
      );
    }
  }

  Future<void> signInWithGoogle() async {
    state = const AuthFlowState(status: AuthFlowStatus.signingInWithGoogle);
    try {
      await _repository
          .signInWithGoogle()
          .timeout(const Duration(seconds: 45));
      state = const AuthFlowState();
    } on TimeoutException {
      state = AuthFlowState(
        status: AuthFlowStatus.error,
        errorMessage:
            'Google sign-in timed out — check Play Services and retry.',
      );
    } catch (e) {
      // ignore: avoid_print
      print('Google sign-in error: $e');
      state = AuthFlowState(
        status: AuthFlowStatus.error,
        errorMessage: 'Google sign-in failed: ${_describeError(e)}',
      );
    }
  }

  void reset() => state = const AuthFlowState();
}

final authControllerProvider =
    NotifierProvider<AuthController, AuthFlowState>(AuthController.new);

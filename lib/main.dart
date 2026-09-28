import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'app/app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  const webOAuthClientId =
      '806678683521-3aug5u8bmf00smejlgb2cc9tping96gk.apps.googleusercontent.com';
  await GoogleSignIn.instance.initialize(
    // On web, the plugin (Google Identity Services) rejects serverClientId
    // outright and wants the same Web OAuth client passed as clientId
    // instead. On Android, it's the reverse: Credential Manager-based
    // sign-in needs serverClientId to build the ID-token request.
    serverClientId: kIsWeb ? null : webOAuthClientId,
    clientId: kIsWeb ? webOAuthClientId : null,
  );
  runApp(const ProviderScope(child: AxApp()));
}

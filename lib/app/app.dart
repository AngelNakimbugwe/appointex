import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../design/theme.dart';
import 'router.dart';

class AxApp extends ConsumerWidget {
  const AxApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Appointex',
      theme: AxTheme.light,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

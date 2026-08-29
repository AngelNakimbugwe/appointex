import 'package:flutter/material.dart';

import '../design/theme.dart';
import 'router.dart';

class AxApp extends StatelessWidget {
  const AxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Appointex',
      theme: AxTheme.light,
      debugShowCheckedModeBanner: false,
      routerConfig: axRouter,
    );
  }
}

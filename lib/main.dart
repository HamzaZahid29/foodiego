import 'package:flutter/material.dart';

import 'core/app_constants.dart';
import 'core/app_router.dart';
import 'core/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      title: AppConstants.appName,
      routerConfig: router,
    );
  }
}


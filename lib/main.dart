import 'package:flutter/material.dart';
import 'package:foodiego/views/pages/orders/controller/categories_controller.dart';
import 'package:provider/provider.dart';

import 'core/app_constants.dart';
import 'core/app_router.dart';
import 'core/app_themes.dart';

void main() {

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=> CategoryController()),
    ],
    child: MyApp(),
  ));
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


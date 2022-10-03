import 'package:flutter/material.dart';
import 'package:test_fluttercrew/core/app_router.dart';
import 'package:test_fluttercrew/core/app_theme.dart';
import 'package:test_fluttercrew/widgets/setup.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Setup(
      builder: (context) {
        return MaterialApp.router(
          theme: AppTheme.theme,
          title: 'Fluttercrew Test',
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

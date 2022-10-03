import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_fluttercrew/screens/cart/cart_screen.dart';
import 'package:test_fluttercrew/screens/home/home_screen.dart';
import 'package:test_fluttercrew/screens/view/view_screen.dart';
import 'package:test_fluttercrew/widgets/app_scaffold.dart';

typedef RouteBuilder = Widget Function(BuildContext, GoRouterState);

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  //TODO: find better solution for this
  static String _getPath(String path) => path.replaceFirst('/', '');

  static final List<RouteBase> _routes = [
    ShellRoute(
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        GoRoute(
          path: HomeScreen.path,
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: _getPath(CartScreen.path),
              builder: (context, state) => const CartScreen(),
            ),
            GoRoute(
              path: _getPath(ViewScreen.path),
              builder: (context, state) => const ViewScreen(),
            ),
          ],
        ),
      ],
    ),
  ];

  static final GoRouter router = GoRouter(
    routes: _routes,
    navigatorKey: navigatorKey,
    initialLocation: HomeScreen.path,
  );
}

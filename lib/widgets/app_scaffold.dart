import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_fluttercrew/screens/cart/cart_screen.dart';
import 'package:test_fluttercrew/screens/home/home_screen.dart';
import 'package:test_fluttercrew/screens/view/view_screen.dart';
import 'package:test_fluttercrew/widgets/app_bottom_nav_bar.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;

  AppScaffold({super.key, required this.child});

  final _routes = [
    HomeScreen.path,
    CartScreen.path,
  ];

  int _getCurrentRouteIndex(String location) {
    if (location.startsWith(CartScreen.path)) {
      return 1;
    }
    //TODO: clarify this moment
    if (location.startsWith(ViewScreen.path)) {
      return 1;
    }
    return 0;
  }

  void _handleChangeRoute(BuildContext context, int index) {
    context.go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    print(GoRouter.of(context).location);
    final location = GoRouter.of(context).location;
    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _getCurrentRouteIndex(location),
        onChangeRoute: (index) => _handleChangeRoute(context, index),
      ),
    );
  }
}

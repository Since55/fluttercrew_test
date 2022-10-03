import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onChangeRoute;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onChangeRoute,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onChangeRoute,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Cart',
          icon: Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class AppBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTapped;
  const AppBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTapped,
  });
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_rounded), label: ''),
      ],
      currentIndex: currentIndex,
      onTap: (index) => onTapped(index),
    );
  }
}

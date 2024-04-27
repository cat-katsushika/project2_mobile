import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MyBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: Colors.white,
      onDestinationSelected: onItemTapped,
      indicatorColor: const Color(0xFFE9DEF8),
      selectedIndex: selectedIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: '',
        ),
        NavigationDestination(
          icon: Icon(Icons.search),
          label: '',
        ),
        NavigationDestination(
            icon: Icon(Icons.settings),
          label: '',
        ),
      ],
    );
  }
}



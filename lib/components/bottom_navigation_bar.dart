import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MyBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  // @override
  // Widget build(BuildContext context) {
  //   return BottomNavigationBar(
  //     items: const <BottomNavigationBarItem>[
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.home),
  //         label: '',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.search),
  //         label: '',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.settings),
  //         label: '',
  //       ),
  //     ],
  //     currentIndex: selectedIndex,
  //     selectedItemColor: Colors.amber[800],
  //     onTap: onItemTapped,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: const Color(0xFFF2ECF4),
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



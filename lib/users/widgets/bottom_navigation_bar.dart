import 'package:flutter/material.dart';
import 'package:project2_mobile/shared/constants/colors.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MyBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: CustomColors.surfaceContainer,
      onDestinationSelected: onItemTapped,
      indicatorColor: Theme.of(context).colorScheme.secondaryContainer,
      selectedIndex: selectedIndex,
      destinations: <Widget>[
        NavigationDestination(
          icon: Icon(Icons.home, color: Theme.of(context).colorScheme.onSecondaryContainer),
          label: '',
        ),
        NavigationDestination(
          icon: Icon(Icons.search, color: Theme.of(context).colorScheme.onSecondaryContainer),
          label: '',
        ),
        NavigationDestination(
            icon: Icon(Icons.settings, color: Theme.of(context).colorScheme.onSecondaryContainer),
          label: '',
        ),
      ],
    );
  }
}



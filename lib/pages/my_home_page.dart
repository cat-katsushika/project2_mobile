import 'package:flutter/material.dart';
import 'package:project2_mobile/components/my_home_page/my_floating_action_button.dart';
import 'package:project2_mobile/components/search_bar.dart';
import 'package:project2_mobile/components/others_list.dart';
import 'package:project2_mobile/components/bottom_navigation_bar.dart';
import 'package:project2_mobile/components/my_teams_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget>  _widgetOptions = <Widget>[
    const MyTeamsList(),
    MySearchBar( // Add this line
      controller: TextEditingController(),
      onSearch: () {},
    ),
    const Others(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex == 0
          ? const MyFloatingActionButton()
          : null,
    );
  }
}

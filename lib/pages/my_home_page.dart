import 'package:flutter/material.dart';
import 'package:project2_mobile/components/my_home_page/my_floating_action_button.dart';
import 'package:project2_mobile/components/bottom_navigation_bar.dart';
import 'package:project2_mobile/components/my_home_page/index_1.dart';
import 'package:project2_mobile/components/my_home_page/index_0.dart';
import 'package:project2_mobile/components/my_home_page/index_2.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget>  _widgetOptions = <Widget>[
    Index0(),
    Index1(),
    Index2(),
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

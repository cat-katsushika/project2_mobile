import 'package:flutter/material.dart';
import 'package:project2_mobile/users/widgets/bottom_navigation_bar.dart';
import 'package:project2_mobile/teams/screens/team_search_view.dart';
import 'package:project2_mobile/users/screens/others_view.dart';
import 'package:project2_mobile/shared/constants/colors.dart';
import 'package:project2_mobile/teams/switchers/my_team_list_view_switcher.dart';
import 'package:project2_mobile/users/widgets/my_floating_action_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _isDetail = false;
  late final List<Widget> _widgetOptions; 

  _MyHomePageState() {
    _widgetOptions = <Widget>[
      const MyTeamListViewSwitcher(),
      const TeamSearchView(),
      OthersView(),
  ];
  }


  void changeParentState(bool childState) {
    setState(() {
      _isDetail = childState;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.surfaceContainer,
        title: const Center(
          child: Text('project2'),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: (_selectedIndex == 1 && !_isDetail)
          ? const MyFloatingActionButton()
          : null,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project2_mobile/components/my_home_page/my_floating_action_button.dart';
import 'package:project2_mobile/components/bottom_navigation_bar.dart';
import 'package:project2_mobile/components/my_home_page/team_search_view.dart';
import 'package:project2_mobile/components/my_home_page/my_team_list_view.dart';
import 'package:project2_mobile/components/my_home_page/others_view.dart';
import 'package:project2_mobile/const/colors.dart';

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
      MyTeamListView(changeParentState: changeParentState),
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
          child: Text('たすくぼんばー'),
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
      floatingActionButton: (_selectedIndex == 0 && !_isDetail)
          ? const MyFloatingActionButton()
          : null,
    );
  }
}

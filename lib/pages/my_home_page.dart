import 'package:flutter/material.dart';
import 'package:project2_mobile/components/search_bar.dart';
import 'package:project2_mobile/components/others_list.dart';
import 'package:project2_mobile/components/bottom_navigation_bar.dart';
import 'package:project2_mobile/components/my_teams_list.dart';
import 'package:project2_mobile/pages/create_team_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MyTeamsList(),
    MySearchBar( // Add this line
      controller: TextEditingController(),
      onSearch: () {},
    ),
    Others(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTeamPage()));
              },
              child: const Icon(Icons.face_retouching_natural_outlined),
            )
          : null,
    );
  }
}

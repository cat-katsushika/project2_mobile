import 'package:flutter/material.dart';
import 'package:project2_mobile/components/my_home_page/team_search_view/my_search_bar.dart';

class TeamSearchView extends StatelessWidget {
  const TeamSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MySearchBar( // Add this line
      controller: TextEditingController(),
      onSearch: () {},
    );
  }
}
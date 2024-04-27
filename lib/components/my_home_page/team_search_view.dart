import 'package:flutter/material.dart';
import 'package:project2_mobile/components/my_home_page/team_search_view/my_search_bar.dart';

class TeamSearchView extends StatelessWidget {
  TeamSearchView({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MySearchBar(
          controller: controller,
          onSearch: () {},
        ),
      ],
    );
  }
}
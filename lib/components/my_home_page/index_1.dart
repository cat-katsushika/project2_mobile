import 'package:flutter/material.dart';
import 'package:project2_mobile/components/my_home_page/index_1/my_search_bar.dart';

class Index1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MySearchBar( // Add this line
      controller: TextEditingController(),
      onSearch: () {},
    );
  }
}
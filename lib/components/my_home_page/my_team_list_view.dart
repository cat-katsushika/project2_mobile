import 'package:flutter/material.dart';
import 'package:project2_mobile/components/my_home_page/my_team_list_view/my_teams_list.dart';
import 'package:project2_mobile/components/my_home_page/my_team_list_view/team_detail_page.dart';
import 'package:project2_mobile/models/team.dart';

class MyTeamListView extends StatefulWidget {
  const MyTeamListView({Key? key}) : super(key: key);

  @override
  State<MyTeamListView> createState() => _MyTeamListViewState();
}

class _MyTeamListViewState extends State<MyTeamListView> {
  bool _isDetail = false;
  late Team team;

  void _toggleDetail(team) {
    setState(() {
      _isDetail = !_isDetail;
      this.team = team;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isDetail) {
      return TeamDetailPage(team: team, changeIsDetail: _toggleDetail);
    }
    else {
      return MyTeamsList(changeIsDetail: _toggleDetail);
    }
  }
}
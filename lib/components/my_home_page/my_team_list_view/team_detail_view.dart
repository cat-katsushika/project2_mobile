import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project2_mobile/components/my_home_page/my_team_list_view/team_detail_view/continuation_count.dart';
import 'package:project2_mobile/components/my_home_page/my_team_list_view/team_detail_view/user_list.dart';
import 'package:project2_mobile/components/my_home_page/my_team_list_view/team_detail_view/countdown_widget.dart';
import 'package:project2_mobile/models/team.dart';
import 'package:project2_mobile/utils/fetch_team_detail.dart';


class TeamDetailView extends StatelessWidget {
  final Team team;
  final Function changeIsDetail;
  final Future<TeamDetail> teamDetail;

  TeamDetailView({Key? key, required this.team, required this.changeIsDetail})
      : teamDetail = fetchTeamDetail(team.id),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TeamDetail>(
      future: teamDetail,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return Center(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        changeIsDetail(team);
                      },
                    ),
                    Text(
                      snapshot.data!.team.name,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ContinuationCount(continuationCount: '${snapshot.data!.continuationCount}'),
                const SizedBox(height: 40),
                UserList(username: snapshot.data!.task.user, users: snapshot.data!.users),
                const SizedBox(height: 20),
                
                CountdownWidget(
                    startTime:
                        DateTime.now().subtract(const Duration(hours: 12))),
                const Divider(),
                Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FilledButton(
                              onPressed: () {}, child: const Text('完了して次の人にパス'))
                        ]))
              ],
            ),
          ));
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}

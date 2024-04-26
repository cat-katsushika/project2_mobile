import 'package:flutter/material.dart';
import 'package:project2_mobile/models/team.dart';
import 'package:project2_mobile/utils/fetch_team_detail.dart';

class TeamDetailPage extends StatelessWidget {

  final Team team;
  final Future<TeamDetail> teamDetail;

  TeamDetailPage({Key? key, required this.team}) : 
  teamDetail = fetchTeamDetail(team.id),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(team.name),
      ),
      body: Center(
        child: TeamDetailView(team: team)
      ),
    );
  }
}



class TeamDetailView extends StatelessWidget {
  final Team team;
  final Future<TeamDetail> teamDetail;

  TeamDetailView({Key? key, required this.team}) : 
  teamDetail = fetchTeamDetail(team.id),
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
            child: Column(
              children: <Widget>[
                const Text('継続回数'),
                Text('${snapshot.data!.continuationCount}'),
                Text('${snapshot.data!.task.user}の番'),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FilledButton(onPressed: () {}, child: const Text('完了して次の人にパス'))
                  ]
                )
                )
              ],
            ),
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
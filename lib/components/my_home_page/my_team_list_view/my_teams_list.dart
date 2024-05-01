import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project2_mobile/models/team.dart';
import 'package:project2_mobile/providers/my_teams_provider.dart';

class MyTeamsList extends ConsumerWidget {
  final Function changeIsDetail;
  const MyTeamsList({super.key, required this.changeIsDetail});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Team>> teams = ref.watch(myTeamsProvider);
    return Center(
      child: teams.when(
        data: (value) {
          if (value.isEmpty) {
            return const TeamIsNotExists();
          }
          else {
            return ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                final team = value[index];
                return TeamCard(team: team, changeIsDetail: changeIsDetail);
              },
            );
          }
        },
        error: (error, stack) => Text('エラーが発生しました: $error'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  final Team team;
  Function changeIsDetail;

  TeamCard({super.key, required this.team, required this.changeIsDetail});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: InkWell(
        onTap: () {
          // チーム詳細画面へ遷移
          changeIsDetail(team);
        },
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(team.name),
              subtitle: Text(team.description),
            ),
          ],
        ),
      )
    );
  }
}

class TeamIsNotExists extends StatelessWidget {
  const TeamIsNotExists({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('チームがありません');
  }
}
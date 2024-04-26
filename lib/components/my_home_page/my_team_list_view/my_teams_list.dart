import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project2_mobile/models/team.dart';
import 'package:project2_mobile/providers/team_provider.dart';
import 'package:project2_mobile/pages/team_detail_page.dart';

class MyTeamsList extends ConsumerWidget {
  const MyTeamsList({super.key});

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
                return TeamCard(team: team);
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

  const TeamCard({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: InkWell(
        onTap: () {
          // チーム詳細画面へ遷移
          Navigator.push(context, MaterialPageRoute(builder: (context) => TeamDetailPage(team: team)));
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
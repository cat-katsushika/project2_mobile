import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project2_mobile/teams/models/team.dart';
import 'package:project2_mobile/teams/widgets/my_team_card.dart';
import 'package:project2_mobile/teams/view_models/my_team_list_provider.dart';


class MyTeamList extends ConsumerWidget {
  const MyTeamList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Team>> teams = ref.watch(myTeamListProvider);
    return Center(
      child: teams.when(
        data: (value) {
          if (value.isEmpty) {
            return const TeamIsNotExists();
          } else {
            return ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                final team = value[index];
                return Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child:
                        MyTeamCard(team: team));
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


class TeamIsNotExists extends StatelessWidget {
  const TeamIsNotExists({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('チームに所属していません');
  }
}
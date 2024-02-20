import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project2_mobile/models/team.dart';
import 'package:project2_mobile/providers/team_provider.dart';

class MyTeamsList extends ConsumerWidget {
  const MyTeamsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Team>> teams = ref.watch(myTeamsProvider);
        
    return Center(
      child: teams.when(
        data: (value) => ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            final team = value[index];
            return ListTile(
              title: Text(team.name),
              subtitle: Text(team.description),
            );
          },
        ),
        error: (error, stack) => Text('エラーが発生しました: $error'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
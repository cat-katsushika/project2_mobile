import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project2_mobile/models/team.dart';
import 'package:project2_mobile/providers/my_team_list_provider.dart';

class MyTeamsList extends ConsumerWidget {
  final Function changeIsDetail;
  const MyTeamsList({super.key, required this.changeIsDetail});

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
                        MyTeamCard(team: team, changeIsDetail: changeIsDetail));
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

class MyTeamCard extends StatelessWidget {
  final Team team;
  final Function changeIsDetail;

  const MyTeamCard(
      {super.key, required this.team, required this.changeIsDetail});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: Colors.transparent,
      child: SizedBox(
        height: 144,
        width: 360,
        child: InkWell(
          onTap: () {
            // チーム詳細画面へ遷移
            changeIsDetail(team);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 72,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 12, right: 4, bottom: 12),
                    child: Text(
                      team.name,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 72,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 40,
                          child: Text(
                            team.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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

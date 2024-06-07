import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project2_mobile/teams/models/team_detail.dart';
import 'package:project2_mobile/teams/services/fetch_team_detail.dart';
import 'package:project2_mobile/teams/view_models/selected_team_notifier.dart';
import 'package:project2_mobile/teams/widgets/user_list.dart';
import 'package:project2_mobile/teams/widgets/continuation_count.dart';
import 'package:project2_mobile/teams/widgets/countdown_widget.dart';
import 'package:project2_mobile/teams/switchers/my_team_list_view_index_notifier.dart';




class TeamDetailView extends ConsumerWidget {
  const TeamDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final team = ref.watch(selectedTeamNotifierProvider);
    final teamDetail = fetchTeamDetail(team.id);
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
                        ref.read(myTeamListViewIndexNotifierProvider.notifier).changeIndex(0);
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
                        DateTime.parse(snapshot.data!.task.createdAt)),
                const SizedBox(height: 20),
                const Divider(),
                Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 10.0, bottom: 30.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                              width: 192,
                              height: 40,
                              child: FilledButton(
                              onPressed: () {},
                              child: Text(
                                '完了して次の人にパス',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                              )
                              ),
                          ),
                          
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

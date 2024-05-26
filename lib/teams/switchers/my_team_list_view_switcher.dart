import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project2_mobile/teams/switchers/my_team_list_view_index_notifier.dart';
import 'package:project2_mobile/teams/screens/my_team_list_view.dart';
import 'package:project2_mobile/teams/screens/team_detail_view.dart';

class MyTeamListViewSwitcher extends ConsumerWidget {
  const MyTeamListViewSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myTeamListViewIndex = ref.watch(myTeamListViewIndexNotifierProvider);

    return IndexedStack(
      index: myTeamListViewIndex,
      children: const [
        MyTeamListView(), // 0: 所属チームリスト
        TeamDetailView(), // 1: チーム詳細
      ],
    );
  }
}

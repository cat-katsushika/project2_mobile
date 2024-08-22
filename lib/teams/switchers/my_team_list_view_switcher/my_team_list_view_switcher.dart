import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project2_mobile/teams/switchers/my_team_list_view_switcher/my_team_list_view_name_notifier.dart';
import 'package:project2_mobile/teams/screens/my_team_list_page.dart';
import 'package:project2_mobile/teams/screens/team_detail_view.dart';

class MyTeamListViewSwitcher extends ConsumerWidget {
  const MyTeamListViewSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final myTeamListViewName = ref.watch(myTeamListViewNameNotifierProvider);

    if (myTeamListViewName == "myTeamListView") {
      return const MyTeamListPage();
    }
    else if (myTeamListViewName == "teamDetailView") {
      return const TeamDetailView();
    }
    else {
      debugPrint("ERROR: from:MyTeamListViewSwitcher myTeamListViewName is not 'myTeamListView' or 'teamDetailView' vaue is $myTeamListViewName");
      return const MyTeamListPage();
    }
  }
}

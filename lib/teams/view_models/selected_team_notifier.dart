import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:project2_mobile/teams/models/team.dart';

part 'selected_team_notifier.g.dart';

@Riverpod(keepAlive: true)
class SelectedTeamNotifier extends _$SelectedTeamNotifier {
  
  @override
  Team build() {
    debugPrint("SelectedTeamNotifier:build");
    return const Team(id: "xxxx", name: "本来は表示されないチーム", description: "自分のチームの一覧から選択されたチームを返すNotifierの初期値");
  }

  void changeTeam(Team team) {
    state = team;
    debugPrint("SelectedTeamNotifier:changeTeam: $state");
  }
}
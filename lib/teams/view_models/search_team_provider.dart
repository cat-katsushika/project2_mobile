import 'package:project2_mobile/teams/services/search_team.dart';
import 'package:dio/dio.dart';

import 'package:project2_mobile/teams/models/team.dart';


Future<List<Team>> searchTeam(searchQuery) async {
  Response response = await searchTeamsApi(searchQuery);

  if (response.statusCode == 200) {
    final List<dynamic> teams = response.data['results'];
    return teams.map((team) => Team.fromJson(team)).toList();
  } else {
    throw Exception('チームの検索に失敗しました');
  }
}

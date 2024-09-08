import 'package:flutter/material.dart';
import 'package:project2_mobile/shared/services/api_client.dart';
import 'package:project2_mobile/teams/models/team_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project2_mobile/teams/models/team.dart';
import 'package:project2_mobile/shared/constants/urls.dart';


part 'my_team_list_provider.g.dart';


@riverpod
class MyTeamList extends _$MyTeamList {
  @override
  Future<List<Team>> build() async {

    ApiService apiService = ApiService(ref);
    final response = await apiService.getData(Urls.myTeamListUrl);

    // responseのstatusCodeが200になった場合
    if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;
        final results = json['results'] as List<dynamic>;
        debugPrint("DEBUG: MyTeamList: チーム一覧を取得した, results: $results");
        return results.map((e) => Team.fromJson(e)).toList();
    }
    throw Exception('Failed to load team');
  }


  /// 新しいチームを作成する
  Future<bool> createTeam({required String name, required String description}) async {

    ApiService apiService = ApiService(ref);
    final data = {
      'name': name,
      'description': description,
    };
    final response = await apiService.postData(Urls.createTeamUrl, data);
    if (response.statusCode == 201) {
      ref.invalidateSelf();
      await future;
      return true;
    } 
    else {
      debugPrint('チームの作成に失敗しました');
      return false;
    }
  }

  Future<TeamDetail> fetchTeamDetail({required String teamId}) async {
    ApiService apiService = ApiService(ref);
    final response = await apiService.getData(Urls.teamDetailUrl(teamId));
    if (response.statusCode == 200) {
      final json = response.data as Map<String, dynamic>;
      final teamDetail = TeamDetail.fromJson(json);
      return teamDetail;
    } else {
      throw Exception('Failed to load team');
    }
  }


}
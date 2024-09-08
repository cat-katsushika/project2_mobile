import 'package:project2_mobile/shared/services/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project2_mobile/teams/models/team.dart';
import 'package:project2_mobile/shared/constants/urls.dart';


part 'search_team_list_provider.g.dart';


@riverpod
class SearchTeamList extends _$SearchTeamList {

  @override
  Future<List<Team>> build() async {
    ApiService apiService = ApiService(ref);
    final response = await apiService.getData(Urls.searchTeamUrl(""));
    if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;
        final results = json['results'] as List<dynamic>;
        return results.map((e) => Team.fromJson(e)).toList();
    }
    throw Exception('Failed to load team');
  }


  /// チームを検索し，その結果でリストを更新する
  Future<void> searchTeam(String query) async {
    state = const AsyncValue.loading();
    ApiService apiService = ApiService(ref);
    final response = await apiService.getData(Urls.searchTeamUrl(query));
    if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;
        final results = json['results'] as List<dynamic>;
        final teams = results.map((e) => Team.fromJson(e)).toList();
        state = AsyncValue.data(teams);
    }
    throw Exception('Failed to load team');
  }
}
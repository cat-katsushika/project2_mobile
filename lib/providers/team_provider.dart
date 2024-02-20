import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project2_mobile/models/team.dart';

part 'team_provider.g.dart';


@riverpod
Future<List<Team>> myTeams(MyTeamsRef ref) async {
  final response = await http.get(Uri.http('localhost:8000', '/v1/teams'));
  final bodyBytes = response.bodyBytes; // レスポンスボディをバイトとして取得
  if (response.statusCode == 200) {
      final jsonString = utf8.decode(bodyBytes); // UTF-8でデコード
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      final results = json['results'] as List<dynamic>;
      return results.map((e) => Team.fromJson(e)).toList();
  }
  throw Exception('Failed to load team');
}
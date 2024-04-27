import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project2_mobile/models/team.dart';
import 'package:project2_mobile/utils/token_refresh.dart';

part 'my_teams_provider.g.dart';


@riverpod
Future<List<Team>> myTeams(MyTeamsRef ref) async {

  final results = [
    {
      "id": "c1c61f36-6032-4d39-a649-6ad16ee4f00c",
      "name" : "統計の勉強を10分",
      "description" : "統計の勉強を10分取り組んだらOKです"
    }
  ];
  return results.map((e) => Team.fromJson(e)).toList();

  // const storage = FlutterSecureStorage();
  // final String? access = await storage.read(key: 'access');
  // var response = await http.get(
  //   Uri.http('localhost:8000', '/v1/teams'),
  //   headers: <String, String>{'Authorization': 'Bearer $access'},
  // );
  // final bodyBytes = response.bodyBytes; // レスポンスボディをバイトとして取得
  // if (response.statusCode == 401) {
  //   print("DEBUG: チーム一覧を取得しようとしたが，認証ではじかれた");
  //   final bool result = await updateToken();
  //   print("DEBUG: トークン更新の結果: $result");
  //   if (result) {
  //     final String? access = await storage.read(key: 'access');
  //     response = await http.get(
  //       Uri.http('localhost:8000', '/v1/teams'),
  //       headers: <String, String>{'Authorization': 'Bearer $access'},
  //     );
  //   } else {
  //     throw Exception('Failed to load team');
  //   }
  // }
  // if (response.statusCode == 200) {
  //     final jsonString = utf8.decode(bodyBytes); // UTF-8でデコード
  //     final json = jsonDecode(jsonString) as Map<String, dynamic>;
  //     final results = json['results'] as List<dynamic>;
  //     return results.map((e) => Team.fromJson(e)).toList();
  // }
  // throw Exception('Failed to load team');
}
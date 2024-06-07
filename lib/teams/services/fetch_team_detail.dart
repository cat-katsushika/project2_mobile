import 'package:project2_mobile/teams/models/team_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project2_mobile/shared/constants/urls.dart';
import 'package:flutter/material.dart';
import 'package:project2_mobile/users/view_models/token_refresh.dart';

Future<TeamDetail> fetchTeamDetail(String id) async {

  // // Djangoを使わないとき用
  // if (id == "001") {
  //   final Map<String, dynamic> jsonData = {
  //     "team": {
  //       "id": "c1c61f36-6032-4d39-a649-6ad16ee4f00c",
  //       "name": "統計の勉強を10分",
  //       "description": "統計の勉強を10分取り組んだらOKです"
  //     },
  //     "task": {
  //       "id": "b22157a3-5951-48c4-b6fa-721b17d55d45",
  //       "user": "testuser2",
  //       "created_at": "2024-05-13T21:43:49+09:00"
  //     },
  //     "continuation_count": 12,
  //     "users": [
  //       {"id": "b22157a3-5951-48c4-b6fa-721b17d55d45", "username": "testuser1"},
  //       {"id": "b22157a3-5951-48c4-b6fa-721b17d55d45", "username": "testuser2"}
  //     ]
  //   };
  //   TeamDetail aaa = TeamDetail.fromJson(jsonData);
  //   return aaa;
  // }
  // else {
  //   final Map<String, dynamic> jsonData = {
  //   "team": {
  //     "id": "c1c61f36-6032-4d39-a649-6ad16ee4f00c",
  //     "name": "英語の勉強を10分",
  //     "description": "統計の勉強を10分取り組んだらOKです"
  //   },
  //   "task": {
  //     "id": "b22157a3-5951-48c4-b6fa-721b17d55d45",
  //     "user": "cccc",
  //     "created_at": "2024-05-13T21:43:49+09:00"
  //   },
  //   "continuation_count": 44,
  //   "users": [
  //     {"id": "b22157a3-5951-48c4-b6fa-721b17d55d45", "username": "cccc"},
  //     {"id": "b22157a3-5951-48c4-b6fa-721b17d55d45", "username": "dddd"}
  //   ]
  // };
  // TeamDetail aaa = TeamDetail.fromJson(jsonData);
  // return aaa;
  // }
  // // Djangoを使わない時用


  // Djangoを使うとき用
  const storage = FlutterSecureStorage();
  final String? access = await storage.read(key: 'access');
  var response = await http.get(
    Uri.http(Urls.host, '/v1/teams/detail/$id'),
    headers: <String, String>{'Authorization': 'Bearer $access'},
  );

  if (response.statusCode == 401) {
      debugPrint("DEBUG: fetchTeamDetail: チーム詳細を取得しようとしたが，認証ではじかれた");
      final bool result = await updateToken();
      if (result) {
        final String? access = await storage.read(key: 'access');
        debugPrint("DEBUG: fetchTeamDetail: 新しいアクセストークン: $access");
        response = await http.get(
              Uri.http(Urls.host, '/v1/teams/detail/$id'),
          headers: <String, String>{'Authorization': 'Bearer $access'},
        );
      } else {
        throw Exception('Failed to load team');
      }
  }

  if (response.statusCode == 200) {
    final jsonString = utf8.decode(response.bodyBytes); // UTF-8でデコード
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return TeamDetail.fromJson(json);
  }
  throw Exception('Failed to load team');
  
}


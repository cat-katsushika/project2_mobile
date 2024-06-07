import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project2_mobile/teams/models/team.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project2_mobile/users/view_models/token_refresh.dart';
import 'package:project2_mobile/shared/constants/urls.dart';


part 'my_team_list_provider.g.dart';


@riverpod
class MyTeamList extends _$MyTeamList {
  @override
  Future<List<Team>> build() async {

  //   // Djangoを使わない場合
  //   final results = [
  //     {
  //       "id": "001",
  //       "name" : "統計の勉強を10分",
  //       "description" : "統計の勉強を10分取り組んだらOKです"
  //     },
  //     {
  //       "id": "002",
  //       "name" : "英語が大好きです．勉強を10分します",
  //       "description" : "英語の勉強を10分取り組んだらOKです"
  //     }
  //   ];
  //   return results.map((e) => Team.fromJson(e)).toList();
  // }

    // Djangoを使う場合
    const storage = FlutterSecureStorage();
    final String? access = await storage.read(key: 'access');
    var response = await http.get(
      Uri.http(Urls.host, '/v1/teams'),
      headers: <String, String>{'Authorization': 'Bearer $access'},
    );

    if (response.statusCode == 401) {
      debugPrint("DEBUG: MyTeamList: チーム一覧を取得しようとしたが，認証ではじかれた");
      final bool result = await updateToken();
      debugPrint("DEBUG: MyTeamList: トークン更新の結果: $result");
      if (result) {
        final String? access = await storage.read(key: 'access');
        debugPrint("DEBUG: MyTeamList: 新しいアクセストークン: $access");
        response = await http.get(
          Uri.http(Urls.host, '/v1/teams'),
          headers: <String, String>{'Authorization': 'Bearer $access'},
        );
      } else {
        throw Exception('Failed to load team');
      }
    }

    // responseのstatusCodeが200になった場合
    if (response.statusCode == 200) {
        final jsonString = utf8.decode(response.bodyBytes); // UTF-8でデコード
        final json = jsonDecode(jsonString) as Map<String, dynamic>;
        print('自分が所属しているチーム一覧: $json');
        final results = json['results'] as List<dynamic>;
        return results.map((e) => Team.fromJson(e)).toList();
    }
    throw Exception('Failed to load team');
    }



  Future<bool> createTeam({required String name, required String description}) async {
    const storage = FlutterSecureStorage();
    final String? access = await storage.read(key: 'access');
    final response = await http.post(
      Uri.http('10.0.2.2:8000', '/v1/teams/create/'),
      headers: <String, String>{'Authorization': 'Bearer $access'},
      body: {
        'name': name,
        'description': description,
      }
    );
    if (response.statusCode == 201) {
      print('チームの作成に成功しました');
      ref.invalidateSelf();
      await future;
      return true;
    } 
    else {
      print('チームの作成に失敗しました');
      print(response.body);
      return false;
    }
  }


}
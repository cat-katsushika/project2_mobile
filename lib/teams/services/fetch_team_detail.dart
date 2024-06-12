import 'package:project2_mobile/teams/models/team_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project2_mobile/shared/constants/urls.dart';
import 'package:flutter/material.dart';
import 'package:project2_mobile/users/view_models/token_refresh.dart';

Future<TeamDetail> fetchTeamDetail(String id) async {

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


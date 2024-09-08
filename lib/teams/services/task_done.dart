import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:project2_mobile/shared/constants/urls.dart';
import 'package:project2_mobile/users/view_models/token_refresh.dart';

final dio = Dio();

Future<Response> taskDone(String teamId) async {
  const storage = FlutterSecureStorage();
  final String? accessToken = await storage.read(key: 'access');

  Response response;
  String url = 'http://${Urls.host}/v1/teams/done/$teamId/';
  dio.options.headers["Authorization"] = "Bearer $accessToken";
  response = await dio.post(
    url,
    options: Options(
      headers: {
        'Content-Type': 'application/json',
      },
      validateStatus: (status) {
        return status! < 500; // 500未満のステータスコードは例外をスローしない
      },
    ),
  );

  debugPrint("DEBUG: taskDone: レスポンスコード: ${response.statusCode}");

  if (response.statusCode == 401) {
    debugPrint("DEBUG: taskDone: タスク完了を試みたが，認証ではじかれた");
    final bool result = await updateToken();
    if (result) {
      final String? accessToken = await storage.read(key: 'access');
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      response = await dio.post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
    } else {
      throw Exception('Failed to load team');
    }
  }

  if (response.statusCode == 200) {
    debugPrint("DEBUG: taskDone: タスク完了を試みた");
    return response;
  }
  throw Exception('Failed to load team, response body: ${response.data}');
}

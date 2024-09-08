import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:project2_mobile/shared/constants/urls.dart';
import 'package:project2_mobile/users/view_models/token_refresh.dart';

Future<Response> joinTeamApi(String teamId) async {
  debugPrint("DEBUG: joinTeam: チームに加入を試みる");
  const storage = FlutterSecureStorage();
  final String? accessToken = await storage.read(key: 'access');
  final dio = Dio();

  Response response;
  String url = 'http://${Urls.host}/v1/teams/join/$teamId/';

  // 初回リクエストの認証ヘッダーを設定
  dio.options.headers["Authorization"] = "Bearer $accessToken";

  try {
    response = await dio.put(
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

    // ステータスコード401の処理
    if (response.statusCode == 401) {
      debugPrint("DEBUG: joinTeam: 認証エラー、トークンをリフレッシュします");

      // トークンをリフレッシュする処理
      final bool result = await updateToken();
      if (result) {
        // 新しいトークンを取得
        final String? newAccessToken = await storage.read(key: 'access');
        dio.options.headers["Authorization"] = "Bearer $newAccessToken";

        // 再試行
        response = await dio.put(
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
      } else {
        throw Exception('トークンのリフレッシュに失敗しました');
      }
    }

    // ステータスコード400の処理
    if (response.statusCode == 400) {
      debugPrint("DEBUG: joinTeam: 加入失敗 (ステータスコード: 400) 内容: ${response.data}");
      return response;
    }

  } on DioException catch (e) {
    debugPrint("DEBUG: joinTeam: リクエストエラー: ${e.response?.statusCode}");
    rethrow;
  }

  debugPrint("DEBUG: joinTeam: レスポンスコード: ${response.statusCode}");

  if (response.statusCode == 200) {
    debugPrint("DEBUG: joinTeam: 加入成功");
    return response;
  }

  debugPrint("DEBUG: joinTeam: 加入失敗 (ステータスコード: ${response.statusCode}) 内容: ${response.data}");

  throw Exception('チーム加入に失敗しました');
}

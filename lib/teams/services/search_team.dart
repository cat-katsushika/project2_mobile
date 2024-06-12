import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:project2_mobile/shared/constants/urls.dart';
import 'package:project2_mobile/users/view_models/token_refresh.dart';


Future<Response> searchTeamsApi(String searchQuery) async {
  debugPrint("DEBUG: searchTeams: チーム検索を試みる");
  const storage = FlutterSecureStorage();
  final String? accessToken = await storage.read(key: 'access');
  final dio = Dio();

  Response response;
  String url = 'http://${Urls.host}/v1/teams/?search=$searchQuery';

  // 初回リクエストの認証ヘッダーを設定
  dio.options.headers["Authorization"] = "Bearer $accessToken";

  try {
    response = await dio.get(
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
      debugPrint("DEBUG: searchTeams: 認証エラー、トークンをリフレッシュします");

      // トークンをリフレッシュする処理
      final bool result = await updateToken();
      if (result) {
        // 新しいトークンを取得
        final String? newAccessToken = await storage.read(key: 'access');
        dio.options.headers["Authorization"] = "Bearer $newAccessToken";

        // 再試行
        response = await dio.get(
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
      debugPrint("DEBUG: searchTeams: 検索失敗（バリデーションエラー）");
      return response;
    }

  } on DioException catch (e) {
    debugPrint("DEBUG: searchTeams: リクエストエラー: ${e.response?.statusCode}");
    rethrow;
  }

  debugPrint("DEBUG: searchTeams: レスポンスコード: ${response.statusCode}");

  if (response.statusCode == 200) {
    debugPrint("DEBUG: searchTeams: 検索成功");
    return response;
  }

  debugPrint("DEBUG: searchTeams: 検索失敗 (ステータスコード: ${response.statusCode}) 内容: ${response.data}");

  throw Exception('チーム検索に失敗しました');
}

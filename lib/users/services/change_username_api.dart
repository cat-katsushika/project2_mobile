import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:project2_mobile/shared/constants/urls.dart';
import 'package:project2_mobile/users/view_models/token_refresh.dart';

final dio = Dio();

Future<Response> changeUsernameApi(String newUsername) async {
  debugPrint("DEBUG: changeUsernameApi: ユーザー名変更を試みる");
  const storage = FlutterSecureStorage();
  final String? accessToken = await storage.read(key: 'access');

  Response response;
  String url = 'http://${Urls.host}/v1/users/change_name/';

  // 初回リクエストの認証ヘッダーを設定
  dio.options.headers["Authorization"] = "Bearer $accessToken";

  try {
    response = await dio.put(
      url,
      data: {'username': newUsername},
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
        validateStatus: (status) {
          return status! < 500; // 500未満のステータスコードは例外をスローしない
        },
      ),
    );

    // ステータスコード400の処理
    if (response.statusCode == 400) {
      debugPrint("DEBUG: changeUsername: ユーザー名変更失敗（バリデーションエラー）");
      return response;
    }
    
  } on DioException catch (e) {
    if (e.response?.statusCode == 401) {
      debugPrint("DEBUG: changeUsername: 認証エラー、トークンをリフレッシュします");

      // トークンをリフレッシュする処理
      final bool result = await updateToken();
      if (result) {
        // 新しいトークンを取得
        final String? newAccessToken = await storage.read(key: 'access');
        dio.options.headers["Authorization"] = "Bearer $newAccessToken";

        // 再試行
        response = await dio.put(
          url,
          data: {'username': newUsername},
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
            validateStatus: (status) {
              return status! < 500; // 500未満のステータスコードは例外をスローしない
            },
          ),
        );

        // ステータスコード400の処理
        if (response.statusCode == 400) {
          debugPrint("DEBUG: changeUsername: ユーザー名変更失敗（バリデーションエラー）");
          return response;
        }
        
      } else {
        throw Exception('トークンのリフレッシュに失敗しました');
      }
    } else {
      rethrow;
    }
  }

  debugPrint("DEBUG: changeUsername: レスポンスコード: ${response.statusCode}");

  if (response.statusCode == 200) {
    debugPrint("DEBUG: changeUsername: ユーザー名変更成功");
    return response;
  }

  throw Exception('ユーザー名の変更に失敗しました');
}

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:project2_mobile/shared/constants/urls.dart';
import 'package:project2_mobile/shared/providers/flutter_secure_storage_provider.dart';

class ApiService {
  final Dio dio = Dio();
  final Ref ref;

  ApiService(this.ref) {
    dio.options.baseUrl = Urls.baseUrl;
  
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // リクエストごとにアクセストークンをヘッダーに追加
        final String? accessToken = await ref.read(flutterSecureStorageControllerProvider.notifier).getValue(key: 'access');
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
        return handler.next(options); // リクエストを続行
      },
      onError: (DioException e, handler) async {
        // 401エラー（Unauthorized）が発生した場合
        if (e.response?.statusCode == 401) {
          // リフレッシュトークンで新しいアクセストークンを取得
          String? refreshToken = await ref.read(flutterSecureStorageControllerProvider.notifier).getValue(key: 'refresh');
          if (refreshToken != null) {
            try {
              // リフレッシュトークンを使って新しいアクセストークンを取得
              Response response = await dio.post(Urls.tokenRefleshUrl, data: {
                'refresh_token': refreshToken,
              });

              // 新しいアクセストークンを保存
              String newAccessToken = response.data['access'];
              await ref.read(flutterSecureStorageControllerProvider.notifier).setValue(key: 'access', value: newAccessToken);

              // 失敗したリクエストを再試行
              final options = e.requestOptions;
              options.headers['Authorization'] = 'Bearer $newAccessToken';

              // 新しいアクセストークンでリクエストを再送信
              final cloneReq = await dio.request(options.path,
                  options: Options(
                    method: options.method,
                    headers: options.headers,
                  ),
                  data: options.data,
                  queryParameters: options.queryParameters);

              return handler.resolve(cloneReq); // 成功として返す
            } catch (error) {
              // リフレッシュトークンも無効な場合はログアウト処理をするなど
              debugPrint('Error refreshing token: $error');
              return handler.reject(e); // 元のエラーを返す
            }
          }
        }
        return handler.next(e); // その他のエラーはそのまま次に渡す
      },
    ));
  }

  Future<Response> postData(String endpoint, Map<String, dynamic> data) async {
    try {
      Response response = await dio.post(endpoint, data: data);
      if (response.statusCode == 201) {
        debugPrint('Success: ${response.data}');
        return response;
      } else {
        debugPrint('Failed with status code: ${response.statusCode}');
        return response;
      }
    } on DioException catch (e) {
      debugPrint('Dio error: ${e.response?.statusCode} ${e.response?.data}');
      return e.response!;
    }
  }
}
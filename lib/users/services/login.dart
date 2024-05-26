import 'package:dio/dio.dart';
import 'package:project2_mobile/shared/constants/env.dart';
import 'package:flutter/foundation.dart';


// ログインエンドポイントにアクセスする関数
Future<Response<Map<String, Object>>> login(String username, String password) async {


  // Flutterだけで実行する場合
  if (Envs.backendEnv == 'flutterOnly') {
    debugPrint('aaaaaaaaaaaaaaaa');
    return Response<Map<String, Object>>(
      data: {
        'access': 'foAccessToken',
        'refresh': 'foRefreshToken',
      },
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
    );
  }

  // Backendを使う場合
  else {
    return Response<Map<String, Object>>(
      data: {
        'access': 'accessToken',
        'refresh': 'refreshToken',
      },
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
    );
  }


  
}







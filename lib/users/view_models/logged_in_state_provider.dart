import 'package:project2_mobile/shared/providers/flutter_secure_storage_provider.dart';
import 'package:project2_mobile/users/switchers/top_page_switcher/top_page_name_notifier.dart';
import 'package:project2_mobile/users/view_models/username_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';



import 'package:project2_mobile/users/services/login.dart';
import 'package:project2_mobile/shared/constants/urls.dart';
import 'package:project2_mobile/users/services/change_username_api.dart';


part 'logged_in_state_provider.g.dart';

@Riverpod(keepAlive: true)
class LoggedInState extends _$LoggedInState {
  @override
  Future<bool> build() async {

    // ユーザーネームとパスワードをSecureStorageから取得
    final String? username = await ref.read(flutterSecureStorageControllerProvider.notifier).getValue(key: 'username');
    final String? password = await ref.read(flutterSecureStorageControllerProvider.notifier).getValue(key: 'password');
    debugPrint('SecureStorege内: username: $username, password: $password');

    // ユーザーネームとパスワードを取得できた場合
    if (username != null && password != null) {
      final response = await login(username, password);

      // ログインできた場合
      if (response.statusCode == 200) {
        debugPrint('ログイン情報あり、トークン更新成功');

        // トークンを取得し、SecureStorageに保存
        String accessToken = response.data!['access'] as String;
        String refreshToken = response.data!['refresh'] as String;
        await ref.read(flutterSecureStorageControllerProvider.notifier).setValue(key: 'access', value: accessToken);
        await ref.read(flutterSecureStorageControllerProvider.notifier).setValue(key: 'refresh', value: refreshToken);
        return true;
      }

      // ログインできなかった場合
      else {
        debugPrint('ログイン情報あり、トークン更新失敗');
        return false;
      }
    }

    // ログイン情報が取得できなかった場合
    else {
      debugPrint('ログイン情報なし');
      return false;
    }
  }

  Future<bool> signUp (String username, String password) async {
    const storage = FlutterSecureStorage();
    final response = await http.post(
      Uri.http(Urls.host, '/v1/users/create/'),
      body: {
        'username': username,
        'password': password,
      }
    );
    if (response.statusCode == 201) {
      final jsonString = utf8.decode(response.bodyBytes); // UTF-8でデコード
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      await storage.write(key: 'user_id', value: json['user_id']);
      await storage.write(key: 'username', value: json['username']);
      await storage.write(key: 'password', value: json['password']);
      debugPrint('DEBUG: from: LoggedInState signUP :ログイン情報を保存しました');
      ref.read(topPageNameNotifierProvider.notifier).changePage("myHome");
      await future;
      state = const AsyncData(true);
      return true;
    } else {
      // 201以外のステータスコードが返された場合、エラーをスローします。
      final jsonString = utf8.decode(response.bodyBytes); // UTF-8でデコード
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      throw Exception('Failed to sign up: $json');
    } 
  }

  Future<bool> logIn (String username, String password) async {

    const storage = FlutterSecureStorage();
    final response = await login(username, password);
    if (response.statusCode == 200) {
      String accessToken = response.data!['access'] as String;
      String refreshToken = response.data!['refresh'] as String;
      await storage.write(key: 'access', value: accessToken);
      await storage.write(key: 'refresh', value: refreshToken);
      await storage.write(key: 'username', value: username);
      await storage.write(key: 'password', value: password);
      debugPrint('ログイン情報を保存しました');
      ref.read(topPageNameNotifierProvider.notifier).changePage("myHome");

      return true;
    }
    // loginエンドポイントに正常にアクセスできなかった場合
    else {
      return false;
    }
  }

  Future<void> logOut() async {
    debugPrint('logOut');
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'user_id');
    await storage.delete(key: 'username');
    await storage.delete(key: 'password');
    await storage.delete(key: 'access');
    await storage.delete(key: 'refresh');
    ref.read(topPageNameNotifierProvider.notifier).changePage("auth");
  }

  Future<Response> changeUsername(String newUsername) async {
    debugPrint("DEBUG: LoggedInState changeUsername: ユーザー名変更を試みる");
    Response response = await changeUsernameApi(newUsername);
    debugPrint("DEBUG: LoggedInState changeUsername: レスポンスコード: ${response.statusCode}");
    if (response.statusCode == 200) {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'username', value: newUsername);
      
      ref.invalidate(getUserNameProvider);
      return response;
    }
    else {
      return response;
    }
  }
}
import 'dart:developer';

import 'package:project2_mobile/users/switchers/top_page_index_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:project2_mobile/users/services/login.dart';
import 'package:project2_mobile/shared/constants/urls.dart';


part 'logged_in_state_provider.g.dart';

@riverpod
class LoggedInState extends _$LoggedInState {
  @override
  Future<bool> build() async {
    const storage = FlutterSecureStorage();
    final String? userId = await storage.read(key: 'userId');
    final String? username = await storage.read(key: 'username');
    final String? password = await storage.read(key: 'password');
    if (userId != null && username != null && password != null) {
      final response = await login(username, password);
      if (response.statusCode == 200) {
        String accessToken = response.data!['access'] as String;
        String refreshToken = response.data!['refresh'] as String;
        await storage.write(key: 'access', value: accessToken);
        await storage.write(key: 'refresh', value: refreshToken);
        return true;
      }
      // loginエンドポイントに正常にアクセスできなかった場合
      else {
        return false;
      }
    }
    else {
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
      ref.read(topPageIndexNotifierProvider.notifier).changeIndex(1);

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
    ref.read(topPageIndexNotifierProvider.notifier).changeIndex(0);
  }
}
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project2_mobile/shared/constants/urls.dart';
import 'package:flutter/material.dart';


Future<bool> updateToken() async {
  const storage = FlutterSecureStorage();
  final String? refresh = await storage.read(key: 'refresh');
  if (refresh == null) {
    storage.deleteAll();
    return false;
  }
  var response = await http.post(
    Uri.http(Urls.host, '/v1/users/token/refresh/'),
    body: <String, String>{'refresh': refresh},
  );
  debugPrint("DEBUG: トークン更新の結果: コード: ${response.statusCode}");
  if (response.statusCode == 200){
    final jsonString = utf8.decode(response.bodyBytes); // UTF-8でデコード
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    await storage.write(key: 'access', value: json['access']);
    return true;
  }
  else {
    final username = await storage.read(key: 'username');
    final password = await storage.read(key: 'password');
    final response2 = await http.post(
      Uri.http(Urls.host, '/v1/users/login/'),
      body: {
        'username': username,
        'password': password,
      }
    );
    if (response2.statusCode == 200) {
      final jsonString = utf8.decode(response2.bodyBytes); // UTF-8でデコード
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      await storage.write(key: 'access', value: json['access']);
      debugPrint("DEBUG: あたらしいアクセストークン: ${json['access']}");
      await storage.write(key: 'refresh', value: json['refresh']);
      return true;
    }
    else {
      storage.deleteAll();
      return false;
    }
  }
}
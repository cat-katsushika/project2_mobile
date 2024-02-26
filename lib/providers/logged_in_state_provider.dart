import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
part 'logged_in_state_provider.g.dart';

@riverpod
class LoggedInState extends _$LoggedInState {
  
  @override
  Future<bool> build() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? username = prefs.getString('username');
    final String? password = prefs.getString('password');
    if (username != null && password != null) {
      final response = await http.post(
        Uri.http('localhost:8000', '/v1/users/login/')
      );
      if (response.statusCode == 200) {
        final jsonString = utf8.decode(response.bodyBytes); // UTF-8でデコード
        final json = jsonDecode(jsonString) as Map<String, dynamic>;
        await prefs.setString('access', json['access']);
        await prefs.setString('refresh', json['refresh']);
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
}
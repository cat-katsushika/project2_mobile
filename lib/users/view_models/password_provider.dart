
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'password_provider.g.dart';

@riverpod
Future<String> getPassword(GetPasswordRef ref) async {
  const storage = FlutterSecureStorage();
  final String? password = await storage.read(key: 'password');
  return password ?? 'パスワードは不明です';
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'username_provider.g.dart';

@riverpod
Future<String> getUserName(GetUserNameRef ref) async {
  const storage = FlutterSecureStorage();
  final String? username = await storage.read(key: 'username');
  return username ?? 'ユーザー名がありません';
}
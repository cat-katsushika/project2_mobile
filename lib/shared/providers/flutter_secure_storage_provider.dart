import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flutter_secure_storage_provider.g.dart';

@riverpod
class FlutterSecureStorageController extends _$FlutterSecureStorageController {
  late final FlutterSecureStorage _storage;

  @override
  void build() {
    _storage = const FlutterSecureStorage();
  }

  Future<void> setValue({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> getValue({required String key}) async {
    return await _storage.read(key: key);
  }

  Future<Map<String, String>> getAllValue() async {
    return await _storage.readAll();
  }

  Future<void> deleteValue({required String key}) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAllValue() async {
    await _storage.deleteAll();
  }
}
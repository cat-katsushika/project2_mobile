import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project2_mobile/users/view_models/logged_in_state_provider.dart';

part 'top_page_index_notifier.g.dart';

@riverpod
class TopPageIndexNotifier extends _$TopPageIndexNotifier {
  
  @override
  Future<int> build() async {
    final isLogedIn = ref.watch(loggedInStateProvider.notifier).build();
    return isLogedIn.then((value) {
      if (value) {
        debugPrint('TopPageIndexNotifier: 1, ログイン情報あり');
        return 1;
      } else {
        debugPrint('TopPageIndexNotifier: 0, ログイン情報なし');
        return 0;
      }
    }).catchError((error) {
      debugPrint('ERROR: TopPageIndexNotifier: $error');
      return 0;
    });
  }

  void changeIndex(int index) {
    state = AsyncData(index);
    debugPrint('TopPageIndexNotifier: $index');
  }
}
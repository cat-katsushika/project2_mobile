import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';


part 'top_page_index_notifier.g.dart';

@riverpod
class TopPageIndexNotifier extends _$TopPageIndexNotifier {
  
  @override
  int build() {
    // return 1;
    return 0;
  }

  void changeIndex(int index) {
    state = index;
    debugPrint(state.toString());
  }
}
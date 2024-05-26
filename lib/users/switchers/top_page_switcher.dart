import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project2_mobile/users/switchers/top_page_index_notifier.dart';

import 'package:project2_mobile/users/screens/login_page.dart';
import 'package:project2_mobile/users/screens/my_home_page.dart';

class TopPageSwitcher extends ConsumerWidget {
  const TopPageSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topPageIndex = ref.watch(topPageIndexNotifierProvider);
    return IndexedStack(
      index: topPageIndex,
      children: [
        LoginPage(),         // 0: ログインページ
        const MyHomePage()   // 1: ホームページ
      ],
    );
  }
}


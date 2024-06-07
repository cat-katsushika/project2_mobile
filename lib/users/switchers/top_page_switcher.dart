import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project2_mobile/shared/screens/circular_progress_indicator_page.dart';
import 'package:project2_mobile/users/switchers/top_page_index_notifier.dart';

import 'package:project2_mobile/users/screens/login_page.dart';
import 'package:project2_mobile/users/screens/my_home_page.dart';

class TopPageSwitcher extends ConsumerWidget {
  const TopPageSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('TopPageSwitcherがbuildされました');


    final topPageIndex = ref.watch(topPageIndexNotifierProvider);
    debugPrint('TopPageSwitcher: topPageIndex: $topPageIndex');

    return topPageIndex.when(
      loading: () => const CircularProgressIndicatorPage(),
      data: (value) {
        if (value == 0) {
          return const LoginPage();
        } else if (value == 1) {
          debugPrint('TopPageSwitcher: MyHomePage');
          return const MyHomePage();
        }
        else {
          debugPrint('ERROR: TopPageSwitcher: 割り当てのない値が渡されました: $value');
          return const LoginPage();
        }
      },
      error: (error, stack) {
        debugPrint('ERROR: TopPageSwitcher: $error');
        return const LoginPage();
      }
    );
  }



}


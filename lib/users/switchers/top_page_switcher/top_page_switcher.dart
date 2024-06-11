import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project2_mobile/users/screens/initial_loading_page.dart';
import 'package:project2_mobile/users/switchers/auth_page_switcher/auth_page_switcher.dart';
import 'package:project2_mobile/users/switchers/top_page_switcher/top_page_name_notifier.dart';

import 'package:project2_mobile/users/screens/my_home_page.dart';

class TopPageSwitcher extends ConsumerWidget {
  const TopPageSwitcher({super.key});

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final topPageName = ref.watch(topPageNameNotifierProvider);

    if (topPageName == "initialLoading") {
      return const InitialLoadingPage();
    }
    else if (topPageName == "auth") {
      return const AuthPageSwitcher();
    }
    else if (topPageName == "myHome") {
      return const MyHomePage();
    }
    else {
      log("ERROR: from:TopPageSwitcher topPageName is not 'initialLoading' or 'auth' or 'main' vaue is $topPageName");
      return const InitialLoadingPage();
    }
  }

}


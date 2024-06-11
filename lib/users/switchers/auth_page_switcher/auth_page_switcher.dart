import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project2_mobile/users/screens/initial_loading_page.dart';
import 'package:project2_mobile/users/screens/sign_up_page.dart';
import 'package:project2_mobile/users/switchers/auth_page_switcher/auth_page_name_notifier.dart';

import 'package:project2_mobile/users/screens/login_page.dart';

class AuthPageSwitcher extends ConsumerWidget {
  const AuthPageSwitcher({super.key});

  

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authPageName = ref.watch(authPageNameNotifierProvider);


    if (authPageName == "signup") {
      return SignUpPage();
    }
    else if (authPageName == "login") {
      return const LoginPage();
    }
    else {
      debugPrint("ERROR: from:AuthPageSwitcher authPageName is not 'signup' or 'login' vaue is $authPageName");
      return const InitialLoadingPage();
    }
  }

}


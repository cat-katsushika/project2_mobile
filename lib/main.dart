import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project2_mobile/pages/loading_page.dart';

import 'package:project2_mobile/pages/my_home_page.dart';
import 'package:project2_mobile/pages/login_page.dart';
import 'package:project2_mobile/pages/sign_up_page.dart';
import 'package:project2_mobile/providers/logged_in_state_provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
        ),
      ),
    ),
  );
}
final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Top(),
      ),
      GoRoute(
          path: '/sign_up',
          builder: (BuildContext context, GoRouterState state) => SignUpPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) => LoginPage(),
      ),
      GoRoute(
        path: '/my_home',
        builder: (BuildContext context, GoRouterState state) => const MyHomePage(),
      )
    ],
  );



class Top extends ConsumerWidget {
  const Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<bool> asyncLoginState = ref.watch(loggedInStateProvider);
    return asyncLoginState.when(
      data: (isLoggedIn) => isLoggedIn ? const MyHomePage() : LoginPage(),
      loading: () => LoadingPage(),
      error: (error, stack) => Text('エラーが発生しました: $error'), // 本番ではエラーをログに記録しログインページへリダイレクトするなどの処理を行う
    );
  }
}

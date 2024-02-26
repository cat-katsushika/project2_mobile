import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project2_mobile/pages/my_home_page.dart';
import 'package:project2_mobile/pages/first_page.dart';
import 'package:project2_mobile/providers/logged_in_state_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<bool> asyncLoginState = ref.watch(loggedInStateProvider);

    return asyncLoginState.when(
      data: (isLoggedIn) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: isLoggedIn ? const MyHomePage(title: 'Project2 App') : const FirstPage(),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('エラーが発生しました: $error'),
    );
  }
}

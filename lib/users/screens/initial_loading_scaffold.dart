import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project2_mobile/users/view_models/logged_in_state_provider.dart';


class InitialLoadingScaffold extends ConsumerWidget {
  const InitialLoadingScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final Future<bool> isLoggedIn = ref.watch(loggedInStateProvider.notifier).build();

    isLoggedIn.then((value) {
      if (value) {
        context.go('/my_team_list');
      } else {
        context.go('/login');
      }
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
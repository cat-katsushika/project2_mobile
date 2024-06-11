import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project2_mobile/users/switchers/top_page_switcher/top_page_name_notifier.dart';
import 'package:project2_mobile/users/view_models/logged_in_state_provider.dart';


class InitialLoadingPage extends ConsumerWidget {
  const InitialLoadingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final Future<bool> isLoggedIn = ref.watch(loggedInStateProvider.notifier).build();

    isLoggedIn.then((value) {
      if (value) {
        ref.read(topPageNameNotifierProvider.notifier).changePage("myHome");
      } else {
        ref.read(topPageNameNotifierProvider.notifier).changePage("auth");
      }
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



import 'package:project2_mobile/shared/constants/colors.dart';

import 'package:project2_mobile/users/view_models/username_provider.dart';
import 'package:project2_mobile/users/view_models/password_provider.dart';

class LoginInfoPage extends ConsumerWidget {
  const LoginInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<String> username = ref.watch(getUserNameProvider);
    final AsyncValue<String> password = ref.watch(getPasswordProvider);



    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン情報'),
        backgroundColor: CustomColors.surfaceContainer,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('ログイン情報ページです'),
            username.when(
              data: (value) => Text('ユーザー名: $value'),
              error: (error, stack) => Text('エラーが発生しました: $error'),
              loading: () => const CircularProgressIndicator(),
            ),
            password.when(
              data: (value) => Text('パスワード: $value'),
              error: (error, stack) => Text('エラーが発生しました: $error'),
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ),
      )
    );
  }
}
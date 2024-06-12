import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:project2_mobile/users/view_models/username_provider.dart';

class UserInfoListTile extends ConsumerWidget {
  const UserInfoListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final AsyncValue<String> username = ref.watch(getUserNameProvider);

    return ListTile(
      title: username.when(
        data: (value) => Text(value),
        error: (error, stack) => Text('エラーが発生しました: $error'),
        loading: () => const CircularProgressIndicator(),
      ),
      subtitle: const Text('ログインしています'),
      trailing: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        radius: 20.0, // 内側の円のサイズ
        child: username.when(
        data: (value) => Text(
          value[0].toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
        ),
        error: (error, stack) => Text('エラーが発生しました: $error'),
        loading: () => const CircularProgressIndicator(),
      ),
        
        
      ),
    );
  }
}

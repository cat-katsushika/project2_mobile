import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project2_mobile/shared/constants/colors.dart';
import 'package:project2_mobile/users/view_models/logged_in_state_provider.dart';

class ChangeUsernamePage extends ConsumerStatefulWidget {
  const ChangeUsernamePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangeUsernamePageState();
}

class _ChangeUsernamePageState extends ConsumerState<ChangeUsernamePage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.surfaceContainer,
        title: const Text('ユーザー名変更'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '新しいユーザー名',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '新しいユーザー名を入力してください';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref
                        .read(loggedInStateProvider.notifier)
                        .changeUsername(_usernameController.text)
                        .then((result) {
                          debugPrint('result: $result');
                      if (result.statusCode == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('更新しました')),
                        );
                        ref.invalidate(loggedInStateProvider);
                      } else if (result.statusCode == 400) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('更新に失敗しました $result')),
                        );
                      }
                    });
                  }
                },
                child: const Text('更新する'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project2_mobile/users/switchers/auth_page_switcher/auth_page_name_notifier.dart';
import 'package:project2_mobile/users/view_models/logged_in_state_provider.dart';
import 'package:project2_mobile/shared/constants/colors.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext contexts) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
        backgroundColor: CustomColors.surfaceContainer,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 100),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ユーザー名',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'ユーザー名を入力してください';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'パスワード',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                      obscureText: _isObscure,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'パスワードを入力してください';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ref
                                .read(loggedInStateProvider.notifier)
                                .logIn(
                                  _usernameController.text,
                                  _passwordController.text,
                                )
                                .then((result) {
                              if (result) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('ログインが完了しました')),
                                );
                              }
                            }).catchError((error) {
                              setState(() {
                                _isSubmitting = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('ログインに失敗しました: $error')),
                              );
                            });
                          }
                        },
                        child: const Text('ログイン'),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              
              SizedBox(
                width: double.infinity,
                height: 40,
                child: OutlinedButton(
                  onPressed: () {
                    ref.read(authPageNameNotifierProvider.notifier).changePage("signup");
                  },
                  child: const Text('新しいアカウントを作成'),
                ),
              ),
              const SizedBox(height: 32),
            ],
          )),
    );
  }
}

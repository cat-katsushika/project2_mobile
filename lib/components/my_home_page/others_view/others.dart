import 'package:flutter/material.dart';
import 'package:project2_mobile/pages/change_username_page.dart';
import 'package:project2_mobile/pages/login_info_page.dart';
import 'package:project2_mobile/pages/privacy_policy_page.dart';
import 'package:project2_mobile/pages/terms_of_service_page.dart';

class Others extends StatefulWidget {
  const Others({Key? key}) : super(key: key);
  @override
  State<Others> createState() => _OthersState();

  
}

class _OthersState extends State<Others> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        // 右側にアイコンを表示するため、ListTileを使う
        ListTile(
          title: Text('User Name'),
          subtitle: Text('user_id'),
          trailing: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 20.0, // 内側の円のサイズ
            child: Text(
              'A',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                  ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.mode_edit_outlined),
          title: const Text('ユーザー名変更'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChangeUsernamePage()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.person_outline),
          title: const Text('ログイン情報確認'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginInfoPage()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('利用規約'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TermsOfServicePage()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.security),
          title: const Text('プライバシーポリシー'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PrivacyPolicyPage()));
          },
        ),
        const Divider(),
        ListTile(
          title: Text(
            'ログアウト',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.error,
            ),
          ),
          onTap: () {
            showModalBottomSheet<void>(
              showDragHandle: true,
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'ログアウトしますか？',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: screenWidth * 0.4,
                                height: 40,
                                child: OutlinedButton(
                                  child: const Text('ログアウトする'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: screenWidth * 0.4,
                                height: 40,
                                child: FilledButton(
                                  child: const Text('キャンセル'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

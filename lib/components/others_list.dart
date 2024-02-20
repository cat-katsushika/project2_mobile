import 'package:flutter/material.dart';
import 'package:project2_mobile/pages/change_username_page.dart';
import 'package:project2_mobile/pages/login_info_page.dart';
import 'package:project2_mobile/pages/privacy_policy_page.dart';
import 'package:project2_mobile/pages/terms_of_service_page.dart';

class Others extends StatefulWidget {
  const Others({Key? key}) : super(key: key);
  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text('アカウント名を変更する'),
            subtitle: const Text('アカウント名を変更することができます。'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeUsernamePage()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text('ログイン情報'),
            subtitle: const Text('ログインに必要な情報を確認することができます。'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginInfoPage()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text('利用規約'),
            subtitle: const Text('利用規約を確認することができます。'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TermsOfServicePage()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text('プライバシーポリシー'),
            subtitle: const Text('プライバシーポリシーを確認することができます。'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyPage()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text('ログアウト'),
            subtitle: const Text('ログアウトすることができます。'),
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text('ログアウトしますか？'),
                          ElevatedButton(
                            child: const Text('ログアウトする'),
                            onPressed: () => Navigator.pop(context),
                          ),
                          ElevatedButton(
                            child: const Text('キャンセル'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const Divider(),
        ],
      );
  }
}

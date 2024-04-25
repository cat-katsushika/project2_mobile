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
          // 右側にアイコンを表示するため、ListTileを使う
          const ListTile(
            title: Text('User Name'),
            subtitle: Text('user_id'),
            trailing: Icon(Icons.account_circle_outlined),
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text('ユーザー名変更'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeUsernamePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text('ログイン情報確認'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginInfoPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text('利用規約'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TermsOfServicePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text('プライバシーポリシー'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyPage()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('ログアウト'),
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
        ],
      );
  }
}

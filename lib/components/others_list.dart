import 'package:flutter/material.dart';

class Others extends StatefulWidget {
  const Others({Key? key}) : super(key: key);
  @override
  _OthersState createState() => _OthersState();
}

class _OthersState extends State<Others> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.lightbulb),
            title: Text('アカウント名を変更する'),
            subtitle: Text('アカウント名を変更することができます。'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lightbulb),
            title: Text('ログイン情報'),
            subtitle: Text('ログインに必要な情報を確認することができます。'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lightbulb),
            title: Text('利用規約'),
            subtitle: Text('利用規約を確認することができます。'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lightbulb),
            title: Text('プライバシーポリシー'),
            subtitle: Text('プライバシーポリシーを確認することができます。'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lightbulb),
            title: Text('ログアウト'),
            subtitle: Text('ログアウトすることができます。'),
          ),
          Divider(),
        ],
      );
  }
}

import 'package:flutter/material.dart';
import 'package:project2_mobile/pages/sign_up_page.dart';



class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('First Page'),
            ElevatedButton(
              onPressed: () { 
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
              }, 
              child: const Text("アカウント新規作成")
            ),
            const ElevatedButton(onPressed: null, child: Text("すでにアカウントをお持ちの方はこちらからログイン"))
          ],
        ),
      )
    );
  }
}
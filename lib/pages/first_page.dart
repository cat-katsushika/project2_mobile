import 'package:flutter/material.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('First Page'),
            ElevatedButton(onPressed: null, child: Text("aaa")),
            ElevatedButton(onPressed: null, child: Text("aaa"))
          ],
        ),
      )
    );
  }
}
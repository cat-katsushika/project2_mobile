import 'package:flutter/material.dart';




class CircularProgressIndicatorPage extends StatelessWidget {
  const CircularProgressIndicatorPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
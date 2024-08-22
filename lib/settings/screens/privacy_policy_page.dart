import 'package:flutter/material.dart';
import 'package:project2_mobile/shared/constants/colors.dart';


class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: CustomColors.surfaceContainer,
      ),
      body: const Center(
        child: Text('プライバシーポリシー'),
      ),
    );
  }
}
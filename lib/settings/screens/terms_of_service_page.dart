import 'package:flutter/material.dart';
import 'package:project2_mobile/shared/constants/colors.dart';


class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('利用規約'),
        backgroundColor: CustomColors.surfaceContainer,
      ),
      body: const Center(
        child: Text('利用規約'),
      ),
    );
  }
}
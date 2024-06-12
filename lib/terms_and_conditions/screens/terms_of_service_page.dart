import 'package:flutter/material.dart';
import 'package:project2_mobile/shared/constants/colors.dart';


class TermsOfServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('利用規約'),
        backgroundColor: CustomColors.surfaceContainer,
      ),
      body: Center(
        child: Text('利用規約'),
      ),
    );
  }
}
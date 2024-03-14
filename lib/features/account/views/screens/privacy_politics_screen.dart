import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/material.dart';

class PrivacyPoliticsScreen extends StatelessWidget {
  const PrivacyPoliticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Politics',
          style: AppTheme.mainTextStyle(),
        ),
      ),
      body: Container(),
    );
  }
}

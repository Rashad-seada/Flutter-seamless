import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/setting_screen_contianer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SettingsContainer(),
          Space(
            height: 1.5.h,
          ),
          SettingsContainer(),
        ],
      ),
    );
  }
}

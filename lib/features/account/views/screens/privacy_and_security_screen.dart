import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/privacy_security_card.dart';
import 'package:Mawthoq/features/account/views/components/privacy_security_container.dart';
import 'package:Mawthoq/features/account/views/components/settings_toggle_container.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PrivacyAndSecurityScreen extends StatelessWidget {
  const PrivacyAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy and security'),
      ),
      body: ListView(
        padding: EdgeInsets.all(3.w),
        children: [
          PrivacyAndSecurityCard(),
          Space(
            height: 3.h,
          ),
          Text(
            'Privacy',
            style: AppTheme.mainTextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
            ),
          ),
          Space(
            height: 1.5.h,
          ),
          PrivacyAndSecurityContainer(),
          Space(
            height: 4.h,
          ),
          Text(
            'Safety',
            style: AppTheme.mainTextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
            ),
          ),
          Space(
            height: 1.5.h,
          ),
          SettingsToggleContainer(),
        ],
      ),
    );
  }
}

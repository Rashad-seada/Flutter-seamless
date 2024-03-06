import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اشعار بريد',
          style: AppTheme.mainTextStyle(),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Space(
                height: 6.h,
              ),
              Icon(
                Icons.mail_outline_outlined,
                color: AppTheme.primary900,
                size: 20.h,
              ),
              Text(
                'An Email has been sent',
                style: AppTheme.mainTextStyle(
                  fontSize: 15.sp,
                ),
              ),
              Text(
                'An Email has been sent to email@gmail.com',
                style: AppTheme.mainTextStyle(
                  fontSize: 11.sp,
                ),
              ),
              Text(
                'Please Verify your account from the link in the mail',
                style: AppTheme.mainTextStyle(
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

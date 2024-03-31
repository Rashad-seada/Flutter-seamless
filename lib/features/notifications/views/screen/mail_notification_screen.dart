import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/core/views/widgets/wave_container.dart';
import 'package:Mawthoq/features/account/views/components/custom_app_bar.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MailNotificationsScreen extends StatelessWidget {
  const MailNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            WaveContainer(),
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              children: [
                Space(
                  height: 2.h,
                ),
                CustomAppBar(
                  label: LocaleKeys.notifications.tr(),
                ),
                Space(
                  height: 3.h,
                ),
                Padding(
                  padding: EdgeInsets.all(6.w),
                  child: Column(
                    children: [
                      Space(
                        height: 6.h,
                      ),
                      Padding(
                        padding: EdgeInsets.all(6.w),
                        child: Image.asset('images/confirm_email _image.png'),
                      ),
                      Text(
                        'An email has been received',
                        style: AppTheme.mainTextStyle(
                          fontSize: 16.sp,
                          color: AppTheme.secondary900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Space(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'An Email has been sent to ',
                            style: AppTheme.mainTextStyle(
                              fontSize: 12.sp,
                              color: AppTheme.secondary900,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'email@gmail.com',
                              style: AppTheme.mainTextStyle(
                                fontSize: 12.sp,
                                color: AppTheme.primary900,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Please Verify your account from the link in the mail',
                        style: AppTheme.mainTextStyle(
                          fontSize: 10.sp,
                          color: AppTheme.secondary900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

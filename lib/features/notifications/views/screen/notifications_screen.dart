import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/custom_app_bar.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Space(
                        height: 6.h,
                      ),
                      Padding(
                        padding: EdgeInsets.all(6.w),
                        child: SvgPicture.asset(
                          AppImages.notification,
                          height: 10.w,
                          width: 10.w,
                          color: AppTheme.secondary900,
                        ),
                      ),
                      Text(
                        LocaleKeys.no_notifications_yet,
                        style: AppTheme.mainTextStyle(
                          fontSize: 16.sp,
                          color: AppTheme.secondary900,
                          fontWeight: FontWeight.bold,
                        ),
                      ).tr(),
                      Space(
                        height: 1.h,
                      ),
                      Text(
                        LocaleKeys.invest_now_to_get_notified,
                        style: AppTheme.mainTextStyle(
                          fontSize: 12.sp,
                          color: AppTheme.neutral400,
                        ),
                        textAlign: TextAlign.center,
                      ).tr(),
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

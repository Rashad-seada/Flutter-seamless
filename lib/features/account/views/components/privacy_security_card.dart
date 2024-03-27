import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PrivacyAndSecurityCard extends StatelessWidget {
  const PrivacyAndSecurityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          2.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.your_safety,
                  style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ).tr(),
                Text(
                  LocaleKeys.security_message,
                  style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 9.sp,
                  ),
                  maxLines: 4,
                ).tr(),
              ],
            ),
          ),
          Icon(
            Icons.safety_check_outlined,
            color: AppTheme.primary900,
            size: 17.w,
          ),
        ],
      ),
    );
  }
}

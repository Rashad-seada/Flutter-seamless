import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

// ignore: must_be_immutable
class SettingsToggleContainer extends StatelessWidget {
  SettingsToggleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          2.w,
        ),
      ),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppImages.rewardLimits,
                      height: 3.5.h,
                      width: 3.5.h,
                      color: AppTheme.primary900,
                    ),
                    Space(
                      width: 2.w,
                    ),
                    Text(
                      LocaleKeys.investment_limit,
                      style: AppTheme.mainTextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ).tr(),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.toggle_off_outlined,
                  ),
                ),
              ],
            ),
            Text(
              LocaleKeys.investment_limit_sub_text,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 9.sp),
            ).tr(),
          ],
        ),
      ),
    );
  }
}

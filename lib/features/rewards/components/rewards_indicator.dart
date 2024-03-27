import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

// ignore: must_be_immutable
class RewardsIndicator extends StatelessWidget {
  double raisedFunds;
  double requestedFunds;
  double width;
  RewardsIndicator(
      {super.key,
      this.width = 200,
      required this.raisedFunds,
      required this.requestedFunds});

  double percentOfRaisedFunds() {
    return raisedFunds / requestedFunds;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(2.h),
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
            3.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppImages.rewardLimits,
              height: 6.5.h,
              width: 6.5.h,
              color: AppTheme.primary900,
            ),
            Space(
              width: 4.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.silver_category,
                        style: AppTheme.mainTextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ).tr(),
                      SvgPicture.asset(
                        AppImages.arrowRight,
                        height: 2.5.h,
                        width: 2.5.h,
                        color: AppTheme.neutral900,
                      ),
                    ],
                  ),
                  Space(
                    height: 1.h,
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    alignment: Alignment.centerLeft,
                    width: width,
                    height: .8.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.w),
                        color: AppTheme.primary900.withOpacity(0.2)),
                    child: Container(
                      alignment: Alignment.center,
                      width: (width * percentOfRaisedFunds()),
                      height: .8.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.w),
                          color: AppTheme.primary900),
                    ),
                  ),
                  Space(
                    height: 1.h,
                  ),
                  Text(
                    LocaleKeys.investment_limit_sub_text,
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.neutral400, fontSize: 9.sp),
                  ).tr(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class ProfitsCard extends StatelessWidget {
  const ProfitsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          interior(context, LocaleKeys.cashback.tr(), '0'),
          interior(context, LocaleKeys.referrals.tr(), '0'),
        ],
      ),
    );
  }
}

Widget interior(BuildContext context, String text, String currency) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 0.7.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
                style: AppTheme.mainTextStyle(
                    // fontSize: 10.sp,
                    color: AppTheme.secondary900,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp))
            .tr(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currency,
              style: AppTheme.mainTextStyle(
                color: AppTheme.secondary900,
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Space(
              width: 0.5.w,
            ),
            Text(
              'SAR',
              style: AppTheme.mainTextStyle(
                fontSize: 11.sp,
                color: AppTheme.secondary900,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

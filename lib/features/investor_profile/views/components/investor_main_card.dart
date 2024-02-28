import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

class InvestorMainCard extends StatelessWidget {
  const InvestorMainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(0),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Space(height: 3.h,),

          Text(
            LocaleKeys.investment_value.tr(),
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900, fontSize: 13.sp),
          ),

          Space(height: 0.1.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(
                "SAR",
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral900, fontSize: 15.sp),
              ),
              Space(width: 2.w,),

              Text(
                "1500",
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral900, fontSize: 22.sp,
                    fontWeight: FontWeight.bold
                ),

              ),
            ],
          ),

          Space(height: 3.h,),


        ],
      ),
    );
  }
}

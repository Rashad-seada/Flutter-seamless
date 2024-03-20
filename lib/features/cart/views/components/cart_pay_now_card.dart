import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';

class CartPayNowCard extends StatelessWidget {
  const CartPayNowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(4.w),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.5.w),
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
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                LocaleKeys.total,
                style: AppTheme.mainTextStyle(
                  color: AppTheme.secondary900,
                  fontSize: 13.sp,
                    fontWeight: FontWeight.w600

                ),
              ).tr(),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SAR",
                    style: AppTheme.mainTextStyle(
                      fontSize: 11.sp,
                      color: AppTheme.neutral600,
                    ),
                  ).tr(),

                  Space(width: 1.w,),

                  Text(
                    "1500",
                    style: AppTheme.mainTextStyle(
                        fontSize: 15.sp,
                        color: AppTheme.neutral900,
                        fontWeight: FontWeight.w600
                    ),
                  ).tr(),
                ],
              ),



            ],
          ),

          Space(height: 3.h,),

          MainButton(
            width: 86.w,
            height: 5.h,
            border: Border.all(color: AppTheme.primary900, width: .2.w),
            color: AppTheme.primary900,
            label: Text(
              LocaleKeys.pay_now,
              style: AppTheme.mainTextStyle(
                color: AppTheme.secondary900,
                fontSize: 10.sp,
                  fontWeight: FontWeight.w600

              ),
            ).tr(),
            onTap: () {},
          ),

        ],
      ),
    );
  }
}

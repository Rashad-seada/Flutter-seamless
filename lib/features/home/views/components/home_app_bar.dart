import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      width: double.infinity,
      height: 9.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.real_state,
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900, fontSize: 17.sp,fontWeight: FontWeight.w600),
          ).tr(),


          Row(
            children: [
              SvgPicture.asset(
                  width: 6.5.w,
                  height: 6.5.w,
                  AppImages.heart
              ),

              Space(width: 2.w,),

              SvgPicture.asset(
                  width: 6.5.w,
                  height: 6.5.w,
                  AppImages.cart,
                color: AppTheme.primary900,
              ),
              Space(width: 1.w,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 0.4),
                decoration: BoxDecoration(
                  color: AppTheme.primary900,
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Text(
                  "2",
                  style: AppTheme.mainTextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

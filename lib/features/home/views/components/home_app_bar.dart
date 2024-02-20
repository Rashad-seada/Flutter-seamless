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
      height: 10.h,
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
                color: AppTheme.neutral900, fontSize: 18.sp),
          ).tr(),


          Row(
            children: [
              SvgPicture.asset(
                  width: 7.w,
                  height: 7.w,
                  AppImages.heart
              ),

              Space(width: 2.w,),

              SvgPicture.asset(
                  width: 7.w,
                  height: 7.w,
                  AppImages.cart
              ),
            ],
          )
        ],
      ),
    );
  }
}

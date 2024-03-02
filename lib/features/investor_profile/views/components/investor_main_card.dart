import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/views/widgets/main_button.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

class InvestorMainCard extends StatelessWidget {
  const InvestorMainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 0),
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

          Space(height: 2.h,),

          Text(
            LocaleKeys.investment_value.tr(),
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900, fontSize: 13.sp),
          ),

          Space(height: 1.h,),

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

          Space(height: 2.5.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ctaButton(label: LocaleKeys.invest.tr(), icon: AppImages.coin, onTap: (){}),
              ctaButton(label: LocaleKeys.deposit.tr(), icon: AppImages.plus, onTap: (){}),
              ctaButton(label: LocaleKeys.rewards.tr(), icon: AppImages.reward, onTap: (){}),
              ctaButton(label: LocaleKeys.start_selling.tr(), icon: AppImages.cart, onTap: (){}),

            ],
          ),

          Space(height: 2.h,),

        ],
      ),
    );
  }

  Widget ctaButton({required String label,required String icon,required void Function() onTap}){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MainButton(
          borderRadius: BorderRadius.circular(2.w),
          height: 10.w,
          width: 11.w,
          label: SvgPicture.asset(
            height: 6.w,
            width: 6.w,
            icon,
          color: AppTheme.neutral200,
          ),
        ),

        Space(
          height: .8.h,
        ),

        Text(
          label,
          style: AppTheme.mainTextStyle(
              color: AppTheme.neutral900, fontSize: 8.sp),
        ),
      ],
    );
  }
}




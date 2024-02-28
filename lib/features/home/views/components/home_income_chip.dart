import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeIncomeChip extends StatelessWidget {
  double annualReturn;
  double expectedGrowth;
  double expectedRentalReturn;
  double netRentalReturn;

  HomeIncomeChip({super.key,required this.annualReturn,required this.expectedGrowth,required this.expectedRentalReturn,required this.netRentalReturn});


  TextStyle? topStyle = AppTheme.mainTextStyle(
      color: AppTheme.neutral600,
      fontWeight: FontWeight.w700,
      fontSize: 6.sp
  );

  TextStyle? buttomStyle = AppTheme.mainTextStyle(
      color: AppTheme.neutral600,
      fontWeight: FontWeight.w700,
      fontSize: 13.sp
  );

  @override
  Widget build(BuildContext context) {
    return Container(

      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.7.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.w),
          color: AppTheme.neutral100
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Column(
            children: [
              Text(
                LocaleKeys.annual_return.tr(),
                style: topStyle,
              ),

              Space(height: 1.h,),

              Text(
                annualReturn.toString()+"%",
                style: buttomStyle,
              ),
            ],
          ),

          Column(
            children: [
              Text(
                LocaleKeys.expected_growth.tr(),
                style: topStyle,
              ),

              Space(height: 1.h,),

              Text(
                expectedGrowth.toString()+"%",
                style: buttomStyle,

              ),


            ],
          ),

          Column(
            children: [
              Text(
                LocaleKeys.expected_rental_return.tr(),
                style: topStyle,
              ),

              Space(height: 1.h,),

              Text(
                expectedRentalReturn.toString()+"%",
                style: buttomStyle,

              ),


            ],
          ),

          Column(
            children: [
              Text(
                LocaleKeys.net_rental_return.tr(),
                style: topStyle,
              ),

              Space(height: 1.h,),

              Text(
                netRentalReturn.toString()+"%",
                style: buttomStyle,
              ),


            ],
          ),


        ],
      ),
    );
  }
}

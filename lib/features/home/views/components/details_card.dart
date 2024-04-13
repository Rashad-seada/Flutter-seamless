import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../generated/locale_keys.g.dart';

class DetailsCard extends StatelessWidget {
  String fundedData;
  double price;
  double rentalIncome;
  DetailsCard({super.key, required this.fundedData, required this.price , required this.rentalIncome });

  NumberFormat formatter = NumberFormat('#,##0');

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.7.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          color: AppTheme.primary900.withOpacity(0.1)),
      child: Column(
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                LocaleKeys.funded_data,
                style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppTheme.neutral500,
                    fontSize: 9.sp),
              ).tr(),

              Text(
                fundedData,
                style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.secondary900,
                    fontSize: 10.sp),
              ).tr(),

            ],
          ),
          Space(height: 1.5.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                LocaleKeys.purchase_price,
                style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppTheme.neutral500,
                    fontSize: 9.sp),
              ).tr(),

              Text(
                "${formatter.format(price)} SAR",
                style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.secondary900,
                    fontSize: 10.sp),
              ).tr(),

            ],
          ),
          Space(height: 1.5.h,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                LocaleKeys.rental_income,
                style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppTheme.neutral500,
                    fontSize: 9.sp),
              ).tr(),

              Text(
                "${formatter.format(rentalIncome)} SAR",
                style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.secondary900,
                    fontSize: 10.sp),
              ).tr(),

            ],
          ),

        ],
      ),
    );
  }
}

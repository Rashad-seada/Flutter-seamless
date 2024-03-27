import 'package:Mawthoq/features/home/views/components/home_details_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import 'details_card.dart';
import 'details_image_slider.dart';
import 'home_details_funds_component.dart';

class DetailsHeaderComponent extends StatelessWidget {
  double price;
  double raisedFunds;
  int investors;
  DetailsHeaderComponent({super.key,
    required this.price,
    required this.raisedFunds,
    required this.investors
  });

  NumberFormat formatter = NumberFormat('#,##0');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 86.w,

          clipBehavior: Clip.hardEdge,
          padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.neutral300),
              borderRadius: BorderRadius.circular(3.5.w),
              color: Colors.transparent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Text(
                LocaleKeys.property_price,
                style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppTheme.neutral500,
                    fontSize: 10.sp),
              ).tr(),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    "SAR",
                    style: AppTheme.mainTextStyle(
                        fontWeight: FontWeight.w300,
                        color: AppTheme.primary900,
                        fontSize: 15.sp),
                  ),
                  Space(
                    width: 1.5.w,
                  ),
                  Text(
                    formatter.format(price),
                    style: AppTheme.mainTextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primary900,
                        fontSize: 22.sp),
                  ),

                ],
              ),
              Space(
                height: .5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: HomeDetailsChip(label: "$investors ${LocaleKeys.investors.tr()}")),
                ],
              ),
              Space(
                height: 2.h,
              ),
              HomeDetailsFundsComponents(
                raisedFunds: raisedFunds,
                requestedFunds: price,
                width: 78.w,
              ),

            ],
          ),
        ),
      ],
    );
  }
}

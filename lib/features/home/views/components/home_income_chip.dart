import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class HomeIncomeChip extends StatelessWidget {
  double annualReturn;
  double expectedGrowth;
  double expectedRentalReturn;
  double netRentalReturn;

  HomeIncomeChip({super.key,
    required this.annualReturn,
    required this.expectedGrowth,
    required this.expectedRentalReturn,
    required this.netRentalReturn});

  TextStyle? topStyle = AppTheme.mainTextStyle(
      color: AppTheme.neutral600, fontWeight: FontWeight.w700, fontSize: 6.sp);

  TextStyle? buttomStyle = AppTheme.mainTextStyle(
      color: AppTheme.neutral600, fontWeight: FontWeight.w800, fontSize: 12.sp);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.7.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.w),
          color: AppTheme.primary900.withOpacity(0.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                LocaleKeys.annual_return.tr(),
                style: topStyle,
              ),
              Space(
                height: 0.5.h,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.neutral400.withOpacity(0.2),
                      // shadow color
                      spreadRadius: 5,
                      // spread radius
                      blurRadius: 10,
                      // blur radius
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  annualReturn.toStringAsFixed(1) + "%",
                  style: buttomStyle,
                ),
              )
            ],
          ),
          Column(
            children: [
              Text(
                LocaleKeys.expected_growth.tr(),
                style: topStyle,
              ),
              Space(
                height: 0.5.h,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.neutral400.withOpacity(0.2),
                      // shadow color
                      spreadRadius: 5,
                      // spread radius
                      blurRadius: 10,
                      // blur radius
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  expectedGrowth.toStringAsFixed(1) + "%",
                  style: buttomStyle,
                ),
              )
            ],
          ),
          Column(
            children: [
              Text(
                LocaleKeys.expected_rental_return.tr(),
                style: topStyle,
              ),
              Space(
                height: 0.5.h,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.neutral400.withOpacity(0.2),
                      // shadow color
                      spreadRadius: 5,
                      // spread radius
                      blurRadius: 10,
                      // blur radius
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  expectedRentalReturn.toStringAsFixed(1) + "%",
                  style: buttomStyle,
                ),
              )
            ],
          ),
          Column(
            children: [
              Text(
                LocaleKeys.net_rental_return.tr(),
                style: topStyle,
              ),
              Space(
                height: 0.5.h,
              ),

              Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.neutral400.withOpacity(0.2),
                        // shadow color
                        spreadRadius: 5,
                        // spread radius
                        blurRadius: 10,
                        // blur radius
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ), child: Text(
                netRentalReturn.toStringAsFixed(1) + "%",
                style: buttomStyle,
              ) ,)

            ],
          ),
        ],
      ),
    );
  }
}

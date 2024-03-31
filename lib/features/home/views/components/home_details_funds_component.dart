import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../data/utils/property_status.dart';

// ignore: must_be_immutable
class HomeDetailsFundsComponents extends StatelessWidget {
  double raisedFunds;
  double requestedFunds;
  double width;
  String status;

  HomeDetailsFundsComponents(
      {super.key,
      this.width = 100,
      required this.raisedFunds,
      required this.requestedFunds,
      required this.status,});

  double percentOfRaisedFunds() {
    return raisedFunds / requestedFunds;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [


        Container(
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.centerLeft,
          width: width,
          height: .8.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.w),
              color: AppTheme.primary900.withOpacity(0.1)),
          child: Container(
            alignment: Alignment.center,
            width: (width * percentOfRaisedFunds()),
            height: .8.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.w),
                color: AppTheme.primary900),
          ),
        ),

        Space(
          height: .8.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " ${(percentOfRaisedFunds() * 100).toStringAsFixed(1)}%"+" "+LocaleKeys.funded.tr() ,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 9.sp,
                fontWeight: FontWeight.w600
              ),
            ),
            (status == PropertyStatus.soldOut)?

            Row(
              children: [
                Icon(
                  Icons.access_time_rounded,
                    size: 4.2.w,
                    color: AppTheme.neutral400
                ),
                Space(
                  width: 1.w,
                ),

                Text(
                  LocaleKeys.closed_on.tr() + " 7 Apr 2021",
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral400, fontSize: 9.sp,
                      fontWeight: FontWeight.w600
                  ),
                ) ,
              ],
            ): SizedBox(),

          ],
        ),
      ],
    );
  }
}

import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class HomeFundsComponents extends StatelessWidget {
  double raisedFunds;
  double requestedFunds;
  double width;
  HomeFundsComponents(
      {super.key,
      this.width = 100,
      required this.raisedFunds,
      required this.requestedFunds});

  double percentOfRaisedFunds() {
    return raisedFunds / requestedFunds;
  }

  NumberFormat formatter = NumberFormat('#,##0');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  formatter.format(raisedFunds),
                  style: AppTheme.mainTextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primary900,
                      fontSize: 18.sp),
                ),
                Space(
                  width: 1.5.w,
                ),
                Text(
                  "SAR",
                  style: AppTheme.mainTextStyle(
                      fontWeight: FontWeight.w300,
                      color: AppTheme.primary900,
                      fontSize: 11.sp),
                ),
              ],
            ),
            Text(
              LocaleKeys.sold.tr() + " ${(percentOfRaisedFunds() * 100).toStringAsFixed(1)}%",
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 10.sp),
            ),
          ],
        ),
        Space(
          height: .2.h,
        ),
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
        )
      ],
    );
  }
}

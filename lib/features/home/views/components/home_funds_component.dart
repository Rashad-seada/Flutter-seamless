import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

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
                  raisedFunds.toString(),
                  style: AppTheme.mainTextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primary900,
                      fontSize: 19.sp),
                ),
                Space(
                  width: 2.w,
                ),
                Text(
                  "SAR",
                  style: AppTheme.mainTextStyle(
                      fontWeight: FontWeight.w300,
                      color: AppTheme.primary900,
                      fontSize: 14.sp),
                ),
              ],
            ),
            Text(
              LocaleKeys.sold.tr() + " ${percentOfRaisedFunds() * 100}%",
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral400, fontSize: 10.sp),
            ),
          ],
        ),
        Space(
          height: .5.h,
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.centerLeft,
          width: width,
          height: .8.h,
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

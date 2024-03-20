import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        Text(
          "2 Bed al Majara 1 (407)",
          style: AppTheme.mainTextStyle(
              fontWeight: FontWeight.w400,
              color: AppTheme.secondary900,
              fontSize: 19.sp),
        ),


        Space(
          height: 0.8.h,
        ),


        Row(
          children: [

            Text(
              "2 Bed",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppTheme.neutral500,
                  fontSize: 10.sp),
            ),

            Container(
              margin:  EdgeInsets.symmetric(horizontal: 3.w),
              height: 1.5.h,
              width: .3.w,
              color: AppTheme.neutral400,
            ),

            Text(
              "2 bath",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppTheme.neutral500,
                  fontSize: 10.sp),
            ),

            Container(
              margin:  EdgeInsets.symmetric(horizontal: 3.w),
              height: 1.5.h,
              width: .3.w,
              color: AppTheme.neutral400,
            ),


            Text(
              "1,338 sq.ft",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppTheme.neutral500,
                  fontSize: 10.sp),
            ),

          ],
        )


      ],
    );
  }
}

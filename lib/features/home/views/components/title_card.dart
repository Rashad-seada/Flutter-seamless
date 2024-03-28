import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

class TitleCard extends StatelessWidget {
  String title;
  String bedrooms;
  String bathrooms;
  String area;

  TitleCard({super.key , required this.title,required this.bedrooms,required this.bathrooms,required this.area});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        Text(
          title,
          style: AppTheme.mainTextStyle(
              fontWeight: FontWeight.w400,
              color: AppTheme.secondary900,
              fontSize: 19.sp),
        ),


        Space(
          height: 2.h,
        ),


        Row(
          children: [

            Text(
              "$bedrooms Bedrooms",
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
              "$bathrooms Bathrooms",
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
              "$area sq.ft",
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

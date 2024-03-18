import 'package:Mawthoq/core/config/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: [
            Text(
              "Location",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondary900,
                  fontSize: 15.sp),
            ),
          ],
        ),

        Space(
          height: 3.h,
        ),
        
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SvgPicture.asset(
                AppImages.location,
              width: 7.w,
              height: 7.w,
              color: AppTheme.primary900,
            ),

            Space(
              width: 4.w,
            ),

            Expanded(
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do",
                style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppTheme.neutral500,
                    fontSize: 11.sp),
              ),
            ),


            
            
          ],
        ),

        Space(
          height: 2.h,
        ),

        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
          style: AppTheme.mainTextStyle(
              fontWeight: FontWeight.w400,
              color: AppTheme.neutral400,
              fontSize: 10.sp),
        ),

      ],
    );
  }
}

import 'package:Mawthoq/core/config/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';

class Location extends StatelessWidget {
  String location;
  Location({super.key,required this.location});

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
                location,
                style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppTheme.neutral500,
                    fontSize: 11.sp),
              ),
            ),


            
            
          ],
        ),
        

      ],
    );
  }
}

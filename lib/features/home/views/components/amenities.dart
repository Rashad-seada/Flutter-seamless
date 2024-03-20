import 'package:Mawthoq/core/config/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';

class Amenities extends StatelessWidget {
  const Amenities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Amenities",
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

        Wrap(
          direction: Axis.horizontal,
          spacing: 5.w, // horizontal space between the children
          runSpacing: 8.0.w, // v
           children: List.generate(4, (index) => SizedBox(
             width: 25.w,
             height: 8.w,
             child: Row(
               children: [

                 SvgPicture.asset(AppImages.realState,width: 8.w,height: 8.w,),

                 Space(width: 3.w,),

                 Text(
                   "Gym",
                   style: AppTheme.mainTextStyle(
                       fontWeight: FontWeight.w500,
                       color: AppTheme.neutral600,
                       fontSize: 12.sp),
                 ),

               ],
             ),
           )),
        )


      ],
    );
  }
}

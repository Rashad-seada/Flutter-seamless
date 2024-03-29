import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';


class PropertyDetails extends StatelessWidget {

  String location;
  String locationDescription;
  bool isRented;
  bool isProtected;
  double rentPerMonth;
  double expectedGrowth;

  PropertyDetails({super.key, required this.location,required this.locationDescription,required this.isRented, required this.isProtected,required this.rentPerMonth,required this.expectedGrowth  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        PropertyDetailsCard(leadingIcon: AppImages.realState,
          title: location,
          description: locationDescription,
        ),

        if(isRented)
        PropertyDetailsCard(leadingIcon: AppImages.realState,
          title: 'Rented',
          description: 'Here are the biggest enterprise technology acquisitions of 2021 so far, in reverse chronological order.',
        ),

        if(isProtected)
          PropertyDetailsCard(leadingIcon: AppImages.realState,
          title: '1 year rental protection',
          description: 'Here are the biggest enterprise technology acquisitions of 2021 so far, in reverse chronological order.',
        ),


        PropertyDetailsCard(leadingIcon: AppImages.realState,
          title: 'Current rent $rentPerMonth per month',
          description: 'Here are the biggest enterprise technology acquisitions of 2021 so far, in reverse chronological order.',
        ),

        PropertyDetailsCard(leadingIcon: AppImages.realState,
          title: '$expectedGrowth% annual gross yield',
          description: 'Here are the biggest enterprise technology acquisitions of 2021 so far, in reverse chronological order.',
        ),





      ],
    );
  }
}


class PropertyDetailsCard extends StatelessWidget {
  String title;
  String description;
  String leadingIcon;

  PropertyDetailsCard({super.key,required this.leadingIcon,required this.title,required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 2.h),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle
            ),
            child: SvgPicture.asset(
              leadingIcon,
              height: 4.h,
              width: 4.h,
            ),
          ),
          Space(width: 1.5.h,),

          SizedBox(
            width: 70.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.mainTextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppTheme.secondary900,
                      fontSize: 12.sp),
                ),

                Space(height: 0.5.h,),

                Text(
                  description,
                  style: AppTheme.mainTextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppTheme.neutral400,
                      fontSize: 10.sp),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}


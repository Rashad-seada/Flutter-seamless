import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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

        PropertyDetailsCard(leadingIcon: AppImages.locationPng,
          title: location,
          description: locationDescription,
        ),

        if(isRented)
        PropertyDetailsCard(leadingIcon: AppImages.rent,
          title: LocaleKeys.rent.tr(),
          description: LocaleKeys.rent_sub_text.tr(),
        ),

        if(isProtected)
          PropertyDetailsCard(leadingIcon: AppImages.protection,
            title: LocaleKeys.protection.tr(),
            description: LocaleKeys.protection_sub_text.tr(),
        ),


        PropertyDetailsCard(leadingIcon: AppImages.money,
          title: '${LocaleKeys.current_rent_1.tr()} $rentPerMonth ${LocaleKeys.current_rent_2.tr()}',
          description: "${LocaleKeys.current_rent_sub_text.tr()} $rentPerMonth",
        ),

        PropertyDetailsCard(leadingIcon: AppImages.invest,
          title: '${LocaleKeys.annual_gross_yield.tr()} $expectedGrowth%',
          description: "${LocaleKeys.annual_gross_yield_sub_text.tr()} $expectedGrowth%",
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
      padding:  EdgeInsets.only(top: 2.h,bottom: 1.h),

      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.w),
                color: AppTheme.primary900.withOpacity(0.1)),
            child: Image.asset(
              leadingIcon,
              height: 3.h,
              width: 3.h,
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


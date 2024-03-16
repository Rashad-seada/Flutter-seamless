import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/custom_network_image.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/selling/components/main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Selling2ndHeading extends StatelessWidget {
  const Selling2ndHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.h),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            3.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppTheme.tertiary900,
            child: CustomNetworkImage(
                height: 23.h,
                width: double.infinity,
                fit: BoxFit.cover,
                url:
                    "https://th.bing.com/th/id/R.d4ffd1d4dbdf170494f81c87e58753d2?rik=z%2fWIr5c13CFdIg&pid=ImgRaw&r=0"),
          ),
          Space(
            height: 3.h,
          ),
          Text(
            'We pay the price of your property in cash',
            style: AppTheme.mainTextStyle(
              color: AppTheme.secondary900,
              fontSize: 14.sp,
            ),
          ),
          Space(
            height: 1.h,
          ),
          Text(
            'Seamless allows you to easily sell your property for a full cash offer upon sale. Seamless is the ideal solution for you',
            style: AppTheme.mainTextStyle(
              color: AppTheme.neutral400,
              fontSize: 12.sp,
            ),
          ),
          Space(
            height: 1.h,
          ),
          Text(
            'We have a perfect closing record and provide fair market value for the property without any hassle',
            style: AppTheme.mainTextStyle(
              color: AppTheme.neutral400,
              fontSize: 11.sp,
            ),
          ),
          Space(
            height: 3.h,
          ),
          MainSellingButton(label: 'Selling with Seamless'),
        ],
      ),
    );
  }
}

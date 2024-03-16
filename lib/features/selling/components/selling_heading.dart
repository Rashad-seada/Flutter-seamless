import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/selling/components/main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SellingHeading extends StatelessWidget {
  const SellingHeading({super.key});

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
        children: [
          Text(
            'Selling with Seamless',
            style: AppTheme.mainTextStyle(
              color: AppTheme.primary900,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Space(
            height: 1.h,
          ),
          Text(
            'Sell your property easly',
            style: AppTheme.mainTextStyle(
              color: AppTheme.secondary900,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Space(
            height: 1.h,
          ),
          Text(
            'Get your payment faster and in cash when you complete the sale with Seamless',
            style: AppTheme.mainTextStyle(
              color: AppTheme.neutral400,
              fontSize: 11.sp,
            ),
            textAlign: TextAlign.center,
          ),
          Space(
            height: 3.h,
          ),
          MainSellingButton(
            label: 'Selling with Seamless',
          ),
        ],
      ),
    );
  }
}

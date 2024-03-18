import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class HowItWorksCard extends StatelessWidget {
  String title;
  String subTitle;
  String svgAsset;
  HowItWorksCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.svgAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.h),
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
          SvgPicture.asset(
            svgAsset,
            width: 10.w,
            height: 10.w,
            color: AppTheme.primary900,
          ),
          Space(
            height: 1.h,
          ),
          Text(
            title,
            style: AppTheme.mainTextStyle(
              color: AppTheme.secondary900,
              fontSize: 12.sp,
            ),
          ),
          Space(
            height: 1.h,
          ),
          Text(
            subTitle,
            style: AppTheme.mainTextStyle(
              color: AppTheme.neutral400,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}

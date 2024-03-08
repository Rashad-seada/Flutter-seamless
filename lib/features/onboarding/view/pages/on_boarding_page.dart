import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '/core/config/app_theme.dart';

import '../../../../core/views/widgets/space.dart';

// ignore: must_be_immutable
class OnBoardingPage extends StatelessWidget {
  String image;
  String title;
  String description;

  OnBoardingPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        shrinkWrap: true,
        children: [
          Space(
            height: 14.h,
          ),
          Center(
            child: Center(
                child: SvgPicture.asset(
              image,
              width: 86.w,
              height: 23.h,
            )),
          ),
          Space(
            height: 16.h,
          ),
          Center(
            child: Text(
              title,
              style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900,
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center,
            ).tr(),
          ),
          Space(
            height: 3.h,
          ),
          Center(
            child: Text(
              description,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral700, fontSize: 12.sp),
              textAlign: TextAlign.center,
            ).tr(),
          )
        ]);
  }
}

import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class RewardsContainer extends StatelessWidget {
  const RewardsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          3.w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0.7.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Profits',
                      style: AppTheme.mainTextStyle(
                        // fontSize: 10.sp,
                        color: AppTheme.secondary900,
                        fontWeight: FontWeight.w600,
                      )),
                  Row(
                    children: [
                      Text(
                        'SAR',
                        style: AppTheme.mainTextStyle(
                          fontSize: 10.sp,
                          color: AppTheme.secondary900,
                        ),
                      ),
                      Text(
                        '100',
                        style: AppTheme.mainTextStyle(
                          color: AppTheme.secondary900,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Space(
                        width: 2.w,
                      ),
                      SvgPicture.asset(
                        AppImages.arrowRight,
                        height: 2.5.h,
                        width: 2.5.h,
                        color: AppTheme.secondary900,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

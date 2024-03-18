import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class ClosedSellingGridItem extends StatelessWidget {
  String svgAsset;
  String heading;
  String ending;
  void Function()? onTap;
  ClosedSellingGridItem({
    super.key,
    required this.svgAsset,
    required this.heading,
    required this.ending,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(1.w),
          boxShadow: [
            BoxShadow(
              spreadRadius: 0.2,
              blurRadius: 0.2,
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              svgAsset,
              height: 8.w,
              width: 8.w,
              color: AppTheme.primary900,
            ),
            Space(
              height: 2.h,
            ),
            Text(
              heading,
              style: AppTheme.mainTextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: AppTheme.secondary900,
              ),
            ),
            Space(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ending,
                  style: AppTheme.mainTextStyle(
                    color: AppTheme.primary900,
                    fontSize: 11.sp,
                  ),
                ),
                SvgPicture.asset(
                  AppImages.arrowRight,
                  width: 4.w,
                  height: 4.w,
                  color: AppTheme.primary900,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

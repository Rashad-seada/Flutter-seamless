import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/utils/account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class PrivacyAndSecurityContainer extends StatelessWidget {
  String label;
  String svgAsset;
  String? string;
  PrivacyAndSecurityContainer(
      {super.key, required this.label, required this.svgAsset, this.string});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
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
          2.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.7.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  svgAsset,
                  color: AppTheme.primary900,
                  height: 4.h,
                  width: 4.h,
                ),
                Space(
                  width: 1.w,
                ),
                Text(
                  label,
                  style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                if (string != null)
                  Text(
                    string!,
                    style: AppTheme.mainTextStyle(
                        fontSize: 10.sp, color: AppTheme.neutral400),
                  ),
                SvgPicture.asset(
                  AppImages.arrowRight,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
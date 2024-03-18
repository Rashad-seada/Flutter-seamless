import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/utils/account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class VerificationStepsCard extends StatelessWidget {
  String label;
  String svgAsset;
  String step;
  VerificationStepsCard(
      {super.key,
      required this.label,
      required this.svgAsset,
      required this.step});

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
        padding: EdgeInsets.all(1.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step,
                  style: AppTheme.mainTextStyle(
                    fontSize: 10.sp,
                    color: AppTheme.neutral400,
                  ),
                ),
                Text(
                  label,
                  style: AppTheme.mainTextStyle(
                    fontSize: 12.sp,
                    color: AppTheme.secondary900,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              svgAsset,
            ),
          ],
        ),
      ),
    );
  }
}

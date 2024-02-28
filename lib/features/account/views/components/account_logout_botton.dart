import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class AccountLogOutBotton extends StatelessWidget {
  String label;
  bool showArrow;
  void Function() onTap;
  AccountLogOutBotton({
    super.key,
    required this.label,
    required this.onTap,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.neutral400,
          ),
          borderRadius: BorderRadius.circular(
            3.w,
          ),
        ),
        padding: EdgeInsets.all(1.5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: AppTheme.mainTextStyle(
                fontWeight: FontWeight.bold,
                color: AppTheme.neutral400,
              ),
            ),
            if (showArrow)
              SvgPicture.asset(
                AppImages.arrowRight,
                height: 2.5.h,
                width: 2.5.h,
                color: AppTheme.neutral400,
              ),
          ],
        ),
      ),
    );
  }
}

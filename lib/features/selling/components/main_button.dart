import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainSellingButton extends StatelessWidget {
  String label;
  String? string;
  void Function()? onTap;

  MainSellingButton({super.key, required this.label, this.string, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
        decoration: BoxDecoration(
          color: AppTheme.secondary900,
          borderRadius: BorderRadius.circular(
            2.w,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 11.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

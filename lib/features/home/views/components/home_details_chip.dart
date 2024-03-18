import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class HomeDetailsChip extends StatelessWidget {
  String label;
  HomeDetailsChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      padding: EdgeInsets.all(1.5.w),
      decoration: BoxDecoration(
          border: Border.all(color: AppTheme.neutral300, width: 1),
          borderRadius: BorderRadius.circular(100.w),
          color: AppTheme.tertiary900),
      child: Text(
        label,
        style:
            AppTheme.mainTextStyle(color: AppTheme.neutral500,
                fontWeight: FontWeight.w600,
                fontSize: 8.sp),
      ),
    );
  }
}

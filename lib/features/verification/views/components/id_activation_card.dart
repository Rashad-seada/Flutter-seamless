import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IdActivationCard extends StatelessWidget {
  String path;
  String label;
  IdActivationCard({super.key, required this.path, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          path,
          height: 40.w,
          width: 40.w,
        ),
        Text(
          label,
          style: AppTheme.mainTextStyle(
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}

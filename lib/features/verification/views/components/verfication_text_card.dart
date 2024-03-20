import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VerficationTextCard extends StatelessWidget {
  String cardTitle;
  VerficationTextCard({super.key, required this.cardTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cardTitle,
          style: AppTheme.mainTextStyle(
            fontSize: 12.sp,
            color: AppTheme.secondary900,
          ),
        ),
        Text(
          'Investing with us requires activating your identity or passport, residence address, and client details before starting the investment process',
          style: AppTheme.mainTextStyle(
            fontSize: 11.sp,
            color: AppTheme.neutral400,
          ),
        ),
      ],
    );
  }
}

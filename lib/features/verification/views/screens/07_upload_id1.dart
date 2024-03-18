import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UploadId1Screen extends StatelessWidget {
  const UploadId1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ID Activation',
          style: AppTheme.mainTextStyle(
            color: AppTheme.secondary900,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upload ID or passport',
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
            ),
          ),
        ],
      ),
    );
  }
}

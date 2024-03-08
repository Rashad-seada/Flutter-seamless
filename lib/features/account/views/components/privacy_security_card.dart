import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PrivacyAndSecurityCard extends StatelessWidget {
  const PrivacyAndSecurityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your safety is Important',
                  style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  'We care very much about the security of your account and add multiple layers of protection to develop our security and protection',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 9.sp,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 4,
                ),
              ],
            ),
          ),
          Icon(
            Icons.safety_check_outlined,
            color: AppTheme.primary900,
            size: 17.w,
          ),
        ],
      ),
    );
  }
}

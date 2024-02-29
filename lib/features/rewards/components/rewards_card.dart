import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/main_button.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RewardsCard extends StatelessWidget {
  const RewardsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        color: AppTheme.primary900.withOpacity(0.4),
        borderRadius: BorderRadius.circular(
          3.w,
        ),
      ),
      padding: EdgeInsets.all(6.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.card_giftcard_rounded),
              Space(
                width: 1.w,
              ),
              Text(
                'Invite your friends and win now!!',
                style: AppTheme.mainTextStyle(
                  color: AppTheme.secondary900,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
          Space(
            height: 1.h,
          ),
          Text(
            'Invite your friends and you will be rewarded by balance to invest free and safely',
            style: AppTheme.mainTextStyle(
              color: AppTheme.secondary900,
            ),
          ),
          Space(
            height: 1.h,
          ),
          MainButton(
            onTap: () {},
            label: Text(
              'Share link',
              style: AppTheme.mainTextStyle(
                color: Colors.white,
              ),
            ),
            height: 10.w,
          ),
        ],
      ),
    );
  }
}

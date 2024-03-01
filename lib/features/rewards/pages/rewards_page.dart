import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/rewards/components/rewards_card.dart';
import 'package:Mawthoq/features/rewards/components/rewards_container.dart';
import 'package:Mawthoq/features/rewards/components/rewards_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(7.w),
          child: ListView(
            children: [
              Text(
                'Rewards',
                style: AppTheme.mainTextStyle(
                  color: AppTheme.secondary900,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Space(
                height: 3.h,
              ),
              RewardsIndicator(raisedFunds: 100, requestedFunds: 200),
              Space(height: 2.5.h),
              RewardsContainer(),
              Space(
                height: 1.5.h,
              ),
              RewardsCard(),
            ],
          ),
        ),
      ),
    );
  }
}

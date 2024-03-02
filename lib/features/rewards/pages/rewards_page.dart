import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/rewards/components/rewards_card.dart';
import 'package:Mawthoq/features/rewards/components/rewards_card.dart';
import 'package:Mawthoq/features/rewards/components/rewards_indicator.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../components/share_reward_link_card.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          children: [
            Space(
              height: 2.h,
            ),

            Text(
              LocaleKeys.rewards,
              style: AppTheme.mainTextStyle(
                color: AppTheme.secondary900,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ).tr(),
            Space(
              height: 3.h,
            ),

            RewardsIndicator(raisedFunds: 100, requestedFunds: 200),
            Space(
                height: 2.h
            ),

            RewardsCard(),
            Space(
              height: 2.h,
            ),
            ShareRewardLinkCard(),
          ],
        ),
      ),
    );
  }
}

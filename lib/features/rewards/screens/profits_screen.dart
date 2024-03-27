import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/rewards/components/profits_card.dart';
import 'package:Mawthoq/features/rewards/components/profits_container.dart';
import 'package:Mawthoq/features/rewards/components/share_reward_link_card.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfitsScreen extends StatelessWidget {
  const ProfitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.profits,
          style: AppTheme.mainTextStyle(
            color: AppTheme.secondary900,
          ),
        ).tr(),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(6.w),
            child: Column(
              children: [
                Text(
                  LocaleKeys.your_rewards,
                  style: AppTheme.mainTextStyle(
                    fontSize: 12.sp,
                    color: AppTheme.neutral400,
                  ),
                ).tr(),
                Space(
                  height: 1.5.h,
                ),
                Text(
                  '0 SAR',
                  style: AppTheme.mainTextStyle(
                    fontSize: 15.sp,
                    color: AppTheme.secondary900,
                  ),
                ),
                Space(
                  height: 1.5.h,
                ),
                ProfitsCard(),
                Space(
                  height: 1.5.h,
                ),
                ProfitsContainer(
                  label: LocaleKeys.wallet.tr(),
                ),
                Space(
                  height: 1.5.h,
                ),
                ShareRewardLinkCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

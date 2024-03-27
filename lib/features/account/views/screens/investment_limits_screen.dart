import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/investment_limits_indicator.dart';
import 'package:Mawthoq/features/account/views/components/investment_limits_guide.dart';
import 'package:Mawthoq/features/account/views/components/privacy_security_container.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InvestmentLimitsScreen extends StatelessWidget {
  const InvestmentLimitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.investment_limit,
          style: AppTheme.mainTextStyle(
            fontWeight: FontWeight.bold,
          ),
        ).tr(),
      ),
      body: Padding(
        padding: EdgeInsets.all(6.w),
        child: ListView(
          children: [
            InvestmentLimitsIndicator(
              isInvetmentLimit: true,
              headLabel: LocaleKeys.from_limit.tr(),
              raisedFunds: 5000,
              requestedFunds: 10000,
              width: 86.w,
            ),
            Space(
              height: 3.h,
            ),
            PrivacyAndSecurityContainer(
              label: LocaleKeys.new_investor.tr(),
              svgAsset: AppImages.account1,
              string: LocaleKeys.update.tr(),
            ),
            Space(
              height: 3.h,
            ),
            InvestmentLimitsGuide(
                question: LocaleKeys.investment_limit_reset.tr(),
                answer: LocaleKeys.annual_investment_limit.tr(),
                iconData: Icons.calendar_month_outlined),
            Space(
              height: 3.h,
            ),
            InvestmentLimitsGuide(
                question: LocaleKeys.why_limit_applied.tr(),
                answer: LocaleKeys.local_regulations.tr(),
                iconData: Icons.lock_outline),
            Space(
              height: 3.h,
            ),
            InvestmentLimitsGuide(
                question: LocaleKeys.how_to_become_professional_investor.tr(),
                answer: LocaleKeys.professional_investor_conditions.tr(),
                iconData: Icons.arrow_upward_outlined),
          ],
        ),
      ),
    );
  }
}

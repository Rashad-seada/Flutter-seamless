import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/investment_limits_indicator.dart';
import 'package:Mawthoq/features/account/views/components/investment_limits_guide.dart';
import 'package:Mawthoq/features/account/views/components/privacy_security_container.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InvestmentLimitsScreen extends StatelessWidget {
  const InvestmentLimitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Investment Limits',
          style: AppTheme.mainTextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(6.w),
        child: ListView(
          children: [
            InvestmentLimitsIndicator(
              isInvetmentLimit: true,
              headLabel: "from limit",
              raisedFunds: 5000,
              requestedFunds: 10000,
              width: 86.w,
            ),
            Space(
              height: 3.h,
            ),
            PrivacyAndSecurityContainer(
              label: 'New Investor',
              svgAsset: AppImages.account1,
              string: 'Update',
            ),
            Space(
              height: 3.h,
            ),
            InvestmentLimitsGuide(
                question: 'When will my investment limit be reset?',
                answer:
                    'Your annual investment limit will be restored on January 1, 2025',
                svgAsset: AppImages.heart),
            Space(
              height: 3.h,
            ),
            InvestmentLimitsGuide(
                question: 'Why is the limit applied to my investment?',
                answer:
                    'Local regulations limit individual investors to a maximum investment of 50,000 American dollars on the Seamless platform per calendar year.',
                svgAsset: AppImages.password),
            Space(
              height: 3.h,
            ),
            InvestmentLimitsGuide(
                question: 'How do I become a professional investor?',
                answer:
                    'If you have assets worth more than one million dollars, you can contact us to be classified as a professional investor. Conditions mentioned above vary.',
                svgAsset: AppImages.coin),
          ],
        ),
      ),
    );
  }
}

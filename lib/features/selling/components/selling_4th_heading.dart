import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/selling/components/how_it_works_card.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class Selling4thHeading extends StatelessWidget {
  const Selling4thHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.why_sell_with_seamless,
          style: AppTheme.mainTextStyle(
            color: AppTheme.secondary900,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ).tr(),
        Space(
          height: 1.h,
        ),
        Text(
          LocaleKeys.sell_property_for_cash,
          style: AppTheme.mainTextStyle(
            color: AppTheme.neutral400,
            fontSize: 11.sp,
          ),
          textAlign: TextAlign.center,
        ).tr(),
        Space(
          height: 2.h,
        ),
        HowItWorksCard(
          title: LocaleKeys.timely_cash_offer.tr(),
          subTitle: LocaleKeys.competitive_offer_within_days.tr(),
          svgAsset: AppImages.wallet,
        ),
        Space(
          height: 3.h,
        ),
        HowItWorksCard(
          title: LocaleKeys.sell_property_whenever_you_want.tr(),
          subTitle: LocaleKeys.offer_within_days.tr(),
          svgAsset: AppImages.realState,
        ),
        Space(
          height: 3.h,
        ),
        HowItWorksCard(
          title: LocaleKeys.hassle_free_exit.tr(),
          subTitle: LocaleKeys.cover_evaluations_marketing.tr(),
          svgAsset: AppImages.documents,
        ),
        Space(
          height: 3.h,
        ),
        HowItWorksCard(
          title: LocaleKeys.tenants_can_stay.tr(),
          subTitle: LocaleKeys.sell_property_with_tenants.tr(),
          svgAsset: AppImages.account1,
        ),
      ],
    );
  }
}

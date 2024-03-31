import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/selling/components/how_it_works_card.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Selling3rdHeading extends StatelessWidget {
  const Selling3rdHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.h),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            3.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ]),
      child: Column(
        children: [
          Text(
            LocaleKeys.how_it_works,
            style: AppTheme.mainTextStyle(
              color: AppTheme.secondary900,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ).tr(),
          Space(
            height: 1.h,
          ),
          Text(
            LocaleKeys.list_property_seamless,
            style: AppTheme.mainTextStyle(
              color: AppTheme.neutral400,
              fontSize: 11.sp,
            ),
            textAlign: TextAlign.center,
          ).tr(),
          Space(
            height: 2.h,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HowItWorksCard(
                  svgAsset: AppImages.documents,
                  title: LocaleKeys.quick_view.tr(),
                  subTitle: LocaleKeys.upload_property_details.tr(),
                ),
                Space(
                  height: 3.h,
                ),
                HowItWorksCard(
                  svgAsset: AppImages.heart,
                  title: LocaleKeys.intensive_study.tr(),
                  subTitle: LocaleKeys.take_care_of_updates.tr(),
                ),
                Space(
                  height: 3.h,
                ),
                HowItWorksCard(
                  svgAsset: AppImages.realState,
                  title: LocaleKeys.fast_selling_process.tr(),
                  subTitle: LocaleKeys.property_listed_seamless.tr(),
                ),
                Space(
                  height: 3.h,
                ),
                HowItWorksCard(
                  svgAsset: AppImages.wallet,
                  title: LocaleKeys.easy_closing_process.tr(),
                  subTitle: LocaleKeys.sale_proceeds_transferred.tr(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

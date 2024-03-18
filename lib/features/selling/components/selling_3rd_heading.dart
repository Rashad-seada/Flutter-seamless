import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/selling/components/how_it_works_card.dart';
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
            'How it works',
            style: AppTheme.mainTextStyle(
              color: AppTheme.secondary900,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Space(
            height: 1.h,
          ),
          Text(
            'Simply list your property on Seamless and get your money in cash when the sale is completed',
            style: AppTheme.mainTextStyle(
              color: AppTheme.neutral400,
              fontSize: 11.sp,
            ),
            textAlign: TextAlign.center,
          ),
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
                  title: 'Quick view',
                  subTitle:
                      'Upload your property details without any obligations and if we are interested we will make you an offer',
                ),
                Space(
                  height: 3.h,
                ),
                HowItWorksCard(
                  svgAsset: AppImages.heart,
                  title: 'Intensive study',
                  subTitle:
                      'We will take care of any necessary updates and photograph the property in a professional manner for marketing purposes',
                ),
                Space(
                  height: 3.h,
                ),
                HowItWorksCard(
                  svgAsset: AppImages.realState,
                  title: 'Fast selling process',
                  subTitle:
                      'Your property will be listed on the Seamless platform and may usually sell within 30-45 days',
                ),
                Space(
                  height: 3.h,
                ),
                HowItWorksCard(
                  svgAsset: AppImages.wallet,
                  title: 'Easy closing process',
                  subTitle:
                      'The proceeds of the sale will be transferred to your bank account within 30 days of the property closing',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

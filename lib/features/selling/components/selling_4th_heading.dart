import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/selling/components/how_it_works_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class Selling4thHeading extends StatelessWidget {
  const Selling4thHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Why you should sell with Seamless?',
          style: AppTheme.mainTextStyle(
            color: AppTheme.secondary900,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Sell ​​your property for cash. We have a 100% closing rate and are ready to offer you fair market value without any hassle.',
          style: AppTheme.mainTextStyle(
            color: AppTheme.neutral400,
            fontSize: 11.sp,
          ),
          textAlign: TextAlign.center,
        ),
        HowItWorksCard(
          title: 'Timely cash offer and 100% closing rate.',
          subTitle:
              'The majority of homes listed will receive a competitive offer within days',
          svgAsset: AppImages.wallet,
        ),
        Space(
          height: 3.h,
        ),
        HowItWorksCard(
          title: 'Sell ​​your property whenever you want',
          subTitle:
              'We make an offer within days, but you must specify the sale date to ensure flexibility during the sales process',
          svgAsset: AppImages.realState,
        ),
        Space(
          height: 3.h,
        ),
        HowItWorksCard(
          title: 'Hassle-free exit with low fees',
          subTitle:
              'We cover evaluations, marketing, and all extensive studies. You dont have to deal with any inspections or repairs',
          svgAsset: AppImages.documents,
        ),
        Space(
          height: 3.h,
        ),
        HowItWorksCard(
          title: 'Tenants can stay in the house',
          subTitle:
              'Sell ​​your property even though you have tenants so you dont have to wait for any leases to expire and you will continue to receive your rental income while the property is financed.',
          svgAsset: AppImages.account1,
        ),
      ],
    );
  }
}

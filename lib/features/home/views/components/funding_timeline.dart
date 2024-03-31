import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_stepper.dart';
import '../../../../core/views/widgets/space.dart';

class FundingTimeline extends StatelessWidget {
  const FundingTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [
            Text(
              LocaleKeys.funding_timeline,
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondary900,
                  fontSize: 15.sp),
            ).tr(),
          ],
        ),

        Space(
          height: 3.h,
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomStepper(count: 3, currentStep: 1, height: 11.5.h,),

            Space(width: 4.w,),

            Column(
              children: [
                SizedBox(
                  width: 70.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "15 March 2024",
                        style: AppTheme.mainTextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppTheme.neutral500,
                            fontSize: 10.sp),
                      ),

                      Text(
                        LocaleKeys.final_date.tr(),
                        style: AppTheme.mainTextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.secondary900,
                            fontSize: 12.sp),
                      ),
                      Space(height: 1.h,),

                      Text(
                        LocaleKeys.property_funding_completion_date.tr(),
                        style: AppTheme.mainTextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppTheme.neutral400,
                            fontSize: 9.sp),
                      ),
                    ],
                  ),
                ),

                Space(height: 3.h,),

                SizedBox(
                  width: 70.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "15 March 2024",
                        style: AppTheme.mainTextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppTheme.neutral500,
                            fontSize: 10.sp),
                      ),

                      Text(
                        LocaleKeys.special_purpose_company_formed.tr(),
                        style: AppTheme.mainTextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.secondary900,
                            fontSize: 12.sp),
                      ),
                      Space(height: 1.h,),

                      Text(
                        LocaleKeys.spv_creation_and_property_deeds_distribution.tr(),
                        style: AppTheme.mainTextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppTheme.neutral400,
                            fontSize: 9.sp),
                      ),
                    ],
                  ),
                ),

                Space(height: 3.h,),

                SizedBox(
                  width: 70.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "15 March 2024",
                        style: AppTheme.mainTextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppTheme.neutral500,
                            fontSize: 10.sp),
                      ),

                      Text(
                        LocaleKeys.expected_first_rental_payment.tr(),
                        style: AppTheme.mainTextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.secondary900,
                            fontSize: 12.sp),
                      ),

                      Space(height: 1.h,),

                      Text(
                        LocaleKeys.expected_first_rent_payment_date.tr(),
                        style: AppTheme.mainTextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppTheme.neutral400,
                            fontSize: 9.sp),
                      ),
                    ],
                  ),
                )

              ],
            )


          ],
        )


      ],
    );
  }
}

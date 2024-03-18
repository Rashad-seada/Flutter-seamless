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
              "Funding timeline",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondary900,
                  fontSize: 15.sp),
            ),
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
                        "Closing data",
                        style: AppTheme.mainTextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.secondary900,
                            fontSize: 12.sp),
                      ),

                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
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
                        "Closing data",
                        style: AppTheme.mainTextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.secondary900,
                            fontSize: 12.sp),
                      ),

                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
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
                        "Closing data",
                        style: AppTheme.mainTextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.secondary900,
                            fontSize: 12.sp),
                      ),

                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
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

import 'package:Mawthoq/core/views/widgets/custom_network_image.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import 'home_funds_component.dart';
import 'home_income_chip.dart';
import 'home_info_chip.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.only(bottom: 3.h),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white),
      child: Column(
        children: [
          CustomNetworkImage(
              height: 23.h,
              width: double.infinity,
              fit: BoxFit.cover,
              url:
                  "https://th.bing.com/th/id/R.d4ffd1d4dbdf170494f81c87e58753d2?rik=z%2fWIr5c13CFdIg&pid=ImgRaw&r=0"),
          Space(
            height: 1.5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              children: [
                Row(
                  children: [
                    HomeInfoChip(label: "جده"),
                    Space(
                      width: 2.w,
                    ),
                    HomeInfoChip(label: "مؤجر"),
                  ],
                ),
                Space(
                  height: 1.h,
                ),
                Text(
                  "شقه دورين فالرياض جرين لاند في الرياض من الداخل الشرقي",
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral900,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp),
                ),
                Space(
                  height: 1.h,
                ),
                HomeFundsComponents(
                  raisedFunds: 170,
                  requestedFunds: 200,
                  width: 80.w,
                ),
                Space(
                  height: 1.5.h,
                ),
                HomeIncomeChip(
                  annualReturn: 6,
                  expectedGrowth: 5.6,
                  expectedRentalReturn: 65,
                  netRentalReturn: 9,
                ),
                Space(
                  height: 1.5.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

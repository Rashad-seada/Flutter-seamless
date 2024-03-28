import 'package:Mawthoq/core/views/widgets/custom_network_image.dart';
import 'package:Mawthoq/core/views/widgets/custom_shimmer.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/home/views/bloc/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import 'home_funds_component.dart';
import 'home_income_chip.dart';
import 'home_info_chip.dart';

class HomeCardLoading extends StatelessWidget {
  const HomeCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.only(bottom: 3.h),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.5.w),
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
          CustomShimmer(
            child: Container(
              height: 23.h,
              width: double.infinity,
              color: AppTheme.tertiary900,
            ),
          ),
          Space(
            height: 1.5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomShimmer(child: HomeInfoChip(label: "جده")),
                    Space(
                      width: 2.w,
                    ),
                    CustomShimmer(child: HomeInfoChip(label: "مؤجر")),
                  ],
                ),
                Space(
                  height: 1.h,
                ),

                CustomShimmer(
                  child: Container(
                    width: 65.w,
                    height: 1.h,
                    decoration: BoxDecoration(
                      color: AppTheme.neutral100,
                      borderRadius: BorderRadius.circular(2.w)
                    ),
                  ),
                ),
                Space(
                  height: 1.h,
                ),
                CustomShimmer(
                  child: Container(
                    width: 50.w,
                    height: 1.h,
                    decoration: BoxDecoration(
                        color: AppTheme.neutral100,
                        borderRadius: BorderRadius.circular(2.w)
                    ),
                  ),
                ),
                Space(
                  height: 1.5.h,
                ),
                CustomShimmer(
                  child: Container(
                    width: 75.w,
                    height: 3.h,
                    decoration: BoxDecoration(
                        color: AppTheme.neutral100,
                        borderRadius: BorderRadius.circular(2.w)
                    ),
                  ),
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

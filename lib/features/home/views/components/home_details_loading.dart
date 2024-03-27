import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_shimmer.dart';

class HomeDetailsLoading extends StatelessWidget {
  const HomeDetailsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        CustomShimmer(
          child: Container(
            width: 100.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: AppTheme.neutral100,
                borderRadius: BorderRadius.circular(2.w)
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(7.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CustomShimmer(
                child: Container(
                  width: 86.w,
                  height: 3.h,
                  decoration: BoxDecoration(
                      color: AppTheme.neutral100,
                      borderRadius: BorderRadius.circular(2.w)
                  ),
                ),
              ),

              Space(height: 1.h,),

              CustomShimmer(
                child: Container(
                  width: 50.w,
                  height: 3.h,
                  decoration: BoxDecoration(
                      color: AppTheme.neutral100,
                      borderRadius: BorderRadius.circular(2.w)
                  ),
                ),
              ),

              Space(height: 3.h,),


              CustomShimmer(
                child: Container(
                  width: 86.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                      color: AppTheme.neutral100,
                      borderRadius: BorderRadius.circular(2.w)
                  ),
                ),
              ),

              Space(height: 3.h,),


              CustomShimmer(
                child: Container(
                  width: 86.w,
                  height: 9.h,
                  decoration: BoxDecoration(
                      color: AppTheme.neutral100,
                      borderRadius: BorderRadius.circular(2.w)
                  ),
                ),
              ),

            ],
          ),
        )

      ],
    );
  }
}

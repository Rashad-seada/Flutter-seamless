import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../blocs/verification_cubit.dart';

class InvestmentPlanCard extends StatelessWidget {
  const InvestmentPlanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          clipBehavior: Clip.hardEdge,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.w),
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

              Image.asset(
                  height: 4.h,
                  fit: BoxFit.fitHeight,
                  AppImages.seamlessLetter),


              Space(height: 1.5.h,),

              Text(
                LocaleKeys.start_with_us,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.secondary900, fontSize: 8.sp,fontWeight: FontWeight.w600),
              ).tr(),

              Space(height: 3.h,),

              Text(
                LocaleKeys.investment_starts_from,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.secondary900, fontSize: 9.sp,fontWeight: FontWeight.w600),
              ).tr(),

              Space(height: 0.5.h,),

              Text(
                "SAR 1000",
                style: AppTheme.mainTextStyle(
                    color: AppTheme.secondary900,
                    fontWeight: FontWeight.w600,
                    fontSize: 30.sp
                ),
              ).tr(),

              Space(height: 2.h,),

              Row(
                children: [
                  Icon(
                    Icons.check,
                    color: AppTheme.neutral900,
                  ),

                  Space(width: 2.w,),

                  Text(
                    LocaleKeys.investment_plan_1,
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.secondary900, fontSize: 9.sp),
                  ).tr(),
                ],
              ),

              Row(
                children: [
                  Icon(
                    Icons.check,
                    color: AppTheme.neutral900,
                  ),

                  Space(width: 2.w,),

                  Text(
                    LocaleKeys.investment_plan_2,
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.secondary900, fontSize: 9.sp),
                  ).tr(),
                ],
              ),

              Row(
                children: [
                  Icon(
                    Icons.check,
                    color: AppTheme.neutral900,
                  ),

                  Space(width: 2.w,),

                  Text(
                    LocaleKeys.investment_plan_3,
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.secondary900, fontSize: 9.sp),
                  ).tr(),
                ],
              ),

              Space(height: 1.h,),

            ],
          ),
        );
      },
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../investor_profile/views/components/home_taps.dart';
import '../bloc/home_details/home_details_cubit.dart';

class Financials extends StatelessWidget {
  const Financials({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [
            Text(
              "Financials",
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

        BlocBuilder<HomeDetailsCubit, HomeDetailsState>(
          builder: (context, state) {
            return HomeTaps(
                  tabs: context.read<HomeDetailsCubit>().tabs,
                  selectedIndex: context.read<HomeDetailsCubit>().selectedIndex,
                  onChange: context.read<HomeDetailsCubit>().onTabChange,
                );
          },
        ),

        Space(
          height: 3.h,
        ),

        _acquisition(propertyPrice: 1460000, transactionCost: 130542, seamlessFee: 1.5)


      ],
    );
  }


  Widget _acquisition({
    required double propertyPrice,
    required double transactionCost,
    required double seamlessFee,
  }){
    return Column(
      children: [

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              "Property price",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.neutral500,
                  fontSize: 12.sp),
            ),

            Text(
              "AED ${ NumberFormat.decimalPattern().format(propertyPrice)}",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondary900,
                  fontSize: 12.sp),
            ),

          ],
        ),
        Space(
          height: 1.5.h,
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              "Transaction costs",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.neutral500,
                  fontSize: 12.sp),
            ),

            Text(
              "AED ${ NumberFormat.decimalPattern().format(transactionCost)}",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondary900,
                  fontSize: 12.sp),
            ),

          ],
        ),
        Space(
          height: 1.5.h,
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              "Seamless fee",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.neutral500,
                  fontSize: 12.sp),
            ),

            Text(
              "${seamlessFee}%",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondary900,
                  fontSize: 12.sp),
            ),

          ],
        ),
        Space(
          height: 1.4.h,
        ),
        Divider(
          color: AppTheme.neutral200,
          thickness: .2.w,
        ),
        Space(
          height: 1.4.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              "Investment cost",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.neutral500,
                  fontSize: 12.sp),
            ),

            Text(
              "AED ${ NumberFormat.decimalPattern().format(propertyPrice + transactionCost)}",
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primary900,
                  fontSize: 14.sp),
            ),

          ],
        ),

      ],
    );
  }
}



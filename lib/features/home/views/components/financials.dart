import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../investor_profile/views/components/home_taps.dart';
import '../bloc/home_details/home_details_cubit.dart';

class Financials extends StatelessWidget {
  double price;
  double seamlessFees;

  double annualGrossRent;
  double serviceCharges;
  double maintenance;
  Financials({super.key,required this.price, required this.seamlessFees,required this.annualGrossRent,required this.serviceCharges,required this.maintenance });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [
            Text(
              LocaleKeys.financials.tr(),
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

        BlocConsumer<HomeDetailsCubit, HomeDetailsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if(context.read<HomeDetailsCubit>().selectedIndex ==0){
              return _acquisition(propertyPrice: price, seamlessFee: seamlessFees);

            }
            return _rentalIncome(annualGrossRent: annualGrossRent, serviceCharges: serviceCharges, maintenance: maintenance);

          },
        )


      ],
    );
  }


  Widget _acquisition({
    required double propertyPrice,
    required double seamlessFee,
  }){
    return Column(
      children: [

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              LocaleKeys.property_price.tr(),
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.neutral500,
                  fontSize: 12.sp),
            ),

            Text(
              "SAR ${ NumberFormat.decimalPattern().format(propertyPrice)}",
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
              LocaleKeys.seamless_fee.tr(),
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
              LocaleKeys.investment_cost.tr(),
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.neutral500,
                  fontSize: 12.sp),
            ),

            Text(
              "SAR ${ NumberFormat.decimalPattern().format( propertyPrice + propertyPrice * (seamlessFees / 100))}",
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

  Widget _rentalIncome({
    required double annualGrossRent,
    required double serviceCharges,
    required double maintenance,
  }){
    return Column(
      children: [

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              LocaleKeys.annual_gross_rent.tr(),
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.neutral500,
                  fontSize: 12.sp),
            ),

            Text(
              "SAR ${ NumberFormat.decimalPattern().format(annualGrossRent)}",
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
              LocaleKeys.service_charges.tr(),
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.neutral500,
                  fontSize: 12.sp),
            ),

            Text(
              "SAR ${ NumberFormat.decimalPattern().format(serviceCharges)}",
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
              LocaleKeys.maintenance.tr(),
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.neutral500,
                  fontSize: 12.sp),
            ),

            Text(
              "AED ${ NumberFormat.decimalPattern().format(maintenance)}",
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
              LocaleKeys.net_income.tr(),
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.neutral500,
                  fontSize: 12.sp),
            ),

            Text(
              "SAR ${ NumberFormat.decimalPattern().format(annualGrossRent - (serviceCharges + maintenance))}",
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





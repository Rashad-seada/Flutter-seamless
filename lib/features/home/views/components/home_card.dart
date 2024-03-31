import 'package:Mawthoq/core/config/app_consts.dart';
import 'package:Mawthoq/core/views/widgets/custom_network_image.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/home/data/entities/property_entity.dart';
import 'package:Mawthoq/features/home/views/bloc/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import 'home_funds_component.dart';
import 'home_income_chip.dart';
import 'home_info_chip.dart';

class HomeCard extends StatelessWidget {
  PropertyEntity propertyEntity;
  HomeCard({super.key,required this.propertyEntity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(3.5.w),
      onTap: ()=> context.read<HomeCubit>().onHomeCardClick(context,propertyEntity.id?.toInt() ?? -1),
      child: Container(
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
            Container(
              color: AppTheme.tertiary900,
              child: CustomNetworkImage(
                  height: 23.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  url: AppConsts.imageUrl + (propertyEntity.image ?? "")
              ),
            ),
            Space(
              height: 1.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                children: [
                  Row(
                    children: [

                      HomeInfoChip(label: propertyEntity.city ?? "Unknown"),
                      Space(
                        width: 2.w,
                      ),
                      if(propertyEntity.isRented == 1)
                      HomeInfoChip(label: "مؤجر"),
                    ],
                  ),
                  Space(
                    height: 1.h,
                  ),
                  Text(
                    propertyEntity.name ?? "Unknown",
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.neutral900,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp),
                  ),
                  Space(
                    height: 1.h,
                  ),
                  HomeFundsComponents(
                    raisedFunds: (propertyEntity.price ?? 0.0) * ((double.tryParse(propertyEntity.percentageSold ?? '') ?? 0.0) / 100),
                    requestedFunds: propertyEntity.price?.toDouble() ?? 0.0,
                    width: 80.w,
                  ),
                  Space(
                    height: 1.5.h,
                  ),
                  HomeIncomeChip(
                    annualReturn: double.tryParse(propertyEntity.annualIncome?? '') ?? 00,
                    expectedGrowth: double.tryParse(propertyEntity.annualExpectedGrowth?? '') ?? 00,
                    expectedRentalReturn: double.tryParse(propertyEntity.annualRentIncome?? '') ?? 00,
                    netRentalReturn: double.tryParse(propertyEntity.annualNetRentIncome ?? '') ?? 00,
                  ),
                  Space(
                    height: 1.5.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

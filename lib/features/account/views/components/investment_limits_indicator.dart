import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/bloc/account/account_cubit.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

// ignore: must_be_immutable
class InvestmentLimitsIndicator extends StatelessWidget {
  String headLabel;
  bool isInvetmentLimit;
  double raisedFunds;
  double requestedFunds;
  double width;
  String? svgAsset;
  InvestmentLimitsIndicator(
      {super.key,
      this.width = 100,
      required this.headLabel,
      required this.raisedFunds,
      required this.requestedFunds,
      this.svgAsset,
      this.isInvetmentLimit = true});

  double percentOfRaisedFunds() {
    return raisedFunds / requestedFunds;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isInvetmentLimit == false) {
          context.read<AccountCubit>().onInvestmentLimitsClick(context);
        }
      },
      child: Container(
        padding: EdgeInsets.all(2.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            3.w,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                if (svgAsset != null)
                  SvgPicture.asset(
                    AppImages.trendUp2,
                    height: 3.h,
                    width: 3.h,
                    color: AppTheme.primary900,
                  ),
                Space(
                  width: 1.w,
                ),
                if (isInvetmentLimit)
                  Text(
                    "Used ${percentOfRaisedFunds() * 100}% ",
                    style: AppTheme.mainTextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                Text(
                  headLabel,
                  style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Space(
              height: 1.h,
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              alignment: Alignment.centerLeft,
              width: width,
              height: .8.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: AppTheme.primary900.withOpacity(0.1)),
              child: Container(
                alignment: Alignment.center,
                width: (width * percentOfRaisedFunds()),
                height: .8.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.w),
                    color: AppTheme.primary900),
              ),
            ),
            Space(
              height: 1.h,
            ),
            if (isInvetmentLimit == false)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        " ${percentOfRaisedFunds() * 100}%",
                        style: AppTheme.mainTextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp),
                      ),
                      Space(
                        width: 1.w,
                      ),
                      Text(
                        LocaleKeys.used,
                        style: AppTheme.mainTextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ).tr(),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'SAR',
                        style: AppTheme.mainTextStyle(
                            color: AppTheme.neutral400, fontSize: 10.sp),
                      ),
                      Space(
                        width: 1.w,
                      ),
                      Text(raisedFunds.toString(),
                          style: AppTheme.mainTextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10.sp)),
                      Text(
                        ' / ' + requestedFunds.toString(),
                        style: AppTheme.mainTextStyle(
                            color: AppTheme.neutral400, fontSize: 10.sp),
                      ),
                    ],
                  ),
                ],
              ),
            if (isInvetmentLimit == true)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.invested_this_year,
                        style: AppTheme.mainTextStyle(
                          fontSize: 11.sp,
                          color: AppTheme.neutral400,
                        ),
                      ).tr(),
                      Text(
                        '$raisedFunds SAR',
                        style: AppTheme.mainTextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.available_currency_to_invest,
                        style: AppTheme.mainTextStyle(
                          fontSize: 11.sp,
                          color: AppTheme.neutral400,
                        ),
                      ).tr(),
                      Text(
                        '$requestedFunds SAR',
                        style: AppTheme.mainTextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

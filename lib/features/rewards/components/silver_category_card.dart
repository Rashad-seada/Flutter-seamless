import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SilverCategoryCard extends StatelessWidget {
  const SilverCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Column(
            children: [
              cardBox(
                  number: '1',
                  header: LocaleKeys.intro_investor.tr(),
                  currency: '200 SAR',
                  subtitle1: LocaleKeys.for_every_qualified_invitation.tr()),
              Space(
                height: 2.h,
              ),
              cardBox(
                  number: '2',
                  header: LocaleKeys.plus_investor.tr(),
                  header2: LocaleKeys.to_unlock.tr(),
                  unlockable: '25,000 SAR',
                  currency: '400 SAR',
                  subtitle1: LocaleKeys.for_every_qualified_invitation.tr(),
                  subtitle2: LocaleKeys.cashback_for_every_investment.tr(),
                  percent: '1%'),
              Space(
                height: 2.h,
              ),
              cardBox(
                  number: '3',
                  header: LocaleKeys.professional_investor.tr(),
                  header2: LocaleKeys.to_unlock.tr(),
                  unlockable: '100,000 SAR',
                  currency: '600 SAR',
                  subtitle1: LocaleKeys.for_every_qualified_invitation.tr(),
                  subtitle2: LocaleKeys.cashback_for_every_investment.tr(),
                  percent: '2%',
                  subtitle3: LocaleKeys.welcome_gift_pack.tr()),
            ],
          ),
        ],
      ),
    );
  }
}

Widget cardBox({
  required String number,
  required String header,
  String? header2,
  String? unlockable,
  required String subtitle1,
  String? currency,
  String? subtitle2,
  String? percent,
  String? subtitle3,
}) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            padding: EdgeInsets.all(1.w),
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(5.w),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
            ),
            child: Center(
              child: Text(
                number,
                style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: AppTheme.secondary900,
                ),
              ),
            ),
          ),
          Space(
            width: 2.w,
          ),
          Text(
            header,
            style: AppTheme.mainTextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              color: AppTheme.secondary900,
            ),
          ),
          Space(
            width: 3.w,
          ),
          if (header2 != null && unlockable != null)
            Row(
              children: [
                Icon(
                  Icons.lock_outline,
                  size: 3.w,
                ),
                Text(
                  '$unlockable $header2',
                  style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 8.sp,
                    color: AppTheme.neutral400,
                  ),
                ),
              ],
            ),
        ],
      ),
      Space(
        height: 1.h,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$currency $subtitle1',
            style: AppTheme.mainTextStyle(
              fontSize: 9.sp,
              color: AppTheme.neutral400,
            ),
          ),
          if (subtitle2 != null)
            Text(
              '$percent $subtitle2',
              style: AppTheme.mainTextStyle(
                fontSize: 9.sp,
                color: AppTheme.neutral400,
              ),
            ),
          if (subtitle3 != null)
            Text(
              subtitle3,
              style: AppTheme.mainTextStyle(
                fontSize: 9.sp,
                color: AppTheme.neutral400,
              ),
            ),
        ],
      ),
    ],
  );
}

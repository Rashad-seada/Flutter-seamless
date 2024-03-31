import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/selling/components/main_button.dart';
import 'package:Mawthoq/features/selling/views/closed_selling_screen.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SellingHeading extends StatelessWidget {
  void navigateToClosedSellingScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => const ClosedSellingScreen()));
  }

  const SellingHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.h),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            3.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ]),
      child: Column(
        children: [
          Text(
            LocaleKeys.selling_with_seamless,
            style: AppTheme.mainTextStyle(
              color: AppTheme.primary900,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ).tr(),
          Space(
            height: 1.h,
          ),
          Text(
            LocaleKeys.sell_property_easily,
            style: AppTheme.mainTextStyle(
              color: AppTheme.secondary900,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ).tr(),
          Space(
            height: 1.h,
          ),
          Text(
            LocaleKeys.get_payment_faster,
            style: AppTheme.mainTextStyle(
              color: AppTheme.neutral400,
              fontSize: 11.sp,
            ),
            textAlign: TextAlign.center,
          ).tr(),
          Space(
            height: 3.h,
          ),
          MainSellingButton(
            label: LocaleKeys.selling_with_seamless.tr(),
            onTap: () => navigateToClosedSellingScreen(context),
          ),
        ],
      ),
    );
  }
}

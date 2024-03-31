import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/selling/components/main_button.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Selling5thHeading extends StatelessWidget {
  const Selling5thHeading({super.key});

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
      child: Container(
        padding: EdgeInsets.all(3.h),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: AppTheme.secondary900,
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
              LocaleKeys.ready_to_sell_property,
              style: AppTheme.mainTextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ).tr(),
            Space(
              height: 1.h,
            ),
            Text(
              LocaleKeys.thinking_of_selling,
              style: AppTheme.mainTextStyle(
                color: Colors.white,
                fontSize: 11.sp,
              ),
              textAlign: TextAlign.center,
            ).tr(),
            Space(
              height: 3.h,
            ),
            MainSellingButton(label: LocaleKeys.selling_with_seamless.tr()),
          ],
        ),
      ),
    );
  }
}

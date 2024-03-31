import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/custom_app_bar.dart';
import 'package:Mawthoq/features/selling/components/selling_2nd_heading.dart';
import 'package:Mawthoq/features/selling/components/selling_3rd_heading.dart';
import 'package:Mawthoq/features/selling/components/selling_4th_heading.dart';
import 'package:Mawthoq/features/selling/components/selling_5th_heading.dart';
import 'package:Mawthoq/features/selling/components/selling_heading.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SellingScreen extends StatelessWidget {
  const SellingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(2.w),
          physics: const BouncingScrollPhysics(),
          children: [
            Space(
              height: 2.h,
            ),
            CustomAppBar(
              label: LocaleKeys.selling_with_seamless.tr(),
            ),
            Space(
              height: 3.h,
            ),
            SellingHeading(),
            Space(
              height: 3.h,
            ),
            Selling2ndHeading(),
            Space(
              height: 3.h,
            ),
            Selling3rdHeading(),
            Space(
              height: 3.h,
            ),
            Selling4thHeading(),
            Space(
              height: 3.h,
            ),
            Selling5thHeading(),
            Space(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.contact_us_msg,
                  style: AppTheme.mainTextStyle(
                    color: AppTheme.secondary900,
                    fontSize: 11.sp,
                  ),
                ).tr(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    ' email@gmail.com',
                    style: AppTheme.mainTextStyle(
                      color: AppTheme.primary900,
                      fontSize: 11.sp,
                    ),
                  ),
                ),
              ],
            ),
            Space(
              height: 3.h,
            ),
          ],
        ),
      ),
    );
  }
}

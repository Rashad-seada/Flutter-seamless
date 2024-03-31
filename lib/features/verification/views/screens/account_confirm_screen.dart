import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/custom_app_bar.dart';
import 'package:Mawthoq/features/verification/views/components/verfication_steps_button.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class AccountConfirmScreen extends StatelessWidget {
  const AccountConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          children: [
            Space(
              height: 2.h,
            ),
            CustomAppBar(
              label: LocaleKeys.account_confirmation.tr(),
            ),
            Space(
              height: 3.h,
            ),
            Row(
              children: [
                Text(
                  LocaleKeys.information_sent_successfully,
                  style: AppTheme.mainTextStyle(
                    fontSize: 11.sp,
                    color: AppTheme.primary900,
                  ),
                ).tr(),
                Space(
                  width: 1.w,
                ),
                Icon(
                  Icons.done_all_outlined,
                  color: AppTheme.primary900,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space(
                  height: 4.h,
                ),
                Text(
                  LocaleKeys.identity_and_information_verifying,
                  style: AppTheme.mainTextStyle(
                    fontSize: 12.sp,
                    color: AppTheme.secondary900,
                    fontWeight: FontWeight.bold,
                  ),
                ).tr(),
                Space(
                  height: 1.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.complete_information_received,
                      style: AppTheme.mainTextStyle(
                        fontSize: 12.sp,
                        color: AppTheme.secondary900,
                      ),
                      textAlign: TextAlign.start,
                    ).tr(),
                  ],
                ),
                Space(
                  height: 4.h,
                ),
                Center(
                  child: Image.asset(
                    'images/account_confirming.png',
                    height: 50.w,
                    width: 50.w,
                  ),
                ),
                Space(
                  height: 4.h,
                ),
                VerficationStepsButton(
                  label: LocaleKeys.confirm.tr(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

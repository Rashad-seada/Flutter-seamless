import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/main_button.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/account_page_app_bar.dart';
import 'package:Mawthoq/features/wallet/components/wallet_tab.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../generated/locale_keys.g.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: false,
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          children: [
            Space(
              height: 2.h,
            ),
            AccountPageAppBar(
              label: LocaleKeys.wallet.tr(),
            ),
            Space(
              height: 3.h,
            ),
            Center(
              child: Text(
                LocaleKeys.balance.tr(),
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral900, fontSize: 13.sp),
              ),
            ),
            Space(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "SAR",
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral900, fontSize: 15.sp),
                ),
                Space(
                  width: 2.w,
                ),
                Text(
                  "1500",
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral900,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Space(
              height: 1.5.h,
            ),
            Row(
              children: [
                Expanded(
                  child: MainButton(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(1.5.w),
                    height: 10.w,
                    label: Text(
                      LocaleKeys.withdraw,
                      style: AppTheme.mainTextStyle(
                          color: AppTheme.secondary900,
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp),
                    ).tr(),
                    color: AppTheme.primary900,
                  ),
                ),
                Space(
                  width: 3.w,
                ),
                Expanded(
                  child: MainButton(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(1.5.w),
                    height: 10.w,
                    label: Text(
                      LocaleKeys.deposit,
                      style: AppTheme.mainTextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp),
                    ).tr(),
                    color: AppTheme.secondary900,
                  ),
                ),
              ],
            ),
            Space(
              height: 4.h,
            ),
            Text(
              LocaleKeys.transactions,
              style: AppTheme.mainTextStyle(
                color: AppTheme.secondary900,
                fontWeight: FontWeight.w700,
              ),
            ).tr(),
            Space(
              height: 1.h,
            ),
            WalletTab(
              tabsLabels: [
                LocaleKeys.balance.tr(),
                LocaleKeys.balance.tr(),
                LocaleKeys.balance.tr(),
                LocaleKeys.balance.tr(),
                LocaleKeys.balance.tr(),
              ],
            ),
            Space(
              height: 3.h,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(2.w),
              child: Column(
                children: [
                  Icon(
                    Icons.block_flipped,
                    size: 18.w,
                    color: AppTheme.neutral300,
                  ),
                  Text(
                    LocaleKeys.no_transactions,
                    style: AppTheme.mainTextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.neutral300,
                    ),
                  ).tr(),
                  Text(
                    LocaleKeys.no_transactions_sub_text,
                    style: AppTheme.mainTextStyle(
                      fontSize: 12.sp,
                      color: AppTheme.neutral300,
                    ),
                  ).tr(),
                ],
              ),
            ),
            Space(
              height: 2.h,
            ),
            MainButton(
              color: Colors.transparent,
              height: 5.h,
              border: Border.all(color: AppTheme.neutral400),
              label: Text(
                LocaleKeys.invest_now,
                style: AppTheme.mainTextStyle(
                  fontSize: 10.sp,
                  color: AppTheme.neutral400,
                ),
              ).tr(),
            )
          ],
        ),
      ),
    );
  }
}

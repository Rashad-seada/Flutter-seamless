import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/bloc/account/account_cubit.dart';
import 'package:Mawthoq/features/account/views/components/account_logout_botton.dart';
import 'package:Mawthoq/features/account/views/components/account_page_app_bar.dart';
import 'package:Mawthoq/features/account/views/components/account_page_card.dart';
import 'package:Mawthoq/features/account/views/components/account_page_container.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/main_button.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          child: ListView(
            children: [
              Space(
                height: 2.h,
              ),
              AccountPageAppBar(
                label: LocaleKeys.account.tr(),
              ),
              Space(
                height: 3.h,
              ),
              AccountPageCard(
                title: 'Youssef Ashour',
                subTitle: LocaleKeys.show_account_info.tr(),
                onTap: () =>
                    context.read<AccountCubit>().onAccountCardClick(context),
              ),
              Space(
                height: 2.h,
              ),
              AccountPageContainer(
                info: context.read<AccountCubit>().accountPageInfo1(context),
              ),
              Space(
                height: 2.h,
              ),
              AccountPageContainer(
                  info: context.read<AccountCubit>().accountPageInfo2(context)),
              Space(
                height: 2.h,
              ),
              MainButton(
                color: Colors.transparent,
                height: 5.h,
                border: Border.all(color: AppTheme.neutral400),
                label: Text(
                  LocaleKeys.logout,
                  style: AppTheme.mainTextStyle(
                    fontSize: 10.sp,
                    color: AppTheme.neutral400,
                  ),
                ).tr(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

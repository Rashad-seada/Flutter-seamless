import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/bloc/account/account_cubit.dart';
import 'package:Mawthoq/features/account/views/components/account_page_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../generated/locale_keys.g.dart';
import '../components/custom_app_bar.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

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

            CustomAppBar(label: LocaleKeys.help_center.tr(),),

            Space(
              height: 3.h,
            ),
            Text(
              'Help links',
              style: AppTheme.mainTextStyle(
                color:AppTheme.neutral400,

                fontWeight: FontWeight.w600,
                fontSize: 11.sp,
              ),
            ),
            Space(
              height: .5.h,
            ),
            AccountPageContainer(
              iconColor: AppTheme.primary900,
                info: context.read<AccountCubit>().helpCenterScreenInfo1),
            Space(
              height: 2.h,
            ),
            Text(
              'Contact us',
              style: AppTheme.mainTextStyle(
                color:AppTheme.neutral400,

                fontWeight: FontWeight.w600,
                fontSize: 11.sp,
              ),
            ),
            Space(
              height: .5.h,
            ),
            AccountPageContainer(
                iconColor: AppTheme.primary900,
                info: context.read<AccountCubit>().helpCenterScreenInfo2),
          ],
        ),
      ),
    );
  }
}

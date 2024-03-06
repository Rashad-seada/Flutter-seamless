import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/bloc/account/account_cubit.dart';
import 'package:Mawthoq/features/account/views/components/account_info_indicator.dart';
import 'package:Mawthoq/features/account/views/components/account_page_card.dart';
import 'package:Mawthoq/features/account/views/components/account_page_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class AccountInformationScreen extends StatelessWidget {
  const AccountInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account Information',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(6.w),
        child: ListView(
          children: [
            AccountPageCard(
              title: 'Youssef Ashour',
              subTitle: 'Since 2015',
              showArrow: false,
            ),
            Space(
              height: 3.h,
            ),
            Text(
              'Account Data',
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.bold, fontSize: 13.sp),
            ),
            Space(
              height: 1.5.h,
            ),
            AccountPageContainer(
                info: context.read<AccountCubit>().accountScreenInfo),
            Space(
              height: 3.h,
            ),
            Text('Investment limit',
                style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.bold, fontSize: 13.sp)),
            Space(
              height: 1.5.h,
            ),
            AccountInfoIndicator(
              raisedFunds: 25,
              requestedFunds: 1000,
              width: 86.w,
            ),
          ],
        ),
      ),
    );
  }
}

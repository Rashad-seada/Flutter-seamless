import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/bloc/account/account_cubit.dart';
import 'package:Mawthoq/features/account/views/components/account_page_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center'),
      ),
      body: Padding(
        padding: EdgeInsets.all(6.w),
        child: ListView(
          children: [
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
                info: context.read<AccountCubit>().helpCenterScreenInfo1),
            Space(
              height: 3.h,
            ),
            Text(
              'Contact Us',
              style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.bold, fontSize: 13.sp),
            ),
            Space(
              height: 1.5.h,
            ),
            AccountPageContainer(
                info: context.read<AccountCubit>().helpCenterScreenInfo2),
          ],
        ),
      ),
    );
  }
}

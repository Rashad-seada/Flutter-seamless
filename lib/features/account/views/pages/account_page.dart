import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/bloc/account/account_cubit.dart';
import 'package:Mawthoq/features/account/views/components/account_logout_botton.dart';
import 'package:Mawthoq/features/account/views/components/account_page_app_bar.dart';
import 'package:Mawthoq/features/account/views/components/account_page_card.dart';
import 'package:Mawthoq/features/account/views/components/account_page_container.dart';
import 'package:Mawthoq/features/auth/views/screens/01_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  void navigateToLoginScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(6.w),
        child: Column(
          children: [
            AccountPageAppBar(
              label: 'Account',
            ),
            Space(
              height: 4.h,
            ),
            AccountPageCard(
              title: 'Name',
              subTitle: 'Show Account Info.',
              onTap: () =>
                  context.read<AccountCubit>().onAccountCardClick(context),
            ),
            Space(
              height: 2.5.h,
            ),
            AccountPageContainer(
              info: context.read<AccountCubit>().accountPageInfo1(context),
            ),
            Space(
              height: 2.5.h,
            ),
            AccountPageContainer(
                info: context.read<AccountCubit>().accountPageInfo2(context)),
            Space(
              height: 2.h,
            ),
            AccountLogOutBotton(
              label: 'Logout',
              onTap: () => navigateToLoginScreen(context),
            ),
          ],
        ),
      ),
    );
  }
}

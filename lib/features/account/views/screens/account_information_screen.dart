import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/custom_progress_indicator.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/bloc/account/account_cubit.dart';
import 'package:Mawthoq/features/account/views/bloc/account/account_states.dart';
import 'package:Mawthoq/features/account/views/components/custom_app_bar.dart';
import 'package:Mawthoq/features/account/views/components/investment_limits_indicator.dart';
import 'package:Mawthoq/features/account/views/components/account_page_card.dart';
import 'package:Mawthoq/features/account/views/components/account_page_container.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/views/widgets/custom_error_widget.dart';

class AccountInformationScreen extends StatefulWidget {
  const AccountInformationScreen({super.key});

  @override
  State<AccountInformationScreen> createState() =>
      _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {

  @override
  void initState() {
    context.read<AccountCubit>().getAccount(context);
    super.initState();
  }

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
              label: LocaleKeys.account_info.tr(),
            ),
            Space(
              height: 3.h,
            ),


            BlocBuilder<AccountCubit, AccountState>(
              builder: (context, state) {

                if(state is AccountIsGettingAccount){
                  return CustomProgressIndicator();

                } else if(state is AccountError) {
                  return Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: CustomErrorWidget(
                      errorMessage: AccountError.failure.message ?? "Unknown",
                      onTap: () => context.read<AccountCubit>().getAccount(context),
                    ),
                  );

                } else if(state is AccountSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      AccountPageCard(
                        title: AccountSuccess.userEntity?.name ?? '--',
                        subTitle: 'Since 2015',
                        showArrow: false,
                      ),

                      Space(
                        height: 3.h,
                      ),
                      Text(
                        LocaleKeys.account_data,
                        style: AppTheme.mainTextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.sp),
                      ).tr(),
                      Space(
                        height: 1.5.h,
                      ),
                      AccountPageContainer(
                          info: context
                              .read<AccountCubit>()
                              .accountScreenInfo(AccountSuccess.userEntity)
                      ),
                      Space(
                        height: 3.h,
                      ),
                      Text(
                        LocaleKeys.investment_limit,
                        style: AppTheme.mainTextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.sp),
                      ).tr(),
                      Space(
                        height: 1.5.h,
                      ),
                      InvestmentLimitsIndicator(
                        headLabel: LocaleKeys.investment_limit.tr(),
                        svgAsset: AppImages.invLimit,
                        isInvetmentLimit: false,
                        raisedFunds: 5000,
                        requestedFunds: 10000,
                        width: 86.w,
                      ),
                    ],
                  );

                }
                return SizedBox();
              },
            ),

          ],
        ),
      ),
    );
  }
}

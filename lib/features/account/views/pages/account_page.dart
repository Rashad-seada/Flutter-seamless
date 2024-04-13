import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/views/widgets/custom_progress_indicator.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/bloc/account/account_cubit.dart';
import 'package:Mawthoq/features/account/views/bloc/account/account_states.dart';
import 'package:Mawthoq/features/account/views/components/account_page_app_bar.dart';
import 'package:Mawthoq/features/account/views/components/account_page_card.dart';
import 'package:Mawthoq/features/account/views/components/account_page_container.dart';
import 'package:Mawthoq/features/home/views/bloc/home/home_cubit.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/main_button.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  
  
  @override
  void initState() {
    context.read<AccountCubit>().getUserFromLocal(context);
    super.initState();
  }
  
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
              BlocBuilder<AccountCubit, AccountState>(
                builder: (context, state) {
                  return AccountPageCard(
                              title: (state is AccountSuccess)?  AccountSuccess.userEntity?.name?? "--" : "--",
                              subTitle: LocaleKeys.show_account_info.tr(),
                              onTap: () =>
                                  context.read<AccountCubit>().onAccountCardClick(context),
                            );
                },
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
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Row(
                          children: [
                            const Icon(Icons.logout,color: AppTheme.error,),
                            Space(width: 2.w,),
                            const Text(LocaleKeys.logout).tr(),
                          ],
                        ),
                        content: const Text(LocaleKeys.logout_sub_text).tr(),
                        actions: <Widget>[
                          
                          


                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(LocaleKeys.cancel,style: TextStyle(color: AppTheme.secondary900),).tr(),

                          ),


                          BlocBuilder<AccountCubit, AccountState>(
                            builder: (context, state) {
                              if(state is AccountIsLoggingOut){
                                return SizedBox(
                                  width: 15.w,
                                    child: CustomProgressIndicator(
                                      color: AppTheme.secondary900,
                                    )
                                );
                              } else {
                                return TextButton(
                                  onPressed: () => context.read<AccountCubit>().onLogoutTap(context),
                                  child: Text(LocaleKeys.logout,style: TextStyle(color: AppTheme.error),).tr(),
                                );
                              }
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              Space(
                height: 20.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Column(
                        children: [
                          Text(
                            'All copyrights to:',
                            style: AppTheme.mainTextStyle(
                              fontSize: 11.sp,
                              color: AppTheme.neutral300,
                            ),
                          ),

                          InkWell(
                            onTap: () {},
                            child: Image.asset(
                              filterQuality: FilterQuality.medium,
                              AppImages.ownerLabel,
                              height: 6.h,
                              width: 12.h,
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                  Space(
                    height: 2.h,
                  ),
                  Text(
                    'Version 1.0.0',
                    style: AppTheme.mainTextStyle(
                      fontSize: 10.sp,
                      color: AppTheme.neutral400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

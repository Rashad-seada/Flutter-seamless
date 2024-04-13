import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/custom_app_bar.dart';
import 'package:Mawthoq/features/verification/views/components/verfication_steps_button.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../blocs/verification_cubit.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          children: [
            Space(
              height: 2.h,
            ),
            CustomAppBar(
              label: LocaleKeys.terms_and_conditions.tr(),
            ),
            Space(
              height: 3.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.read_and_accept_terms_and_conditions,
                  style: AppTheme.mainTextStyle(
                    fontSize: 11.sp,
                    color: AppTheme.secondary900,
                  ),
                ).tr(),
                Space(
                  height: 2.h,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      2.w,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.terms_and_conditions_agreement,
                        style: AppTheme.mainTextStyle(
                          fontSize: 12.sp,
                          color: AppTheme.secondary900,
                          fontWeight: FontWeight.bold,
                        ),
                      ).tr(),
                      Space(
                        height: 1.h,
                      ),
                      Text(
                        'Published at February 25th,2024',
                        style: AppTheme.mainTextStyle(
                          fontSize: 12.sp,
                          color: AppTheme.secondary900,
                        ),
                      ).tr(),
                      Space(
                        height: 2.h,
                      ),
                      Text(
                        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
                        style: AppTheme.mainTextStyle(
                          fontSize: 12.sp,
                          color: AppTheme.neutral500,
                        ),
                      ),
                    ],
                  ),
                ),
                Space(
                  height: 2.h,
                ),
                BlocConsumer<VerificationCubit,VerificationState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return MainButton(
                      color: AppTheme.primary900,
                      width: 86.w,
                      height: 6.h,
                      label: (state is VerificationIsLoading)? CustomProgressIndicator(
                        color: AppTheme.neutral100,
                      ) : Text(
                        LocaleKeys.confirm,
                        style: AppTheme.mainTextStyle(
                            color: AppTheme.secondary900, fontSize: 12.sp),
                      ).tr(),
                      onTap: ()=> context.read<VerificationCubit>().step4(context),
                    );
                  },
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

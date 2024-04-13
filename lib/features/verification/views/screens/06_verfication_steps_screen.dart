import 'package:Mawthoq/core/views/widgets/custom_progress_indicator.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/custom_app_bar.dart';
import 'package:Mawthoq/features/verification/views/blocs/verification_cubit.dart';
import 'package:Mawthoq/features/verification/views/screens/account_confirm_screen.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_error_widget.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../components/verfication_steps_button.dart';
import '../components/verfication_steps_card.dart';
import '../components/verfication_text_card.dart';
import '07_upload_id1.dart';

// created
class VerficationScreen extends StatefulWidget {
  const VerficationScreen({super.key});

  @override
  State<VerficationScreen> createState() => _VerficationScreenState();
}

class _VerficationScreenState extends State<VerficationScreen> {

  @override
  void initState() {
    context.read<VerificationCubit>().getUser(context);
    super.initState();
  }

  void navigateToUploadIdPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => UploadId1Screen()));
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
              label: LocaleKeys.account_activation.tr(),
            ),
            Space(
              height: 3.h,
            ),


            BlocBuilder<VerificationCubit,VerificationState>(
              builder: (context, state) {


                if(state is VerificationIsPageLoading){
                  return CustomProgressIndicator();

                }else if(state is VerificationError){
                  return Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: CustomErrorWidget(
                      errorMessage: VerificationError.failure.message ?? "Unknown",
                      onTap: () => context.read<VerificationCubit>().getUser(context),
                    ),
                  );

                }else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/verfication_icon.png',
                      ),
                      VerficationTextCard(
                        cardTitle: LocaleKeys.lets_start_investing.tr(),
                      ),
                      Space(
                        height: 3.h,
                      ),
                      VerificationStepsCard(
                        label: LocaleKeys.register.tr(),
                        step: LocaleKeys.step_1.tr(),
                        isChecked: true,
                      ),
                      Space(
                        height: 2.h,
                      ),
                      VerificationStepsCard(
                        label: LocaleKeys.what_is_your_job.tr(),
                        step: LocaleKeys.step_2.tr(),
                        onTap: () =>
                        context.read<VerificationCubit>()
                          ..onStep2Tap(context),
                        isChecked: (context.read<VerificationCubit>().onboardingStep <= 5),
                      ),
                      Space(
                        height: 2.h,
                      ),
                      VerificationStepsCard(
                        label: LocaleKeys.address_verification.tr(),
                        onTap: () =>
                        context.read<VerificationCubit>()
                          ..onStep3Tap(context),
                        step: LocaleKeys.step_3.tr(),
                        isChecked: (context.read<VerificationCubit>().onboardingStep <= 6),

                      ),
                      Space(
                        height: 2.h,
                      ),
                      VerificationStepsCard(
                        label: LocaleKeys.id_verification.tr(),
                        step: LocaleKeys.step_4.tr(),
                        onTap: () => navigateToUploadIdPage(context),
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
                              LocaleKeys.continue_,
                              style: AppTheme.mainTextStyle(
                                  color: AppTheme.secondary900, fontSize: 12.sp),
                            ).tr(),
                            onTap: ()=> context.read<VerificationCubit>().step1(context),
                          );
                        },
                      ),

                    ],
                  );
                }

              },
            ),
          ],
        ),
      ),
    );
  }
}

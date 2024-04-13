import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/custom_app_bar.dart';
import 'package:Mawthoq/features/verification/views/screens/account_confirm_screen.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../blocs/verification_cubit.dart';
import '../components/upload_id_card.dart';
import '../components/verfication_steps_button.dart';
import '../components/verfication_text_card.dart';

class UploadId2Screen extends StatelessWidget {
  void navigateAccountConfirmScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => AccountConfirmScreen()));
  }

  const UploadId2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          children: [
            Space(
              height: 2.h,
            ),
            CustomAppBar(
              label: LocaleKeys.id_verification.tr(),
            ),
            Space(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.all(3.w),
              child: Column(
                children: [
                  VerficationTextCard(
                    cardTitle: LocaleKeys.upload_id_or_passport.tr(),
                  ),
                  Space(
                    height: 2.h,
                  ),
                  BlocBuilder<VerificationCubit,VerificationState>(
                    builder: (context, state) {
                      return UploadIdCard(
                        image: context.read<VerificationCubit>().front,
                        label: LocaleKeys.front_side_of_id.tr(),
                        onTap: () => context.read<VerificationCubit>().onFrontImageTap(),
                      );
                    },
                  ),
                  Space(
                    height: 2.h,
                  ),
                  BlocBuilder<VerificationCubit,VerificationState>(
                    builder: (context, state) {
                      return UploadIdCard(
                                      image: context.read<VerificationCubit>().back,
                                      label: LocaleKeys.back_side_of_id.tr(),
                                      onTap: () => context.read<VerificationCubit>().onBackImageTap(),
                                    );
                    },
                  ),
                  Space(
                    height: 2.h,
                  ),
                  BlocBuilder<VerificationCubit,VerificationState>(
                    builder: (context, state) {
                      return UploadIdCard(
                                      image: context.read<VerificationCubit>().image,
                                      label: LocaleKeys.your_photo_with_id.tr(),
                                      onTap: () => context.read<VerificationCubit>().onImageTap(),
                                    );
                    },
                  ),
                  Space(
                    height: 2.h,
                  ),

                  BlocBuilder<VerificationCubit,VerificationState>(
                    builder: (context, state) {
                      return MainButton(
                        color: AppTheme.primary900,
                        width: 86.w,
                        height: 6.h,
                        label: (state is VerificationIsLoading)? CustomProgressIndicator(
                          color: AppTheme.neutral100,
                        ) : Text(
                          LocaleKeys.upload,
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.secondary900, fontSize: 12.sp),
                        ).tr(),
                        onTap: ()=> context.read<VerificationCubit>().step7(context),
                      );
                    },
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

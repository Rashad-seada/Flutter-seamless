import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/custom_app_bar.dart';
import 'package:Mawthoq/features/verification/views/blocs/verification_cubit.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../components/verfication_steps_button.dart';
import '../components/verfication_steps_card.dart';
import '../components/verfication_text_card.dart';
import '07_upload_id1.dart';

// created
class VerficationScreen extends StatelessWidget {
  void navigateToUploadIdPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => UploadId1Screen()));
  }

  VerficationScreen({super.key});

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
            Column(
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
                      context.read<VerificationCubit>()..onStep2Tap(context),
                ),
                Space(
                  height: 2.h,
                ),
                VerificationStepsCard(
                  label: LocaleKeys.address_verification.tr(),
                  onTap: () =>
                      context.read<VerificationCubit>()..onStep3Tap(context),
                  step: LocaleKeys.step_3.tr(),
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
                VerficationStepsButton(
                  label: LocaleKeys.continue_.tr(),
                  // onTap: () => navigateToUploadIdPage(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

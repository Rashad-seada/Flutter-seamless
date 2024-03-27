import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/verification/views/blocs/verification_cubit.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Activation'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/verfication_icon.png',
                ),
                VerficationTextCard(
                  cardTitle: 'Lets start investing',
                ),
                Space(
                  height: 3.h,
                ),
                VerificationStepsCard(
                  label: 'Register',
                  step: 'Step 1',
                    isChecked: true

                ),
                Space(
                  height: 1.5.h,
                ),
                VerificationStepsCard(
                  label: 'What is your job?',
                  step: 'Step 2',
                  onTap: ()=> context.read<VerificationCubit>()..onStep2Tap(context),
                ),
                Space(
                  height: 1.5.h,
                ),
                VerificationStepsCard(
                  label: 'Address Verfication',
                  onTap: ()=> context.read<VerificationCubit>()..onStep3Tap(context),

                  step: 'Step 3',
                ),
                Space(
                  height: 1.5.h,
                ),
                VerificationStepsCard(
                  label: 'ID Verfication',
                  step: 'Step 4',
                  onTap: () => navigateToUploadIdPage(context),

                ),
                Space(
                  height: 1.5.h,
                ),
                VerficationStepsButton(
                  label: 'Continue',
                  //onTap: () => navigateToUploadIdPage(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

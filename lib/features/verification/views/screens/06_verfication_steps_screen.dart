import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/verification/views/components/verfication_steps_button.dart';
import 'package:Mawthoq/features/verification/views/components/verfication_steps_card.dart';
import 'package:Mawthoq/features/verification/views/components/verfication_text_card.dart';
import 'package:Mawthoq/features/verification/views/screens/07_upload_id1.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
                  svgAsset: AppImages.plus,
                  step: 'Step 1',
                ),
                Space(
                  height: 1.5.h,
                ),
                VerificationStepsCard(
                  label: 'What is your job?',
                  svgAsset: AppImages.plus,
                  step: 'Step 2',
                ),
                Space(
                  height: 1.5.h,
                ),
                VerificationStepsCard(
                  label: 'Address Verfication',
                  svgAsset: AppImages.plus,
                  step: 'Step 3',
                ),
                Space(
                  height: 1.5.h,
                ),
                VerificationStepsCard(
                  label: 'ID Verfication',
                  svgAsset: AppImages.plus,
                  step: 'Step 4',
                ),
                Space(
                  height: 1.5.h,
                ),
                VerficationStepsButton(
                  label: 'Continue',
                  onTap: () => navigateToUploadIdPage(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/auth/components/verfication_steps_button.dart';
import 'package:Mawthoq/features/auth/components/verfication_steps_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VerficationScreen extends StatelessWidget {
  const VerficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account activation'),
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
                Text(
                  'Lets start ivesting',
                  style: AppTheme.mainTextStyle(
                    fontSize: 12.sp,
                    color: AppTheme.secondary900,
                  ),
                ),
                Text(
                  'Investing with us requires activating your identity or passport, residence address, and client details before starting the investment process',
                  style: AppTheme.mainTextStyle(
                    fontSize: 11.sp,
                    color: AppTheme.neutral400,
                  ),
                ),
                Space(
                  height: 3.h,
                ),
                VerficationStepsCard(
                  label: 'Register',
                  svgAsset: AppImages.plus,
                  step: 'Step 1',
                ),
                Space(
                  height: 1.5.h,
                ),
                VerficationStepsCard(
                  label: 'What is your job?',
                  svgAsset: AppImages.plus,
                  step: 'Step 2',
                ),
                Space(
                  height: 1.5.h,
                ),
                VerficationStepsCard(
                  label: 'Address Verfication',
                  svgAsset: AppImages.plus,
                  step: 'Step 3',
                ),
                Space(
                  height: 1.5.h,
                ),
                VerficationStepsCard(
                  label: 'ID Verfication',
                  svgAsset: AppImages.plus,
                  step: 'Step 4',
                ),
                Space(
                  height: 1.5.h,
                ),
                VerficationStepsButton(label: 'Continue'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/auth/components/id_activation_card.dart';
import 'package:Mawthoq/features/auth/components/verfication_steps_button.dart';
import 'package:Mawthoq/features/auth/components/verfication_text_card.dart';
import 'package:Mawthoq/features/auth/views/screens/08_upload_id2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class UploadId1Screen extends StatelessWidget {
  void navigateToUploadIdPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => UploadId2Screen()));
  }

  UploadId1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ID Activation',
          style: AppTheme.mainTextStyle(
            color: AppTheme.secondary900,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerficationTextCard(
                  cardTitle: 'Upload ID or passport',
                ),
                Space(
                  height: 1.5.h,
                ),
                GridView.count(
                  childAspectRatio: 2 / 2.5,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    IdActivationCard(
                        path: AppImages.id2Image,
                        label:
                            'Make sure to display all details including the lines at the bottom'),
                    IdActivationCard(
                        path: AppImages.id1Image,
                        label:
                            'We do not accept photos taken from another screen'),
                    IdActivationCard(
                        path: AppImages.id4Image,
                        label:
                            'We do not accept photos with glare or excessive exposure'),
                    IdActivationCard(
                        path: AppImages.id3Image,
                        label: 'We do not accept cropped or damaged images'),
                  ],
                ),
                Space(
                  height: 2.h,
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

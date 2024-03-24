import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/verification/views/components/upload_id_card.dart';
import 'package:Mawthoq/features/verification/views/components/verfication_steps_button.dart';
import 'package:Mawthoq/features/verification/views/components/verfication_text_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UploadId2Screen extends StatelessWidget {
  const UploadId2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload ID',
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(3.w),
            child: Column(
              children: [
                VerficationTextCard(
                  cardTitle: 'Upload ID or passport',
                ),
                Space(
                  height: 2.h,
                ),
                UploadIdCard(
                  label: 'Front side of ID',
                  onTap: () {},
                ),
                Space(
                  height: 2.h,
                ),
                UploadIdCard(
                  label: 'Back side of ID',
                  onTap: () {},
                ),
                Space(
                  height: 2.h,
                ),
                UploadIdCard(
                  label: 'Your photo with ID',
                  onTap: () {},
                ),
                Space(
                  height: 2.h,
                ),
                VerficationStepsButton(
                  label: 'Upload',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

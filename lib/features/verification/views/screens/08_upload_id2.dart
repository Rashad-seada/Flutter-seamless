import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/custom_app_bar.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../components/upload_id_card.dart';
import '../components/verfication_steps_button.dart';
import '../components/verfication_text_card.dart';

class UploadId2Screen extends StatelessWidget {
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
                  UploadIdCard(
                    label: LocaleKeys.front_side_of_id.tr(),
                    onTap: () {},
                  ),
                  Space(
                    height: 2.h,
                  ),
                  UploadIdCard(
                    label: LocaleKeys.back_side_of_id.tr(),
                    onTap: () {},
                  ),
                  Space(
                    height: 2.h,
                  ),
                  UploadIdCard(
                    label: LocaleKeys.your_photo_with_id.tr(),
                    onTap: () {},
                  ),
                  Space(
                    height: 2.h,
                  ),
                  VerficationStepsButton(
                    label: LocaleKeys.upload.tr(),
                    onTap: () {},
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

import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/custom_app_bar.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../components/id_activation_card.dart';
import '../components/verfication_steps_button.dart';
import '../components/verfication_text_card.dart';
import '08_upload_id2.dart';

class UploadId1Screen extends StatelessWidget {
  void navigateToUploadIdPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => UploadId2Screen()));
  }

  UploadId1Screen({super.key});

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerficationTextCard(
                  cardTitle: LocaleKeys.upload_id_or_passport.tr(),
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
                      label: LocaleKeys.make_sure_to_display_details.tr(),
                    ),
                    IdActivationCard(
                      path: AppImages.id1Image,
                      label: LocaleKeys.no_photos_from_another_screen.tr(),
                    ),
                    IdActivationCard(
                      path: AppImages.id4Image,
                      label: LocaleKeys.no_photos_with_glare.tr(),
                    ),
                    IdActivationCard(
                      path: AppImages.id3Image,
                      label: LocaleKeys.no_cropped_or_damaged_images.tr(),
                    ),
                  ],
                ),
                Space(
                  height: 2.h,
                ),
                VerficationStepsButton(
                  label: LocaleKeys.continue_.tr(),
                  onTap: () => navigateToUploadIdPage(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

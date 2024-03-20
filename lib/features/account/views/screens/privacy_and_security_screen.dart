import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/privacy_security_card.dart';
import 'package:Mawthoq/features/account/views/components/privacy_security_container.dart';
import 'package:Mawthoq/features/account/views/components/settings_toggle_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../generated/locale_keys.g.dart';
import '../components/custom_app_bar.dart';

class PrivacyAndSecurityScreen extends StatelessWidget {
  const PrivacyAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          children: [

            Space(
              height: 2.h,
            ),

            CustomAppBar(label: LocaleKeys.privacy_security.tr(),),

            Space(
              height: 3.h,
            ),
            PrivacyAndSecurityCard(),
            Space(
              height: 3.h,
            ),
            Text(
              'Privacy',
              style: AppTheme.mainTextStyle(
                color:AppTheme.neutral400,
                fontWeight: FontWeight.w600,
                fontSize: 11.sp,
              ),
            ),
            Space(
              height: .5.h,
            ),
            PrivacyAndSecurityContainer(label: '', svgAsset: '',),
            Space(
              height: 2.h,
            ),
            Text(
              'Safety',
              style: AppTheme.mainTextStyle(
                color:AppTheme.neutral400,

                fontWeight: FontWeight.w600,
                fontSize: 11.sp,
              ),
            ),
            Space(
              height: .5.h,
            ),
            SettingsToggleCard(),
          ],
        ),
      ),
    );
  }
}

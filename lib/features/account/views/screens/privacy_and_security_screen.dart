import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/privacy_security_card.dart';
import 'package:Mawthoq/features/account/views/components/privacy_security_container.dart';
import 'package:Mawthoq/features/account/views/components/settings_toggle_card.dart';
import 'package:Mawthoq/features/account/views/screens/privacy_politics_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../generated/locale_keys.g.dart';
import '../components/custom_app_bar.dart';

class PrivacyAndSecurityScreen extends StatelessWidget {
  void navigateToPrivacyPoliticsScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => const PrivacyPoliticsScreen()));
  }

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
            CustomAppBar(
              label: LocaleKeys.privacy_security.tr(),
            ),
            Space(
              height: 3.h,
            ),
            PrivacyAndSecurityCard(),
            Space(
              height: 3.h,
            ),
            Text(
              LocaleKeys.privacy,
              style: AppTheme.mainTextStyle(
                color: AppTheme.neutral400,
                fontWeight: FontWeight.w600,
                fontSize: 11.sp,
              ),
            ).tr(),
            Space(
              height: .5.h,
            ),
            PrivacyAndSecurityContainer(
              label: LocaleKeys.privacy_policy.tr(),
              svgAsset: AppImages.global,
              onTap: () => navigateToPrivacyPoliticsScreen(context),
            ),
            Space(
              height: 2.h,
            ),
            Text(
              LocaleKeys.safety,
              style: AppTheme.mainTextStyle(
                color: AppTheme.neutral400,
                fontWeight: FontWeight.w600,
                fontSize: 11.sp,
              ),
            ).tr(),
            Space(
              height: .5.h,
            ),
            SettingsToggleCard(
              title: LocaleKeys.biometric_authentication.tr(),
              subTitle: LocaleKeys.more_security_factors.tr(),
              svgAsset: AppImages.email,
            ),
          ],
        ),
      ),
    );
  }
}

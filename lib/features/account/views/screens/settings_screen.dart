import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/bloc/settings/settings_cubit.dart';
import 'package:Mawthoq/features/account/views/components/settings_card.dart';
import 'package:Mawthoq/features/account/views/components/settings_toggle_card.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../components/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
              label: LocaleKeys.settings.tr(),
            ),
            Space(
              height: 3.h,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SettingsCard(
                    model: context.read<SettingsCubit>().settingsInfo[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Space(
                    height: 2.h,
                  );
                },
                itemCount: context.read<SettingsCubit>().settingsInfo.length),
            Space(
              height: 2.h,
            ),
            SettingsToggleCard(
              title: 'Notifications',
              subTitle: LocaleKeys.rent_paid_notifications.tr(),
              svgAsset: AppImages.notifications,
            ),
            Space(
              height: 2.h,
            ),
            SettingsToggleCard(
              title: LocaleKeys.email_for_offers.tr(),
              subTitle: LocaleKeys.email_notifications_properties.tr(),
              svgAsset: AppImages.email,
            ),
          ],
        ),
      ),
    );
  }
}

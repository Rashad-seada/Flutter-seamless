import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/features/account/views/bloc/settings/settings_states.dart';
import 'package:Mawthoq/features/account/views/utils/account_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  void _showLanguageMenu(BuildContext context) {}

  void onMenuClick(BuildContext context) {
    _showLanguageMenu(context);
  }

  List<SettingsModel> get settingsInfo => [
        SettingsModel<LanguageModel>(
            AppImages.email, 'Language', 'English', () {}, [
          LanguageModel('English', () {}),
          LanguageModel('Arabic', () {}),
        ]),
        SettingsModel<CurrencyModel>(
            AppImages.phone, 'The currency', 'SAR', () {}, [
          CurrencyModel('Saudi Arabia Riyal', 'SAR', () {}),
          CurrencyModel('Kuwaiti Dinar', 'KWD', () {}),
        ]),
      ];

  List<SettingsCardModel> get settingsCardInfo1 => [
        SettingsCardModel(AppImages.phone, 'The currency', true),
      ];

  List<SettingsCardModel> get settingsCardInfo2 => [
        SettingsCardModel(AppImages.phone, 'The currency', false),
      ];
}

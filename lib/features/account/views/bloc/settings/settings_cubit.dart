import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/features/account/views/bloc/settings/settings_states.dart';
import 'package:Mawthoq/features/account/views/utils/account_model.dart';
import 'package:Mawthoq/features/language/views/blocs/language/language_cubit.dart';
import 'package:Mawthoq/features/language/views/screens/language_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  void _showLanguageMenu(BuildContext context) {}

  void onMenuClick(BuildContext context) {
    _showLanguageMenu(context);
  }

  List<SettingsModel> settingsInfo(context) => [
        SettingsModel(
            AppImages.language, 'Language', 'English', () =>
          _navigateToLanguageScreen(context)
        ),
        SettingsModel(
            AppImages.coin, 'The currency', 'SAR', () {}),
      ];

  List<SettingsCardModel> get settingsCardInfo1 => [
        SettingsCardModel(AppImages.phone, 'The currency', true),
      ];

  List<SettingsCardModel> get settingsCardInfo2 => [
        SettingsCardModel(AppImages.phone, 'The currency', false),
      ];

  _navigateToLanguageScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> LanguageScreen()));
  }
}

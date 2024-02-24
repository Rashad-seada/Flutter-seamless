import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/features/account/views/bloc/settings/settings_states.dart';
import 'package:Mawthoq/features/account/views/utils/account_model.dart';
import 'package:bloc/bloc.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  List<SettingsContainerModel> get settingsContainerInfo1 => [
        SettingsContainerModel(AppImages.email, 'Language', 'English', () {}),
      ];

  List<SettingsContainerModel> get settingsContainerInfo2 => [
        SettingsContainerModel(AppImages.phone, 'The currency', 'SAR', () {}),
      ];

  List<SettingsCardModel> get settingsCardInfo1 => [
        SettingsCardModel(AppImages.phone, 'The currency', true),
      ];

  List<SettingsCardModel> get settingsCardInfo2 => [
        SettingsCardModel(AppImages.phone, 'The currency', false),
      ];
}

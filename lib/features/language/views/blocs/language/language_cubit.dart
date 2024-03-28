import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(BuildContext context) : super(LanguageInitial()){
    selectedLanguage = EasyLocalization.of(context)!.locale;
  }



  late Locale selectedLanguage;

  onLanguageChanged(Object? object,BuildContext context) {
    emit(LanguageLanguageChange());
    selectedLanguage = object as Locale;
    EasyLocalization.of(context)!.setLocale(selectedLanguage);
    emit(LanguageInitial());
  }

  String getFullLanguageName() {
    switch (selectedLanguage.toLanguageTag()) {
      case 'en':
        return LocaleKeys.english.tr();
      case 'ar':
        return LocaleKeys.arabic.tr();
    // Add more cases for other languages if needed
      default:
        return 'Unknown';
    }
  }

}

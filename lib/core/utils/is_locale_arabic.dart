import 'package:flutter/cupertino.dart';

bool isLocaleArabic(BuildContext context) {
  // Get the locale from the context
  Locale locale = Localizations.localeOf(context);

  // Check if the language code is Arabic or any other RTL language
  return (locale.languageCode == 'ar' || locale.languageCode == 'fa' || locale.languageCode == 'he');
}

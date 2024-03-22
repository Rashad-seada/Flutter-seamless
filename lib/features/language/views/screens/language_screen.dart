import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/features/language/views/components/language_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../account/views/components/custom_app_bar.dart';
import '../blocs/language/language_cubit.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        shrinkWrap: true,
        children: [
          Space(
            height: 2.h,
          ),
          CustomAppBar(
            label: LocaleKeys.language.tr(),
          ),
          Space(
            height: 5.h,
          ),
          LanguageItem(
              label: LocaleKeys.arabic.tr(),
              image: AppImages.arabic,
              value: Locale('ar'),
              groupValue: context.read<LanguageCubit>().selectedLanguage,
              onChanged: (_)=> context.read<LanguageCubit>().onLanguageChanged(_,context)),
          Space(
            height: 2.h,
          ),
          LanguageItem(
              label: LocaleKeys.english.tr(),
              image: AppImages.english,
              value: Locale('en'),
              groupValue: context.read<LanguageCubit>().selectedLanguage,
              onChanged: (_)=> context.read<LanguageCubit>().onLanguageChanged(_,context)),
        ],
      ),
    ));
  }
}

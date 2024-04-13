import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/features/account/domain/usecases/get_account_use_case.dart';
import 'package:Mawthoq/features/account/views/bloc/account/account_states.dart';
import 'package:Mawthoq/features/account/views/screens/account_information_screen.dart';
import 'package:Mawthoq/features/account/views/screens/blog_screen.dart';
import 'package:Mawthoq/features/account/views/screens/help_center_screen.dart';
import 'package:Mawthoq/features/account/views/screens/investment_limits_screen.dart';
import 'package:Mawthoq/features/account/views/screens/privacy_and_security_screen.dart';
import 'package:Mawthoq/features/account/views/screens/privacy_politics_screen.dart';
import 'package:Mawthoq/features/account/views/screens/settings_screen.dart';
import 'package:Mawthoq/features/account/views/utils/account_model.dart';
import 'package:Mawthoq/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:Mawthoq/features/auth/domain/usecases/logout_use_case.dart';
import 'package:Mawthoq/features/auth/views/screens/00_auth_methods_screen.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/views/widgets/custom_flush_bar.dart';
import '../../../../auth/data/entities/user_entity.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());


  onLogoutTap(BuildContext context){
    logout(context);
  }

  logout(BuildContext context){
    emit(AccountIsLoggingOut());
    getIt<LogoutUseCase>().call().then((value) => value.fold(
            (error) {
              showFlushBar(
                  context,
                  title: "Error ${error.failureCode}",
                  message : error.message
              );
            },
            (success) {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> AuthMethodsScreen()), (route) => false);
        }
    ));
  }

  getUserFromLocal(BuildContext context){
    emit(AccountIsGettingAccount());
    getIt<GetUserUseCase>().call().then((value) => value.fold(
            (error) {
          emit(AccountError(error));
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
        },
            (success) {
          emit(AccountSuccess(success!));
        }
    ));
  }

  getAccount(BuildContext context){
    emit(AccountIsGettingAccount());
    getIt<GetAccountUseCase>().call().then((value) => value.fold(
        (error) {
          emit(AccountError(error));

        },
        (success) {
          emit(AccountSuccess(success.user!));
        }
    ));
  }



  void _navigateToAccountInfoScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => const AccountInformationScreen()));
  }

  void _navigateToSettingsScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
  }

  void _navigateToPrivacyAndSecurityScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => const PrivacyAndSecurityScreen()));
  }

  void _navigateToHelpCenterScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const HelpCenterScreen()));
  }

  void _navigateToBlogScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const BlogScreen()));
  }

  void _navigateToInvestmentLimitsScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => const InvestmentLimitsScreen()));
  }

  void _navigateToPrivacyPoliticsScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => const PrivacyPoliticsScreen()));
  }

  void onPrivacyPoliticsClick(BuildContext context) {
    _navigateToPrivacyPoliticsScreen(context);
  }

  void onInvestmentLimitsClick(BuildContext context) {
    _navigateToInvestmentLimitsScreen(context);
  }

  void onAccountCardClick(BuildContext context) {
    _navigateToAccountInfoScreen(context);
  }

  void onSettingsClick(BuildContext context) {
    _navigateToSettingsScreen(context);
  }

  void onPrivacyAndSecurityClick(BuildContext context) {
    _navigateToPrivacyAndSecurityScreen(context);
  }

  void onHelpCenterClick(BuildContext context) {
    _navigateToHelpCenterScreen(context);
  }

  void onBlogClick(BuildContext context) {
    _navigateToBlogScreen(context);
  }

  List<AccountContainerModel>  accountScreenInfo(UserEntity? user) => [
        AccountContainerModel(AppImages.email, user?.email ?? "--", () {}),
        AccountContainerModel(AppImages.phone, LocaleKeys.phone.tr(), () {}),
      ];

  List<AccountContainerModel> get privacyAndSecurityScreenInfo => [
        AccountContainerModel(AppImages.email, 'Email', () {}),
        AccountContainerModel(AppImages.phone, 'Phone', () {}),
      ];

  List<AccountContainerModel> get helpCenterScreenInfo1 => [
        AccountContainerModel(
            AppImages.questionMark, LocaleKeys.ask_and_answer.tr(), () {}),
        AccountContainerModel(
            AppImages.videoPlay, LocaleKeys.how_it_works.tr(), () {}),
      ];

  List<AccountContainerModel> get helpCenterScreenInfo2 => [
        AccountContainerModel(
            AppImages.messege, LocaleKeys.direct_chat.tr(), () {}),
        AccountContainerModel(
            AppImages.phone, LocaleKeys.whatsapp_contact.tr(), () {}),
        AccountContainerModel(
            AppImages.email, LocaleKeys.email_contact.tr(), () {}),
      ];

  List<AccountContainerModel> get blogScreenInfo => [
        AccountContainerModel(AppImages.email, 'Email', () {}),
        AccountContainerModel(AppImages.phone, 'Phone', () {}),
      ];

  List<AccountContainerModel> accountPageInfo1(BuildContext context) => [
        AccountContainerModel(
            null, LocaleKeys.settings.tr(), () => onSettingsClick(context)),
        AccountContainerModel(null, LocaleKeys.privacy_security.tr(),
            () => onPrivacyAndSecurityClick(context))
      ];

  List<AccountContainerModel> accountPageInfo2(BuildContext context) => [
        AccountContainerModel(null, LocaleKeys.help_center.tr(),
            () => onHelpCenterClick(context)),
        AccountContainerModel(
            null, LocaleKeys.blog.tr(), () => onBlogClick(context))
      ];
}

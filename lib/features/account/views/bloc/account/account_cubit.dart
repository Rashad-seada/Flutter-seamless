import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/features/account/views/bloc/account/account_states.dart';
import 'package:Mawthoq/features/account/views/screens/account_information_screen.dart';
import 'package:Mawthoq/features/account/views/screens/blog_screen.dart';
import 'package:Mawthoq/features/account/views/screens/help_center_screen.dart';
import 'package:Mawthoq/features/account/views/screens/privacy_and_security_screen.dart';
import 'package:Mawthoq/features/account/views/screens/settings_screen.dart';
import 'package:Mawthoq/features/account/views/utils/account_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());

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
        context, MaterialPageRoute(builder: (_) => const BlogScreeen()));
  }

  void onAccountCardClick(BuildContext context) {
    print('sdfgn');
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

  List<AccountContainerModel> get accountScreenInfo => [
        AccountContainerModel(AppImages.email, 'Email', () {}),
        AccountContainerModel(AppImages.phone, 'Phone', () {}),
      ];

  List<AccountContainerModel> get privacyAndSecurityScreenInfo => [
        AccountContainerModel(AppImages.email, 'Email', () {}),
        AccountContainerModel(AppImages.phone, 'Phone', () {}),
      ];

  List<AccountContainerModel> get helpCenterScreenInfo1 => [
        AccountContainerModel(AppImages.email, 'Ask & Answer', () {}),
        AccountContainerModel(AppImages.eye, 'How it works', () {}),
      ];

  List<AccountContainerModel> get helpCenterScreenInfo2 => [
        AccountContainerModel(AppImages.email, 'Direct chat', () {}),
        AccountContainerModel(AppImages.phone, 'Whatsapp contact', () {}),
        AccountContainerModel(AppImages.email, 'Email contact', () {}),
      ];

  List<AccountContainerModel> get blogScreenInfo => [
        AccountContainerModel(AppImages.email, 'Email', () {}),
        AccountContainerModel(AppImages.phone, 'Phone', () {}),
      ];

  List<AccountContainerModel> accountPageInfo1(BuildContext context) => [
        AccountContainerModel(null, 'Settings', () => onSettingsClick(context)),
        AccountContainerModel(null, 'Privacy and security',
            () => onPrivacyAndSecurityClick(context))
      ];

  List<AccountContainerModel> accountPageInfo2(BuildContext context) => [
        AccountContainerModel(
            null, 'Help center', () => onHelpCenterClick(context)),
        AccountContainerModel(null, 'Blog', () => onBlogClick(context))
      ];
}

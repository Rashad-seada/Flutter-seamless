import 'package:Mawthoq/features/auth/components/auth_method_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import '/core/config/app_images.dart';
import '/core/views/widgets/space.dart';
import '/features/auth/views/screens/01_login_screen.dart';
import '/features/auth/views/screens/02_register_screen.dart';
import '/generated/locale_keys.g.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/main_button.dart';

class AuthMethodsScreen extends StatelessWidget {
  const AuthMethodsScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  void navigateToRegistrationScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const RegisterScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          AuthMethodAppBar(),
          Space(
            height: 2.h,
          ),
          Center(
            child: Image.asset(
              AppImages.authMethods,
              width: 100.w,
              height: 50.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    LocaleKeys.auth_method_title,
                    style: AppTheme.mainTextStyle(
                      color: AppTheme.secondary900,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ).tr(),
                ),
                Space(
                  height: 1.h,
                ),
                Text(
                  textAlign: TextAlign.center,
                  LocaleKeys.auth_method_description,
                  style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral700,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ).tr(),
                Space(
                  height: 4.h,
                ),
                MainButton(
                  color: AppTheme.secondary900,
                  width: 86.w,
                  height: 6.5.h,
                  label: Text(
                    LocaleKeys.register,
                    style: AppTheme.mainTextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                    ),
                  ).tr(),
                  onTap: () => navigateToRegistrationScreen(context),
                ),
                Space(
                  height: 2.h,
                ),
                MainButton(
                  width: 86.w,
                  height: 6.5.h,
                  border: Border.all(color: AppTheme.primary900, width: .2.w),
                  color: AppTheme.primary900,
                  label: Text(
                    LocaleKeys.login,
                    style: AppTheme.mainTextStyle(
                      color: AppTheme.secondary900,
                      fontSize: 13.sp,
                    ),
                  ).tr(),
                  onTap: () => navigateToLoginScreen(context),
                ),
                Space(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

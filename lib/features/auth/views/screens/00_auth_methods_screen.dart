import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '/core/config/app_images.dart';
import '/core/views/widgets/custom_divider.dart';
import '/core/views/widgets/space.dart';
import '/features/auth/views/screens/01_login_screen.dart';
import '/features/auth/views/screens/02_register_screen.dart';
import '/generated/locale_keys.g.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/main_button.dart';

class AuthMethodsScreen extends StatelessWidget {
  const AuthMethodsScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> const LoginScreen()));
  }

  void navigateToRegistrationScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> const RegisterScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space(
              height: 4.h,
            ),
            Center(
              child: Image.asset(
                AppImages.authMethods,
                width: 86.w,
                height: 28.h,
              ),
            ),
            Space(
              height: 4.h,
            ),
            Text(
              LocaleKeys.auth_method_title,
              style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900,
                fontSize: 22.sp,
              ),
            ).tr(),
            Space(
              height: 2.h,
            ),
            Center(
              child: Text(
                LocaleKeys.auth_method_description,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral700, fontSize: 12.sp),
              ).tr(),
            ),
            Space(
              height: 6.h,
            ),
            MainButton(
              color: AppTheme.primary900,
              width: 86.w,
              height: 6.5.h,
              label: Text(
                LocaleKeys.login,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.neutral100, fontSize: 13.sp),
              ).tr(),
              onTap: ()=> navigateToLoginScreen(context),
            ),
            Space(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: const CustomDivider(),
            ),
            Space(
              height:3.h,
            ),
            MainButton(
              width: 86.w,
              height: 6.5.h,
              border: Border.all(color: AppTheme.primary900,width: .2.w),
              color: Colors.transparent,
              label: Text(
                LocaleKeys.register_buyer,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.primary900, fontSize: 13.sp),
              ).tr(),
              onTap: ()=> navigateToRegistrationScreen(context),
            ),

            Space(
              height:3.h,
            ),
            MainButton(
              width: 86.w,
              height: 6.5.h,
              border: Border.all(color: AppTheme.primary900,width: 0.2.w),
              color: Colors.transparent,
              label: Text(
                LocaleKeys.register_tailor,
                style: AppTheme.mainTextStyle(
                    color: AppTheme.primary900, fontSize: 13.sp),
              ).tr(),
              onTap: ()=> navigateToRegistrationScreen(context),
            ),
          ],
        ),
      ),
    ));
  }
}

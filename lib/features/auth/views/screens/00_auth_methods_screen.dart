import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import '../components/auth_method_app_bar.dart';
import '/core/config/app_images.dart';
import '/core/views/widgets/space.dart';
import '/features/auth/views/screens/01_login_screen.dart';
import '/features/auth/views/screens/02_register_screen.dart';
import '/generated/locale_keys.g.dart';
import 'package:visibility_detector/visibility_detector.dart';

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

  void setupSystemNavigationBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  void disposeSystemNavigationBar() {
    AppTheme.initSystemNavAndStatusBar();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('uniqueKey1'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction == 0) {
          // Call your function here when the widget is not visible
          disposeSystemNavigationBar();
        } else {
          setupSystemNavigationBar();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            AuthMethodAppBar(),
            Space(
              height: 3.h,
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
                  Text(
                    LocaleKeys.auth_method_title,
                    textAlign: TextAlign.center,
                    style: AppTheme.mainTextStyle(
                      color: AppTheme.secondary900,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ).tr(),
                  Space(
                    height: 3.h,
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
      ),
    );
  }
}

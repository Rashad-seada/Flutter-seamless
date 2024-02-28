import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/features/auth/views/screens/01_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class AccountLogOutBotton extends StatelessWidget {
  const AccountLogOutBotton({super.key});

  void navigateToLoginScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToLoginScreen(context),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.neutral400,
          ),
          borderRadius: BorderRadius.circular(
            3.w,
          ),
        ),
        padding: EdgeInsets.all(1.5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log Out',
              style: AppTheme.mainTextStyle(
                fontWeight: FontWeight.bold,
                color: AppTheme.neutral400,
              ),
            ),
            SvgPicture.asset(
              AppImages.arrowRight,
              height: 2.5.h,
              width: 2.5.h,
              color: AppTheme.neutral400,
            ),
          ],
        ),
      ),
    );
  }
}

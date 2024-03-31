import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/utils/is_locale_arabic.dart';
import 'package:Mawthoq/features/main/bloc/main/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../wallet/views/pages/wallet_page.dart';

class ProfitsContainer extends StatelessWidget {
  String label;
  String? string;

  void navigateToWalletPage(BuildContext context) {
    Navigator.pop(
        context, MaterialPageRoute(builder: (_) => const WalletPage()));
  }

  ProfitsContainer({super.key, required this.label, this.string});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<MainCubit>().onNavItemTap(1);
        navigateToWalletPage(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          color: AppTheme.primary900,
          borderRadius: BorderRadius.circular(
            2.w,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    label,
                    style: AppTheme.mainTextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
              RotationTransition(
                turns: AlwaysStoppedAnimation(
                    isLocaleArabic(context) ? 360 / 180 : 180 / 360),
                child: SvgPicture.asset(
                  AppImages.arrow,
                  width: 6.w,
                  height: 6.w,
                  color: AppTheme.secondary900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/utils/is_locale_arabic.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/verification/views/blocs/verification_cubit.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';

class AccountVerificationCard extends StatelessWidget {
  const AccountVerificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        2.w,
      ),
      onTap: () => context
          .read<VerificationCubit>()
          .onAccountVerificationCardTap(context),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.5.w, horizontal: 2.5.w),
        decoration: BoxDecoration(
          color: AppTheme.primary900.withOpacity(0.1),
          borderRadius: BorderRadius.circular(
            2.w,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 2.w),
                decoration: BoxDecoration(
                  color: AppTheme.primary900,
                  borderRadius: BorderRadius.circular(
                    1.w,
                  ),
                ),
                child: SvgPicture.asset(
                  AppImages.profile,
                  width: 6.w,
                  height: 6.w,
                  color: AppTheme.secondary900,
                )),
            Space(
              width: 3.w,
            ),
            SizedBox(
              width: 60.w,
              child: Text(
                LocaleKeys.account_verification.tr(),
                style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral700,
                  fontSize: 9.sp,
                ),
              ),
            ),
            RotationTransition(
              turns: AlwaysStoppedAnimation(
                  isLocaleArabic(context) ? 360 / 180 : 180 / 360),
              child: SvgPicture.asset(
                AppImages.arrow,
                width: 6.w,
                height: 6.w,
                color: AppTheme.neutral900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

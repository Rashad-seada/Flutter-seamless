import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/utils/is_locale_arabic.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/utils/account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class SettingsCard extends StatelessWidget {
  SettingsModel model;
  SettingsCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: model.onTap,
      borderRadius: BorderRadius.circular(
        2.w,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            2.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  model.leadingIcon,
                  color: AppTheme.primary900,
                ),
                Space(
                  width: 2.w,
                ),
                Text(
                  model.leadingLabel,
                  style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  model.trailingLabel,
                  style: AppTheme.mainTextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Space(
                  width: 1.w,
                ),
                RotationTransition(
                  turns: AlwaysStoppedAnimation(
                      isLocaleArabic(context) ? 360 / 180 : 180 / 360),
                  child: SvgPicture.asset(
                    AppImages.arrow,
                    width: 2.5.h,
                    height: 2.5.h,
                    color: AppTheme.primary900,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

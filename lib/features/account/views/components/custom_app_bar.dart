import 'package:Mawthoq/core/utils/is_locale_arabic.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_network_image.dart';
import '../../../../core/views/widgets/space.dart';

class CustomAppBar extends StatelessWidget {
  String label;
  void Function()? onPressed;

  CustomAppBar({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          // borderRadius: BorderRadius.circular(100.w),
          onTap: () {
            Navigator.pop(context);
          },
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(
                isLocaleArabic(context) ? 180 / 360 : 360 / 180),
            child: SvgPicture.asset(
              AppImages.arrow,
              width: 6.w,
              height: 6.w,
              color: AppTheme.secondary900,
            ),
          ),
        ),
        Text(
          label,
          style: AppTheme.mainTextStyle(
            color: AppTheme.neutral700,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(
          width: 7.w,
        ),
      ],
    );
  }
}

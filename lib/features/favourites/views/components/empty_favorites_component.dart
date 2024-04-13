import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';

class EmptyFavoritesComponents extends StatelessWidget {
  const EmptyFavoritesComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Space(
            height: 6.h,
          ),
          Padding(
            padding: EdgeInsets.all(6.w),
            child: SvgPicture.asset(
              AppImages.heart,
              height: 10.w,
              width: 10.w,
              color: AppTheme.secondary900,
            ),
          ),
          Text(
            LocaleKeys.no_favourite_properties_yet,
            style: AppTheme.mainTextStyle(
              fontSize: 16.sp,
              color: AppTheme.secondary900,
              fontWeight: FontWeight.bold,
            ),
          ).tr(),
          Space(
            height: 1.h,
          ),
          Text(
            LocaleKeys.explore_properties_and_mark_favorites,
            style: AppTheme.mainTextStyle(
              fontSize: 12.sp,
              color: AppTheme.neutral400,
            ),
            textAlign: TextAlign.center,
          ).tr(),
        ],
      ),
    );
  }
}

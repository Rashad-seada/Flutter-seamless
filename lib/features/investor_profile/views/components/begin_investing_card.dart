import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/utils/is_locale_arabic.dart';
import '../../../../core/views/widgets/main_button.dart';

class BeginInvestingCard extends StatelessWidget {
  const BeginInvestingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Space(
            height: 1.8.h,
          ),
          Row(
            children: [
              Image.asset(
                  fit: BoxFit.cover,
                  width: 10.w,
                  height: 10.w,
                  AppImages.investment),
              Space(
                width: 5.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.begin_investing.tr(),
                    style: AppTheme.mainTextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppTheme.neutral900,
                        fontSize: 13.sp),
                  ),
                  Space(
                    height: 0.1.h,
                  ),
                  Text(
                    LocaleKeys.begin_investing_sub_text.tr(),
                    style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral400,
                      fontSize: 9.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
          Space(
            height: 2.5.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              point(
                  context: context,
                  text: LocaleKeys.begin_investing_step1.tr()),
              Space(
                height: 1.5.h,
              ),
              point(
                  context: context,
                  text: LocaleKeys.begin_investing_step2.tr()),
              Space(
                height: 1.5.h,
              ),
              point(
                  context: context,
                  text: LocaleKeys.begin_investing_step3.tr()),
            ],
          ),
          Space(
            height: 2.5.h,
          ),
          MainButton(
            borderRadius: BorderRadius.circular(2.w),
            height: 4.8.h,
            width: double.infinity,
            label: Text(
              LocaleKeys.explore_real_estate.tr(),
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral100, fontSize: 8.sp),
            ),
          ),
          Space(
            height: 2.h,
          ),
        ],
      ),
    );
  }

  Widget point({
    required String text,
    required BuildContext context
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RotationTransition(
          turns: AlwaysStoppedAnimation((isLocaleArabic(context))? 225 / 360 :  45/ 360),
          child: ClipPath(
            clipper: CustomTriangleClipper(),
            child: Container(
              width: 4.w,
              height: 4.w,
              decoration: BoxDecoration(color: AppTheme.primary900),
            ),
          ),
        ),
        Space(
          width: 1.5.h,
        ),
        Expanded(
          child: Text(
            text,
            style: AppTheme.mainTextStyle(
              color: AppTheme.neutral900,
              fontSize: 9.sp,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

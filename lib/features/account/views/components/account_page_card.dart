import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/utils/is_locale_arabic.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class AccountPageCard extends StatelessWidget {
  bool showArrow;
  void Function()? onTap;
  String title;
  String subTitle;

  AccountPageCard({
    super.key,
    this.showArrow = true,
    this.onTap,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(2.h),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              3.w,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  AppImages.account1,
                  height: 6.h,
                  width: 6.h,
                  color: AppTheme.primary900,
                ),
                Space(
                  width: 3.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTheme.mainTextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: AppTheme.mainTextStyle(
                        fontSize: 10.sp,
                        color: AppTheme.neutral400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (showArrow)
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
    );
  }
}

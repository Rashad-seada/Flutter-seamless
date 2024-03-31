import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/utils/is_locale_arabic.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class BlogCard extends StatelessWidget {
  String label;
  IconData icon;
  BlogCard({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                size: 7.w,
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
          Space(
            height: 2.h,
          ),
          Text(
            label,
            style: AppTheme.mainTextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

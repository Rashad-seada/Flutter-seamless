import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/components/toggle_button.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';

// ignore: must_be_immutable
class SettingsToggleCard extends StatelessWidget {
  String title;
  String? subTitle;
  String svgAsset;
  SettingsToggleCard(
      {super.key, required this.title, this.subTitle, required this.svgAsset});

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
        color: Colors.white,
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
              Row(
                children: [
                  SvgPicture.asset(
                    svgAsset,
                    height: 3.h,
                    width: 3.h,
                    color: AppTheme.primary900,
                  ),
                  Space(
                    width: 2.w,
                  ),
                  Text(
                    title,
                    style: AppTheme.mainTextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ToggleButton(),
            ],
          ),
          Space(
            height: 1.w,
          ),
          Text(
            subTitle!,
            style: AppTheme.mainTextStyle(
                color: AppTheme.neutral400, fontSize: 9.sp),
          ),
        ],
      ),
    );
  }
}

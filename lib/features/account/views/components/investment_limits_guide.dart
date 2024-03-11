import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class InvestmentLimitsGuide extends StatelessWidget {
  String question;
  String answer;
  String svgAsset;
  InvestmentLimitsGuide(
      {super.key,
      required this.question,
      required this.answer,
      required this.svgAsset});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          svgAsset,
          color: AppTheme.secondary900,
        ),
        Space(
          width: 2.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                maxLines: 2,
                question,
                style: AppTheme.mainTextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                ),
              ),
              Text(
                answer,
                style: AppTheme.mainTextStyle(
                  fontSize: 11.sp,
                ),
                maxLines: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

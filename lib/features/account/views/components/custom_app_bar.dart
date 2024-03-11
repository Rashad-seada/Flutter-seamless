import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_network_image.dart';
import '../../../../core/views/widgets/space.dart';

class CustomAppBar extends StatelessWidget {
  String label;
  void Function()? onPressed;


  CustomAppBar({super.key,required this.label,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        InkWell(
            borderRadius: BorderRadius.circular(100.w),
            onTap: () {
              Navigator.pop(context);
            },
            child:SvgPicture.asset(AppImages.arrow,
              width: 6.w,
              height: 6.w,
              color: AppTheme.neutral400,
            ),
        ),

        Text(
          label,
          style: AppTheme.mainTextStyle(
            color: AppTheme.neutral700,
            fontSize: 14.sp,
          ),
        ),

        SizedBox(
          width: 7.w,
        )



      ],
    );
  }
}

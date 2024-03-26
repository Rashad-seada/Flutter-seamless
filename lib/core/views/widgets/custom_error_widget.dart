import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../generated/locale_keys.g.dart';
import '../../config/app_images.dart';
import '../../config/app_theme.dart';
import 'main_button.dart';

class CustomErrorWidget extends StatelessWidget {
  String errorMessage;
  void Function()? onTap;

  CustomErrorWidget({super.key,required this.errorMessage, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Space(height: 2.5.h,),

        SvgPicture.asset(
            width: 30.w,
            height: 30.w,
            AppImages.error
        ),

        Space(height: 2.5.h,),

        SizedBox(
          width: 50.w,
          child: Text(
            textAlign: TextAlign.center,
            errorMessage,
            style: AppTheme.mainTextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w700
            ),
          ),
        ),

        Space(height: 5.h,),

        MainButton(
          color: AppTheme.primary900,
          width: 50.w,
          height: 6.h,
          label: Text(
            "Try again",
            style: AppTheme.mainTextStyle(
                color: AppTheme.secondary900, fontSize: 10.sp),
          ).tr(),
          onTap: onTap,
        )


      ],
    );
  }
}

import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/utils/is_locale_arabic.dart';
import 'package:Mawthoq/core/views/widgets/space.dart';
import 'package:Mawthoq/features/account/views/utils/account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class AccountPageContainer extends StatelessWidget {
  List<AccountContainerModel> info;
  Color? iconColor;

  AccountPageContainer({
    super.key,
    this.info = const [],
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 4.w),
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
          3.w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          info.length,
          (index) => InkWell(
            onTap: info[index].onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0.7.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (info[index].icon != null)
                        SvgPicture.asset(
                          info[index].icon!,
                          height: 2.5.h,
                          width: 2.5.h,
                          color: iconColor ?? AppTheme.primary900,
                        ),
                      Space(
                        width: 3.w,
                      ),
                      Text(info[index].label,
                          style: AppTheme.mainTextStyle(
                            fontSize: 10.sp,
                            color: AppTheme.neutral900,
                            fontWeight: FontWeight.w700,
                          )),
                    ],
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
            ),
          ),
        ),
      ),
    );
  }
}

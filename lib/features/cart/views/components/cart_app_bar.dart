import 'package:Mawthoq/core/utils/is_locale_arabic.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/space.dart';
import '../bloc/cart/cart_cubit.dart';

class CartAppBar extends StatelessWidget {
  void Function()? onPressed;

  CartAppBar({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            // borderRadius: BorderRadius.circular(100.w),
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(2.w),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: AppTheme.neutral100, shape: BoxShape.circle),
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
            )),
        Space(
          width: 3.w,
        ),
        SvgPicture.asset(
          AppImages.cart,
          width: 8.w,
          height: 8.w,
          color: AppTheme.secondary900,
        ),
        Space(
          width: 3.w,
        ),
        Text(
          LocaleKeys.investing_cart.tr(),
          style: AppTheme.mainTextStyle(
            color: AppTheme.neutral700,
            fontSize: 14.sp,
          ),
        ),
        Space(
          width: 1.5.w,
        ),
        Text(
          "( ${context.read<CartCubit>().cartItemsCount.value} )",
          style: AppTheme.mainTextStyle(
            color: AppTheme.neutral700,
            fontWeight: FontWeight.w700,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }
}

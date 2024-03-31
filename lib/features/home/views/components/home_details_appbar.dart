import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/utils/is_locale_arabic.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../cart/views/bloc/cart/cart_cubit.dart';
import '../bloc/home/home_cubit.dart';

class HomeDetailsAppbar extends StatelessWidget {
  bool isTrasperant;

  HomeDetailsAppbar({super.key, this.isTrasperant = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: isTrasperant ? Colors.transparent : AppTheme.neutral100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => context.read<HomeCubit>().onFavoriteTap(context),
                child: SvgPicture.asset(
                    width: 6.5.w, height: 6.5.w, AppImages.heart),
              ),
              Space(
                width: 2.w,
              ),
              InkWell(
                onTap: () => context.read<HomeCubit>().onCartTap(context),
                child: SvgPicture.asset(
                  width: 6.5.w,
                  height: 6.5.w,
                  AppImages.cart,
                  color: AppTheme.secondary900
                ),
              ),
            ],
          ),
          InkWell(
            borderRadius: BorderRadius.circular(100.w),
            onTap: () {
              Navigator.pop(context);
            },
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(
                  isLocaleArabic(context) ? 180 / 360 : 360 / 180),
              child: SvgPicture.asset(
                AppImages.arrowRight,
                width: 6.w,
                height: 6.w,
                color: AppTheme.secondary900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

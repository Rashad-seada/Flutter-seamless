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
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      decoration: BoxDecoration(
        color: isTrasperant ? Colors.transparent : AppTheme.neutral100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [

              ListenableBuilder(listenable: context.read<CartCubit>().cartItemsCount,
                  builder: (context,widget){

                    return InkWell(
                      onTap: () => context.read<HomeCubit>().onCartTap(context),
                      child: SvgPicture.asset(
                        width: 7.w,
                        height: 7.w,
                        AppImages.cart,
                        color: (context.read<CartCubit>().cartItemsCount.value == 0)? AppTheme.secondary900 : AppTheme.primary900,
                      ),
                    );

                  }),



              Space(width: 1.w,),

              ListenableBuilder(listenable: context.read<CartCubit>().cartItemsCount,
                  builder: (context,widget){

                    if(context.read<CartCubit>().cartItemsCount.value == 0){
                      return SizedBox();
                    }else {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 0.4),
                        decoration: BoxDecoration(
                            color: AppTheme.primary900,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Text(
                          "( ${context.read<CartCubit>().cartItemsCount.value.toString()} )",
                          style: AppTheme.mainTextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      );
                    }



                  }),
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

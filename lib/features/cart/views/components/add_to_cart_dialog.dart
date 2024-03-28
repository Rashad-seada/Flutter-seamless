import 'package:Mawthoq/core/config/app_consts.dart';
import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:Mawthoq/core/views/widgets/custom_progress_indicator.dart';
import 'package:Mawthoq/features/cart/views/bloc/cart/cart_cubit.dart';
import 'package:Mawthoq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/views/widgets/custom_network_image.dart';
import '../../../../core/views/widgets/custom_text_field.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';

class AddToCartDialog extends StatelessWidget {
  String label;
  String image;
  int propertyId;
  AddToCartDialog({super.key,required this.label,required this.image,required this.propertyId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.backgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(LocaleKeys.add_to_cart).tr(),

          InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.close)),

        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.w),
                  color: AppTheme.neutral300,
                ),
                clipBehavior: Clip.hardEdge,
                child: CustomNetworkImage(
                  fit: BoxFit.cover,
                  url:
                  AppConsts.imageUrl+image,
                  width: 20.w,
                  height: 6.h,
                ),
              ),
              Space(width: 3.w,),

              SizedBox(
                width: 42.w,
                child: Text(
                  label,
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral700,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

            ],
          ),
          Space(
            height: 2.h,
          ),
          Form(
            key: context.read<CartCubit>().formKey,
            child: CustomTextField(
              controller: context.read<CartCubit>().amountController,
              validator: (_)=> context.read<CartCubit>().validateAmount(),

              prefixIcon: Padding(
                padding: EdgeInsets.all(3.w),
                child: SvgPicture.asset(
                  AppImages.coin,
                  width: 3.w,
                  height: 3.h,
                ),

              ),
              hint: LocaleKeys.investment_value.tr(),
              keyboardType: TextInputType.number,
            ),
          ),

        ],
      ),
      actions: [

        BlocConsumer<CartCubit,CartState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return MainButton(
                  color: AppTheme.primary900,
                  width: 25.w,
                  height: 4.h,
                  label: (state is CartIsLoading)? CustomProgressIndicator(color: AppTheme.secondary900,) :Text(
                    LocaleKeys.confirm,
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.secondary900, fontSize: 10.sp),
                  ).tr(),
                  onTap: ()=> context.read<CartCubit>().onConfirmTap(context,propertyId),
                );
          },
        )

      ],
    );

  }
}

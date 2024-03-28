import 'package:Mawthoq/core/config/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_circle_avatar.dart';
import '../../../../core/views/widgets/custom_text_field.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../account/views/components/custom_app_bar.dart';


class YourAddressScreen extends StatelessWidget {
  const YourAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        shrinkWrap: true,
        children: [

          Space(
            height: 2.h,
          ),

          CustomAppBar(label: LocaleKeys.your_address.tr()),

          Space(
            height: 5.h,
          ),



          Text(
            LocaleKeys.your_address_text,
            style: AppTheme.mainTextStyle(
              fontSize: 15.sp,
              color: AppTheme.secondary900,
            ),
          ).tr(),

          Space(
            height: 1.5.h,
          ),
          Text(
            LocaleKeys.your_address_sub_text,
            style: AppTheme.mainTextStyle(
              fontSize: 11.sp,
              color: AppTheme.neutral400,
            ),
          ).tr(),

          Space(
            height: 2.h,
          ),

      Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 8.w),
        margin: EdgeInsets.only(bottom: 3.h),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.5.w),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white),
        child: Column(
          children: [
            CustomTextField(
              // controller: context.read<LoginCubit>().emailController,
              // validator: (_)=> context.read<LoginCubit>().validateEmail(),
              fillColor: Colors.transparent,
              label: LocaleKeys.country.tr(),

              // ),
            ),
            Space(
              height: 2.h,
            ),

            CustomTextField(
              // controller: context.read<LoginCubit>().emailController,
              // validator: (_)=> context.read<LoginCubit>().validateEmail(),
              fillColor: Colors.transparent,
              label: LocaleKeys.city.tr(),
            ),
            Space(
              height: 2.h,
            ),
            CustomTextField(
              // controller: context.read<LoginCubit>().emailController,
              // validator: (_)=> context.read<LoginCubit>().validateEmail(),
              fillColor: Colors.transparent,
              label: LocaleKeys.address_line_1.tr(),
              // ),
            ),
            Space(
              height: 2.h,
            ),
            CustomTextField(
              // controller: context.read<LoginCubit>().emailController,
              // validator: (_)=> context.read<LoginCubit>().validateEmail(),
              label: LocaleKeys.address_line_2.tr(),
              fillColor: Colors.transparent,
            ),
          ],
        ),
      ),


          MainButton(
            color: AppTheme.primary900,
            width: 86.w,
            height: 6.h,
            label: Text(
              LocaleKeys.next,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.secondary900, fontSize: 12.sp),
            ).tr(),
            //onTap: ()=> context.read<LoginCubit>().onLoginClick(context),
          ),

        ],
      ),
    ));
  }
}

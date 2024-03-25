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


class YourJobScreen extends StatelessWidget {
  const YourJobScreen({super.key});

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

          CustomAppBar(label: LocaleKeys.your_job.tr()),

          Space(
            height: 5.h,
          ),

          CustomCircleAvatar(
            assetName: AppImages.job,
          ),

          Space(
            height: 4.h,
          ),

          Text(
            LocaleKeys.your_job_text,
            style: AppTheme.mainTextStyle(
              fontSize: 15.sp,
              color: AppTheme.secondary900,
            ),
          ).tr(),

          Space(
            height: 1.5.h,
          ),
          Text(
            LocaleKeys.your_job_sub_text,
            style: AppTheme.mainTextStyle(
              fontSize: 11.sp,
              color: AppTheme.neutral500,
            ),
          ).tr(),

          Space(
            height: 4.h,
          ),

          CustomTextField(
            // controller: context.read<LoginCubit>().emailController,
            // validator: (_)=> context.read<LoginCubit>().validateEmail(),


            label: LocaleKeys.your_job_q1.tr(),

            // ),
          ),
          Space(
            height: 2.h,
          ),

          CustomTextField(
            // controller: context.read<LoginCubit>().emailController,
            // validator: (_)=> context.read<LoginCubit>().validateEmail(),

            label: LocaleKeys.your_job_q2.tr(),
          ),
          Space(
            height: 4.h,
          ),

          MainButton(
            color: AppTheme.secondary900,
            width: 86.w,
            height: 6.h,
            label: Text(
              LocaleKeys.next,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral100, fontSize: 12.sp),
            ).tr(),
            //onTap: ()=> context.read<LoginCubit>().onLoginClick(context),
          ),

        ],
      ),
    ));
  }
}

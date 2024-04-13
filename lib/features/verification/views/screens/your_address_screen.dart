import 'package:Mawthoq/core/config/app_images.dart';
import 'package:Mawthoq/features/verification/views/components/verfication_steps_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_circle_avatar.dart';
import '../../../../core/views/widgets/custom_drop_down.dart';
import '../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../core/views/widgets/custom_text_field.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../account/views/components/custom_app_bar.dart';
import '../blocs/verification_cubit.dart';

class YourAddressScreen extends StatelessWidget {
  const YourAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        shrinkWrap: true,
        children: [
          Space(
            height: 2.h,
          ),
          CustomAppBar(label: ''),
          Space(
            height: 3.h,
          ),
          Text(
            LocaleKeys.your_address_text,
            style: AppTheme.mainTextStyle(
                fontSize: 18.sp,
                color: AppTheme.secondary900,
                fontWeight: FontWeight.w600),
          ).tr(),
          Space(
            height: 1.h,
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
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.w),
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
            child: Form(
              key: context.read<VerificationCubit>().yourLocationFormKey,

              child: Column(
                children: [


                  BlocBuilder<VerificationCubit, VerificationState>(
                    builder: (context, state) {
                      return CustomDropDown(
                                    width : 86.w,
                                    menuItems: context.read<VerificationCubit>().countryList,
                                    selectedItem: context.read<VerificationCubit>().country,
                                    onChanged : (value) => context.read<VerificationCubit>().onCountryChange(value),
                                    hint: LocaleKeys.country.tr(),
                                  );
                    },
                  ),

                  Space(
                    height: 2.h,
                  ),
                  CustomTextField(
                    controller: context.read<VerificationCubit>().cityController,
                    validator: (_)=> context.read<VerificationCubit>().validateTextField(_!),
                    fillColor: Colors.transparent,
                    label: LocaleKeys.city.tr(),
                  ),
                  Space(
                    height: 2.h,
                  ),
                  CustomTextField(
                    controller: context.read<VerificationCubit>().areaController,
                    validator: (_)=> context.read<VerificationCubit>().validateTextField(_!),
                    fillColor: Colors.transparent,
                    label: LocaleKeys.address_line_1.tr(),
                    // ),
                  ),
                  Space(
                    height: 2.h,
                  ),
                  CustomTextField(
                    controller: context.read<VerificationCubit>().streetAddressController,
                    validator: (_)=> context.read<VerificationCubit>().validateTextField(_!),
                    label: LocaleKeys.address_line_2.tr(),
                    fillColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          BlocConsumer<VerificationCubit,VerificationState>(
            listener: (context, state) {},
            builder: (context, state) {
              return MainButton(
                color: AppTheme.primary900,
                width: 86.w,
                height: 6.h,
                label: (state is VerificationIsLoading)? CustomProgressIndicator(
                  color: AppTheme.neutral100,
                ) : Text(
                  LocaleKeys.next,
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.secondary900, fontSize: 12.sp),
                ).tr(),
                onTap: ()=> context.read<VerificationCubit>().step5(context),
              );
            },
          ),

        ],
      ),
    ));
  }
}

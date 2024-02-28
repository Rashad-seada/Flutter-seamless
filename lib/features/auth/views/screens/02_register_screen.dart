import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/views/widgets/wave_container.dart';
import '/features/auth/views/blocs/register/register_cubit.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_back_button.dart';
import '../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../core/views/widgets/custom_text_field.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void didChangeDependencies() {
    context.read<RegisterCubit>().formKey.currentState?.dispose();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          WaveContainer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: ListView(
              children: [
                Space(
                  height: 3.h,
                ),
                CustomBackButton(
                  title: LocaleKeys.register_description.tr(),
                ),
                Space(
                  height: 4.h,
                ),
                Form(
                    key: context.read<RegisterCubit>().formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.username,
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.neutral400, fontSize: 12.sp),
                        ).tr(),
                        Space(
                          height: 0.5.h,
                        ),
                        CustomTextField(
                          controller:
                              context.read<RegisterCubit>().usernameController,
                          validator: (_) =>
                              context.read<RegisterCubit>().validateUsername(),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(3.w),
                            child: SvgPicture.asset(
                              AppImages.profile,
                              width: 3.w,
                              height: 3.h,
                            ),
                          ),
                          hint: LocaleKeys.username_hint.tr(),
                        ),
                        Space(
                          height: 1.h,
                        ),
                        Text(
                          LocaleKeys.email,
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.neutral400, fontSize: 12.sp),
                        ).tr(),
                        Space(
                          height: 0.5.h,
                        ),
                        CustomTextField(
                          controller:
                              context.read<RegisterCubit>().emailController,
                          validator: (_) =>
                              context.read<RegisterCubit>().validateEmail(),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(3.w),
                            child: SvgPicture.asset(
                              AppImages.email,
                              width: 3.w,
                              height: 3.h,
                            ),
                          ),
                          hint: LocaleKeys.email_hint.tr(),
                        ),
                        Space(
                          height: 1.h,
                        ),
                        Text(
                          LocaleKeys.password,
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.neutral400, fontSize: 12.sp),
                        ).tr(),
                        Space(
                          height: 0.5.h,
                        ),
                        CustomTextField(
                          controller:
                              context.read<RegisterCubit>().passwordController,
                          validator: (_) =>
                              context.read<RegisterCubit>().validatePassword(),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(3.w),
                            child: SvgPicture.asset(
                              AppImages.password,
                              width: 3.w,
                              height: 3.h,
                            ),
                          ),
                          hint: LocaleKeys.password_hint.tr(),
                          isSecure: true,
                        ),
                      ],
                    )),
                Space(
                  height: 6.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.already_have_account.tr(),
                      style: AppTheme.mainTextStyle(
                          color: AppTheme.neutral400, fontSize: 12.sp),
                    ).tr(),
                    Space(
                      width: 2.w,
                    ),
                    InkWell(
                      onTap: () =>
                          context.read<RegisterCubit>().onLoginClick(context),
                      child: Text(
                        LocaleKeys.login.tr(),
                        style: AppTheme.mainTextStyle(
                            color: AppTheme.primary900, fontSize: 12.sp),
                      ).tr(),
                    ),
                  ],
                ),
                Space(
                  height: 2.h,
                ),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return MainButton(
                      width: 86.w,
                      height: 6.5.h,
                      color: AppTheme.primary900,
                      label: (state is RegisterLoading)
                          ? CustomProgressIndicator(
                              color: AppTheme.neutral100,
                            )
                          : Text(
                              LocaleKeys.register,
                              style: AppTheme.mainTextStyle(
                                  color: AppTheme.neutral100, fontSize: 14.sp),
                            ).tr(),
                      onTap: () => context
                          .read<RegisterCubit>()
                          .onRegisterClick(context),
                    );
                  },
                ),
                Space(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

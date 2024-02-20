import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/views/widgets/wave_container.dart';
import '/core/views/widgets/custom_checkbox.dart';
import '/core/views/widgets/custom_progress_indicator.dart';
import '/core/views/widgets/custom_text_field.dart';
import '/features/auth/views/blocs/login/login_cubit.dart';

import '../../../../core/config/app_images.dart';
import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_back_button.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  void didChangeDependencies() {
    context.read<LoginCubit>().formKey.currentState?.dispose();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

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
                  title: LocaleKeys.login_description.tr(),
                ),

                Space(
                  height: 4.h,
                ),

                Form(
                  key: context.read<LoginCubit>().formKey,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      LocaleKeys.email,
                      style: AppTheme.mainTextStyle(
                          color: AppTheme.neutral400, fontSize: 12.sp),
                    ).tr(),
                    Space(
                      height: 0.5.h,
                    ),


                    CustomTextField(
                      controller: context.read<LoginCubit>().emailController,
                      validator: (_)=> context.read<LoginCubit>().validateEmail(),

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
                      controller: context.read<LoginCubit>().passwordController,
                      validator: (_)=> context.read<LoginCubit>().validatePassword(),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(3.w),
                        child: SvgPicture.asset(
                          AppImages.password,
                          width: 3.w,
                          height: 3.h,
                        ),

                      ),
                      hint: LocaleKeys.password_hint.tr(),
                      isSecure: true
                    ),
                  ],
                )),


                Space(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    CustomCheckBox(
                        value: context.read<LoginCubit>().rememberMe,
                        onChanged: (value){
                          context.read<LoginCubit>().rememberMe = value!;
                        },
                      label: LocaleKeys.remember_me.tr(),
                    ),

                    InkWell(
                      onTap: () => context.read<LoginCubit>().onForgotPasswordClick(context) ,
                      child: Text(
                        LocaleKeys.forgot_password.tr(),
                        style: AppTheme.mainTextStyle(
                            color: AppTheme.primary900, fontSize: 12.sp),
                      ).tr(),
                    ),
                  ],
                ),

                Space(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Text(
                      LocaleKeys.dont_have_account.tr(),
                      style: AppTheme.mainTextStyle(
                          color: AppTheme.neutral400, fontSize: 12.sp),
                    ).tr(),
                    Space(
                      width: 2.w,
                    ),
                    InkWell(
                      onTap: () => context.read<LoginCubit>().onRegisterClick(context),
                      child: Text(
                        LocaleKeys.register.tr(),
                        style: AppTheme.mainTextStyle(
                            color: AppTheme.primary900, fontSize: 12.sp),
                      ).tr(),
                    ),
                  ],
                ),

                Space(
                  height: 2.h,
                ),

                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return MainButton(
                              color: AppTheme.primary900,
                              width: 86.w,
                              height: 6.5.h,
                              label: (state is LoginLoading)? CustomProgressIndicator(
                                color: AppTheme.neutral100,
                              ) : Text(
                                LocaleKeys.login,
                                style: AppTheme.mainTextStyle(
                                    color: AppTheme.secondary900, fontSize: 13.sp),
                              ).tr(),
                              onTap: ()=> context.read<LoginCubit>().onLoginClick(context),
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

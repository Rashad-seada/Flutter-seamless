import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '/features/auth/views/blocs/otp/otp_cubit.dart';
import '/features/auth/views/widgets/pin_text_field.dart';

import '../../../../core/config/app_theme.dart';
import '../../../../core/views/widgets/custom_back_button.dart';
import '../../../../core/views/widgets/custom_progress_indicator.dart';
import '../../../../core/views/widgets/main_button.dart';
import '../../../../core/views/widgets/space.dart';
import '../../../../generated/locale_keys.g.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  String phoneNumber;

  OtpScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: ListView(
          shrinkWrap: true,
          children: [
            Space(
              height: 2.h,
            ),
            CustomBackButton(),
            Space(
              height: 4.h,
            ),
            Text(
              LocaleKeys.confirm_code,
              style: AppTheme.mainTextStyle(
                color: AppTheme.neutral900,
                fontSize: 25.sp,
              ),
            ).tr(),
            Space(
              height: 2.h,
            ),
            Text(
              LocaleKeys.confirm_code_sub_text,
              style: AppTheme.mainTextStyle(
                  color: AppTheme.neutral900, fontSize: 12.sp),
            ).tr(),
            Space(
              height: 3.h,
            ),
            Form(
              key: context.read<OtpCubit>().formKey,
              child: PinTextField(
                onChange: context.read<OtpCubit>().onPinChange,
                validator: (_) => context.read<OtpCubit>().validatePin(),
                onCompleted: (pin) =>
                    context.read<OtpCubit>().onConfirmClick(context),
              ),
            ),
            Space(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.didnt_recive_code.tr(),
                  style: AppTheme.mainTextStyle(
                      color: AppTheme.neutral400, fontSize: 12.sp),
                ).tr(),
                Space(
                  width: 2.w,
                ),
                InkWell(
                  onTap: () => context
                      .read<OtpCubit>()
                      .onResendClick(context, phoneNumber),
                  child: Text(
                    LocaleKeys.resend.tr(),
                    style: AppTheme.mainTextStyle(
                        color: AppTheme.primary900, fontSize: 12.sp),
                  ).tr(),
                ),
              ],
            ),
            Space(
              height: 25.h,
            ),
            BlocConsumer<OtpCubit, OtpState>(
              listener: (context, state) {},
              builder: (context, state) {
                return MainButton(
                  color: AppTheme.primary900,
                  width: 86.w,
                  height: 6.5.h,
                  label: (state is OtpLoading)
                      ? CustomProgressIndicator(
                          color: AppTheme.neutral100,
                        )
                      : Text(
                          LocaleKeys.confirm,
                          style: AppTheme.mainTextStyle(
                              color: AppTheme.neutral100, fontSize: 13.sp),
                        ).tr(),
                  onTap: () => context.read<OtpCubit>().onConfirmClick(context),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}

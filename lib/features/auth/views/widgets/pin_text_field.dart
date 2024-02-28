import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';
import '/core/config/app_theme.dart';

// ignore: must_be_immutable
class PinTextField extends StatelessWidget {
  void Function(String)? onCompleted;
  void Function(String)? onChange;
  String? Function(String?)? validator;

  PinTextField({super.key, this.onCompleted, this.onChange, this.validator});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 20.w,
      height: 6.h,
      textStyle:
          AppTheme.mainTextStyle(color: AppTheme.neutral900, fontSize: 18.sp),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.neutral300),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppTheme.neutral500),
      borderRadius: BorderRadius.circular(15),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      validator: validator,
      submittedPinTheme: submittedPinTheme,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: onCompleted,
      onChanged: onChange,
    );
  }
}

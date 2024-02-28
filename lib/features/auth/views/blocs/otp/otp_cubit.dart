import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  String pinCode = "";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validatePin() {
    if (pinCode.isEmpty) {
      return "Enter the pin code";
    } else if (pinCode.length != 6) {
      return "Complete the pin code";
    } else {
      return null;
    }
  }

  onPinChange(String pin) {
    pinCode = pin;
  }

  onConfirmClick(BuildContext context) {
    if (formKey.currentState!.validate()) {
      confirmOtp(context, pinCode);
    }
  }

  onResendClick(BuildContext context, String phoneNumber) {
    sendOtp(context, phoneNumber);
  }

  sendOtp(BuildContext context, String phoneNumber) {}

  confirmOtp(BuildContext context, String otp) {}
}

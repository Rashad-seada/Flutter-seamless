import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../../../core/usecases/validate_email_use_case.dart';
import '/core/usecases/validate_username_use_case.dart';
import '/features/auth/domain/usecases/register_use_case.dart';
import '/features/auth/views/screens/00_auth_methods_screen.dart';
import '/features/auth/views/screens/01_login_screen.dart';
import '/features/auth/views/screens/05_message_screen.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecases/validate_password_use_case.dart';
import '../../../../../core/views/widgets/custom_flush_bar.dart';
import '../../../../../generated/locale_keys.g.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validateUsername() {
    return getIt<ValidateUsernameUseCase>().call(usernameController.text);
  }

  String? validateEmail() {
    return getIt<ValidateEmailUseCase>().call(emailController.text);
  }

  String? validatePassword() {
    return getIt<ValidatePasswordUseCase>().call(passwordController.text);
  }

  onRegisterClick(BuildContext context) {
    if (formKey.currentState!.validate()) {
      register(context);
    }
  }

  onLoginClick(BuildContext context) {
    navigateToLoginScreen(context);
  }

  onDoneClick(BuildContext context) {
    navigateToAuthMethodsScreen(context);
  }

  register(BuildContext context) {
    emit(RegisterLoading());
    getIt<RegisterUseCase>()
        .call(usernameController.text, emailController.text,
            passwordController.text)
        .then((value) => value.fold((error) {
              emit(RegisterError(error));
              showFlushBar(context,
                  title: "Error ${error.failureCode}", message: error.message);
              emit(RegisterInitial());
            }, (success) {
              emit(RegisterSuccess());
              navigateToRegisterMessageScreen(context);
              emit(RegisterInitial());
            }));
  }

  navigateToLoginScreen(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  navigateToRegisterMessageScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => MessageScreen(
                  title: LocaleKeys.all_done.tr(),
                  description: LocaleKeys.all_done_description.tr(),
                )));
  }

  navigateToAuthMethodsScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const AuthMethodsScreen()),
        (route) => false);
  }
}

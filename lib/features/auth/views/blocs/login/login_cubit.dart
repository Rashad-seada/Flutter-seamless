import 'package:Mawthoq/core/usecases/validate_email_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../../main/views/main_screen.dart';
import '/core/di/app_module.dart';
import '/core/errors/failure.dart';
import '/core/usecases/validate_password_use_case.dart';
import '/features/auth/domain/usecases/login_use_case.dart';
import '/features/auth/views/screens/02_register_screen.dart';
import '/features/auth/views/screens/03_reset_password_screen.dart';

import '../../../../../core/views/widgets/custom_flush_bar.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  String? validateEmail(){
    return getIt<ValidateEmailUseCase>().call(emailController.text);
  }

  String? validatePassword(){
    return getIt<ValidatePasswordUseCase>().call(passwordController.text);
  }

  onForgotPasswordClick(BuildContext context){
    navigateToResetPasswordScreen(context);
  }

  onLoginClick(BuildContext context){
    if(formKey.currentState!.validate()) {
      login(context);
    }
  }

  onRegisterClick(BuildContext context){
    navigateToRegisterScreen(context);
  }

  login(BuildContext context){
    emit(LoginLoading());
    getIt<LoginUseCase>().call(emailController.text, passwordController.text).then(
      (value) => value.fold(
        (error) {
          emit(LoginError(error));
          showFlushBar(
            context,
            title: "Error ${error.failureCode}",
            message : error.message
          );
          emit(LoginInitial());
        },
        (user) {
          emit(LoginSuccess());
          navigateToMainScreen(context);
          emit(LoginInitial());
        }
      )
    );
  }

  navigateToRegisterScreen(BuildContext context){
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> const RegisterScreen()));
  }

  navigateToMainScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> const MainScreen()));
  }

  navigateToResetPasswordScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> const ResetPasswordScreen()));
  }

}

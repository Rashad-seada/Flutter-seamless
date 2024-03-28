import 'package:Mawthoq/core/di/app_module.dart';
import 'package:Mawthoq/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:Mawthoq/features/main/views/main_screen.dart';
import 'package:Mawthoq/features/onboarding/view/screens/00_on_boarding_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/views/widgets/custom_flush_bar.dart';

part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroInitial());

  getUser(BuildContext context){
    getIt<GetUserUseCase>().call().then(
      (value) => value.fold(
        (error) {
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
        },
        (success) {
          if(success != null) {
            _navigateToHomeScreen(context);
          } else {
            _navigateToOnBoardingScreen(context);

          }

        }
      )
    );
  }

  _navigateToOnBoardingScreen(BuildContext context){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> OnBoardingScreen()), (route) => false);
  }

  _navigateToHomeScreen(BuildContext context){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> MainScreen()), (route) => false);
  }

}

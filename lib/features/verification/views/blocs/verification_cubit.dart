import 'package:Mawthoq/features/verification/views/screens/investment_plan_screen.dart';
import 'package:Mawthoq/features/verification/views/screens/your_address_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';

import '../screens/06_verfication_steps_screen.dart';
import '../screens/investment_plan_screen.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());

  int investmentPlan = 5000;

  onSliderChange(double newValue) {
    emit(VerificationSliderChange());
    investmentPlan = newValue.toInt();
    emit(VerificationInitial());
  }

  onAccountVerificationCardTap(BuildContext context) {
    navigateToVerificationStepsScreen(context);
  }

  navigateToVerificationStepsScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => VerficationScreen()));
  }

  onStep2Tap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => InvestmentPlanScreen()));
  }

  onStep3Tap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => YourAddressScreen()));
  }
}

import 'package:regexpattern/regexpattern.dart';

class ValidateAmountUseCase {

  String? call(String text){
    if(text.trim().isEmpty){
      return "Please enter your investment value";
    } else if(double.tryParse(text) == null) {
      return "Please enter only numbers";
    } else {
      return null;
    }
  }

}
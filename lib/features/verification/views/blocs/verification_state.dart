part of 'verification_cubit.dart';

@immutable
abstract class VerificationState {}

class VerificationInitial extends VerificationState {}

class VerificationSliderChange extends VerificationState {}

class VerificationDropDownChange extends VerificationState {}

class VerificationSuccess extends VerificationState {}

class VerificationError extends VerificationState {
  static Failure failure = Failure("", failureCode: -1);

  VerificationError(Failure failure){
    VerificationError.failure = failure;
  }
}

class VerificationIsLoading extends VerificationState {}

class VerificationIsPageLoading extends VerificationState {}

class VerificationImagePicked extends VerificationState {}

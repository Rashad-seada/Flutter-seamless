part of 'home_details_cubit.dart';

@immutable
abstract class HomeDetailsState {}

class HomeDetailsInitial extends HomeDetailsState {}

class HomeDetailsPageChanges extends HomeDetailsState {}

class HomeDetailsSuccess extends HomeDetailsState {
  static PropertyEntity? propertyEntity;

  HomeDetailsSuccess(PropertyEntity? propertyEntity){
    HomeDetailsSuccess.propertyEntity = propertyEntity;
  }

}

class HomeDetailsError extends HomeDetailsState {
  static Failure failure = Failure("", failureCode: 0);

  HomeDetailsError(Failure failure){
    HomeDetailsError.failure = failure;
  }
}

class HomeDetailsIsLoading extends HomeDetailsState {

}

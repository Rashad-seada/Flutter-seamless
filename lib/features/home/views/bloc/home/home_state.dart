part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeTabChange extends HomeState {}

class HomeSuccess extends HomeState {
  static List<PropertyEntity> properties = [];

  HomeSuccess(List<PropertyEntity> properties){
    HomeSuccess.properties = properties;
  }

}

class HomeError extends HomeState {
  static Failure? failure;

  HomeError(Failure failure){
    HomeError.failure = failure;
  }

}

class HomeIsLoading extends HomeState {}

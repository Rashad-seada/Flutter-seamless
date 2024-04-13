part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesSuccess extends FavoritesState {
  static GetFavoriteResponse? getFavoriteResponse;
  static ModifyFavoriteResponse? modifyFavoriteResponse;

  FavoritesSuccess({GetFavoriteResponse? getFavoriteResponse,ModifyFavoriteResponse? modifyFavoriteResponse}){
    if(getFavoriteResponse != null){
      FavoritesSuccess.getFavoriteResponse = getFavoriteResponse;
    }

    if(modifyFavoriteResponse != null){
      FavoritesSuccess.modifyFavoriteResponse = modifyFavoriteResponse;
    }
  }
}

class FavoritesError extends FavoritesState {
  static Failure failure = Failure("", failureCode: 0);

  FavoritesError(Failure failure){
    FavoritesError.failure = failure;
  }
}

class FavoritesIsLoading extends FavoritesState {}

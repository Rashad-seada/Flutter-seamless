import 'package:Mawthoq/core/di/app_module.dart';
import 'package:Mawthoq/core/errors/failure.dart';
import 'package:Mawthoq/features/favourites/domain/usecases/add_to_favorites_use_case.dart';
import 'package:Mawthoq/features/favourites/domain/usecases/get_favorites_use_case.dart';
import 'package:Mawthoq/features/favourites/domain/usecases/remove_from_favorites_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../core/views/widgets/custom_flush_bar.dart';
import '../../data/entities/get_favorite_response.dart';
import '../../data/entities/modify_favorite_response.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  getFavorites(){
    emit(FavoritesIsLoading());
    getIt<GetFavoritesUseCase>().call().then((value) => value.fold(
      (error) {
        emit(FavoritesError(error));

      },
      (favorites) {
        emit(FavoritesSuccess(getFavoriteResponse: favorites));

      }
    ));
  }

  addToFavorite(BuildContext context,int id){
    emit(FavoritesIsLoading());
    getIt<AddToFavoritesUseCase>().call(propertyId: id).then((value) => value.fold(
            (error) {
          emit(FavoritesError(error));
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
        },
            (modifyFavoriteResponse) {
          emit(FavoritesSuccess(modifyFavoriteResponse: modifyFavoriteResponse));

        }
    ));
  }

  removeFromFavorite(BuildContext context,int id){
    emit(FavoritesIsLoading());
    getIt<RemoveFromFavoritesUseCase>().call(favoriteItemId: id).then((value) => value.fold(
            (error) {
          emit(FavoritesError(error));
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
        },
            (modifyFavoriteResponse) {
          emit(FavoritesSuccess(modifyFavoriteResponse: modifyFavoriteResponse));

        }
    ));
  }


}

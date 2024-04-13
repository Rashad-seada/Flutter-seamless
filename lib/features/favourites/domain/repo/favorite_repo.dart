import 'package:Mawthoq/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../data/entities/get_favorite_response.dart';
import '../../data/entities/modify_favorite_response.dart';

abstract class FavoriteRepo {

  Future<Either<Failure,GetFavoriteResponse>> getFavorite({required String token});

  Future<Either<Failure,ModifyFavoriteResponse>> addToFavorite({required String token,required int propertyId});

  Future<Either<Failure,ModifyFavoriteResponse>> removeFavorite({required String token,required int favoriteItemId});


}
import 'package:Mawthoq/core/errors/failure.dart';
import 'package:Mawthoq/features/favourites/data/data_source/remote/favorite_remote_data_source.dart';
import 'package:Mawthoq/features/favourites/data/entities/get_favorite_response.dart';
import 'package:Mawthoq/features/favourites/data/entities/modify_favorite_response.dart';
import 'package:Mawthoq/features/favourites/domain/repo/favorite_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/di/app_module.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/infrastructure/services/network_service.dart';

class FavoriteRepoImpl implements FavoriteRepo {

  NetworkService networkService = getIt<NetworkService>();
  FavoriteRemoteDataSource remoteDataSource = getIt<FavoriteRemoteDataSource>();

  @override
  Future<Either<Failure, ModifyFavoriteResponse>> addToFavorite({required String token, required int propertyId}) async {
    try {
      if (!await networkService.isConnected) {
        return left(ServiceFailure("Please check your internet connection",
            failureCode: 0));
      }

      final favoriteResponse = await remoteDataSource.addToFavorite(token: token, propertyId: propertyId);

      if (favoriteResponse.statusCode != true) {
        return left(
            RemoteDataFailure(favoriteResponse.message.toString(), failureCode: 1));
      }

      return right(favoriteResponse);
    } on RemoteDataException catch (e) {
      return left(RemoteDataFailure(e.message, failureCode: 2));
    } on ServiceException catch (e) {
      return left(ServiceFailure(e.message, failureCode: 3));
    } catch (e) {
      return left(InternalFailure(e.toString(), failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, GetFavoriteResponse>> getFavorite({required String token}) async {
    try {
      if (!await networkService.isConnected) {
        return left(ServiceFailure("Please check your internet connection",
            failureCode: 0));
      }

      final favoriteResponse = await remoteDataSource.getFavorite(token: token);

      if (favoriteResponse.statusCode != true) {
        return left(
            RemoteDataFailure(favoriteResponse.message.toString(), failureCode: 1));
      }

      return right(favoriteResponse);
    } on RemoteDataException catch (e) {
      return left(RemoteDataFailure(e.message, failureCode: 2));
    } on ServiceException catch (e) {
      return left(ServiceFailure(e.message, failureCode: 3));
    } catch (e) {
      return left(InternalFailure(e.toString(), failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, ModifyFavoriteResponse>> removeFavorite({required String token, required int favoriteItemId}) async {
    try {
      if (!await networkService.isConnected) {
        return left(ServiceFailure("Please check your internet connection",
            failureCode: 0));
      }

      final favoriteResponse = await remoteDataSource.removeFavorite(token: token, favoriteItemId: favoriteItemId);

      if (favoriteResponse.statusCode != true) {
        return left(
            RemoteDataFailure(favoriteResponse.message.toString(), failureCode: 1));
      }

      return right(favoriteResponse);
    } on RemoteDataException catch (e) {
      return left(RemoteDataFailure(e.message, failureCode: 2));
    } on ServiceException catch (e) {
      return left(ServiceFailure(e.message, failureCode: 3));
    } catch (e) {
      return left(InternalFailure(e.toString(), failureCode: 4));
    }
  }

}
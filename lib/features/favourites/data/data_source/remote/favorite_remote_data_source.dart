import 'package:Mawthoq/core/di/app_module.dart';
import 'package:Mawthoq/features/favourites/data/entities/get_favorite_response.dart';
import 'package:Mawthoq/features/favourites/data/entities/modify_favorite_response.dart';

import '../../../../../core/config/app_consts.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/infrastructure/api/api.dart';

abstract class FavoriteRemoteDataSource {

  Future<GetFavoriteResponse> getFavorite({required String token});

  Future<ModifyFavoriteResponse> addToFavorite({required String token,required int propertyId});

  Future<ModifyFavoriteResponse> removeFavorite({required String token,required int favoriteItemId});

}

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {

  final Api _client = getIt<Api>();

  @override
  Future<ModifyFavoriteResponse> addToFavorite({required String token, required int propertyId}) async {
    try {
      final requestData = {
        "id" : propertyId
      };

      final response = await _client.post(
          AppConsts.baseUrl + AppConsts.favoriteEndPoint,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          data: requestData);

      Map<String, dynamic> responseData = response.data;

      return ModifyFavoriteResponse.fromJson(responseData);
    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<GetFavoriteResponse> getFavorite({required String token}) async {
    try {


      final response = await _client.get(
          AppConsts.baseUrl + AppConsts.favoriteEndPoint,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
      );

      Map<String, dynamic> responseData = response.data;

      return GetFavoriteResponse.fromJson(responseData);
    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<ModifyFavoriteResponse> removeFavorite({required String token, required int favoriteItemId}) async {
    try {

      final response = await _client.delete(
          "${AppConsts.baseUrl}${AppConsts.favoriteEndPoint}/$favoriteItemId",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
      );

      Map<String, dynamic> responseData = response.data;

      return ModifyFavoriteResponse.fromJson(responseData);
    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }
}
import 'package:Mawthoq/features/cart/data/entities/get_cart_response.dart';
import 'package:Mawthoq/features/cart/data/entities/modify_cart_response.dart';

import '../../../../../core/config/app_consts.dart';
import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/infrastructure/api/api.dart';

abstract class CartRemoteDataSource {


  Future<ModifyCartResponse> addToCart({required String token,required int propertyId,required double amount});

  Future<ModifyCartResponse> removeFromCart({required String token,required int cartItem});

  Future<GetCartResponse> getCart({required String token});


}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {

  final _client = getIt<Api>();

  @override
  Future<ModifyCartResponse> addToCart({required String token, required int propertyId, required double amount}) async {
    try {

      final requestData = {
        "id" : propertyId,
        "amount": amount
      };

      final response = await _client.post(
          AppConsts.baseUrl + AppConsts.cartEndPoint,
          headers: {
            "Accept": "application/json",
            "Content-Type" : "application/json",
            "Authorization": "Bearer $token"
          },
          data: requestData
      );


      Map<String,dynamic> responseData = response.data;

      return ModifyCartResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<GetCartResponse> getCart({required String token}) async {
    try {


      final response = await _client.get(
          AppConsts.baseUrl + AppConsts.cartEndPoint,
          headers: {
            "Accept": "application/json",
            "Content-Type" : "application/json",
            "Authorization": "Bearer $token"
          },
      );


      Map<String,dynamic> responseData = response.data;

      return GetCartResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<ModifyCartResponse> removeFromCart({required String token, required int cartItem}) async {
    try {


      final response = await _client.delete(
        AppConsts.baseUrl + AppConsts.cartEndPoint+"/"+cartItem.toString(),
        headers: {
          "Accept": "application/json",
          "Content-Type" : "application/json",
          "Authorization": "Bearer $token"
        },
      );


      Map<String,dynamic> responseData = response.data;

      return ModifyCartResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

}
import 'package:Mawthoq/features/home/data/entities/get_one_property_response.dart';
import 'package:Mawthoq/features/home/data/entities/get_properties_response.dart';

import '../../../../../core/config/app_consts.dart';
import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/infrastructure/api/api.dart';
import '../../../../auth/data/entities/auth_response.dart';

abstract class PropertyRemoteDataSource {
  Future<GetPropertiesResponse> getHomeProperties({
    required String token,
    required String status,
    required int page,
  });

  Future<GetOnePropertyResponse> getOneProperty({
    required String token,
    required int propertyId,
  });
}

class PropertyRemoteDataSourceImpl implements PropertyRemoteDataSource {
  final _client = getIt<Api>();

  @override
  Future<GetPropertiesResponse> getHomeProperties(
      {required String token,
      required String status,
      required int page}) async {
    try {
      final requestData = {
        "status": status,
      };

      final response = await _client.post(
          AppConsts.baseUrl + AppConsts.getAllPropertiesEndPoint,
          queryParameters: {"page": page},
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          data: requestData);

      Map<String, dynamic> responseData = response.data;

      return GetPropertiesResponse.fromJson(responseData);
    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<GetOnePropertyResponse> getOneProperty(
      {required String token, required int propertyId}) async {
    try {
      final response = await _client.get(
        "${AppConsts.baseUrl}${AppConsts.getOnePropertyEndPoint}/$propertyId",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      Map<String, dynamic> responseData = response.data;

      return GetOnePropertyResponse.fromJson(responseData);
    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }
}

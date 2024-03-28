
import 'package:Mawthoq/core/errors/exception.dart';
import 'package:Mawthoq/features/auth/data/entities/auth_response.dart';
import 'package:Mawthoq/features/auth/data/entities/logout_response.dart';

import '../../../../../core/config/app_consts.dart';
import '../../../../../core/di/app_module.dart';
import '../../../../../core/infrastructure/api/api.dart';

abstract class AuthRemoteDataSource {

  Future<AuthResponse> login({required String email, required String password});

  Future<AuthResponse> register({required String username,required String email,required String password});

  Future<LogoutResponse> logout({required String token});

  Future<LogoutResponse> logoutAll({required String token});

}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  final _client = getIt<Api>();

  @override
  Future<AuthResponse> login({required String email, required String password}) async {
    try {

      final requestData = {
        "email" : email,
        "password" : password
      };

      final response = await _client.post(
          AppConsts.baseUrl + AppConsts.loginEndPoint,
          headers: {
            "Accept": "application/json",
            "Content-Type" : "application/json"
          },
          data: requestData
      );


      Map<String,dynamic> responseData = response.data;

      return AuthResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<AuthResponse> register({required String username, required String email, required String password}) async {
    try {

      final requestData = {
        "email" : email,
        "password" : password,
        "password_confirmation" : password,
        "name" : username
      };

      final response = await _client.post(
          AppConsts.baseUrl + AppConsts.registerEndPoint,
          headers: {
            "Accept": "application/json",
            "Content-Type" : "application/json"
          },
          data: requestData
      );

      Map<String,dynamic> responseData = response.data;

      return AuthResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());

    }
  }

  @override
  Future<LogoutResponse> logout({required String token}) async {
    try {

      final response = await _client.post(
          AppConsts.baseUrl + AppConsts.logoutEndPoint,
          headers: {
            "Accept": "application/json",
            "Content-Type" : "application/json",
            "Authorization": "Bearer $token"
          },
      );

      Map<String,dynamic> responseData = response.data;

      return LogoutResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<LogoutResponse> logoutAll({required String token}) async {
    try {

      final response = await _client.post(
        AppConsts.baseUrl + AppConsts.logoutAllEndPoint,
        headers: {
          "Accept": "application/json",
          "Content-Type" : "application/json",
          "Authorization": "Bearer $token"
        },
      );

      Map<String,dynamic> responseData = response.data;

      return LogoutResponse.fromJson(responseData);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }




}

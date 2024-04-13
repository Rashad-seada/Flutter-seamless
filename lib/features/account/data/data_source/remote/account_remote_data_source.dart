import 'package:Mawthoq/core/di/app_module.dart';
import 'package:Mawthoq/core/infrastructure/api/api.dart';
import 'package:Mawthoq/features/account/data/entities/get_account_response.dart';

import '../../../../../core/config/app_consts.dart';
import '../../../../../core/errors/exception.dart';

abstract class AccountRemoteDataSource {

  Future<GetAccountResponse> getAccount({required String token});

}

class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {

  final Api _client = getIt<Api>();

  @override
  Future<GetAccountResponse> getAccount({required String token}) async {
    try {

      final response = await _client.get(
          AppConsts.baseUrl + AppConsts.accountEndPoint,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
      );

      Map<String, dynamic> responseData = response.data;

      return GetAccountResponse.fromJson(responseData);
    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }
}
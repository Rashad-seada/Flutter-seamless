
import 'package:Mawthoq/core/errors/failure.dart';
import 'package:Mawthoq/features/account/data/data_source/remote/account_remote_data_source.dart';
import 'package:Mawthoq/features/account/domain/repo/account_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/di/app_module.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/infrastructure/services/network_service.dart';
import '../entities/get_account_response.dart';

class AccountRepoImpl implements AccountRepo {

  NetworkService networkService = getIt<NetworkService>();
  AccountRemoteDataSource remoteDataSource = getIt<AccountRemoteDataSource>();

  @override
  Future<Either<Failure, GetAccountResponse>> getAccount({required String token}) async {
    try {
      if (!await networkService.isConnected) {
        return left(ServiceFailure("Please check your internet connection",
            failureCode: 0));
      }

      final authResponse = await remoteDataSource.getAccount(token: token);

      if (authResponse.statusCode != true) {
        return left(
            RemoteDataFailure(authResponse.message.toString(), failureCode: 1));
      }

      return right(authResponse);
    } on RemoteDataException catch (e) {
      return left(RemoteDataFailure(e.message, failureCode: 2));
    } on ServiceException catch (e) {
      return left(ServiceFailure(e.message, failureCode: 3));
    } catch (e) {
      return left(InternalFailure(e.toString(), failureCode: 4));
    }
  }
}
import 'package:Mawthoq/features/auth/data/entities/auth_response.dart';
import 'package:Mawthoq/features/auth/data/entities/logout_response.dart';
import 'package:Mawthoq/features/auth/data/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/exception.dart';


import '../../../../core/di/app_module.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/infrastructure/services/network_service.dart';
import '../../domain/repo/auth_repo.dart';
import '../data_source/local/auth_local_data_source.dart';
import '../data_source/remote/auth_remote_data_source.dart';

class AuthRepoImpl implements AuthRepo {

  NetworkService networkService = getIt<NetworkService>();
  AuthRemoteDataSource remoteDataSource = getIt<AuthRemoteDataSource>();
  AuthLocalDataSource localDataSource = getIt<AuthLocalDataSource>();

  @override
  Future<Either<Failure, AuthResponse>> login({required String email, required String password}) async  {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      final authResponse = await remoteDataSource.login(email: email, password: password);

      if (authResponse.statusCode != true) {
        return left(RemoteDataFailure(
            authResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(authResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, LogoutResponse>> logout({required String token}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      final authResponse = await remoteDataSource.logout(token: token);

      if (authResponse.statusCode != true) {
        return left(RemoteDataFailure(
            authResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(authResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, LogoutResponse>> logoutAll({required String token}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      final authResponse = await remoteDataSource.logoutAll(token: token);

      if (authResponse.statusCode != true) {
        return left(RemoteDataFailure(
            authResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(authResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> register({required String username, required String email, required String password}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      final authResponse = await remoteDataSource.register(username: username, email: email, password: password);

      if (authResponse.statusCode != true) {
        return left(RemoteDataFailure(
            authResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(authResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser() async {
    try{

      final taskOutput = await localDataSource.deleteUser();

      return right(taskOutput);

    } on LocalDataException catch (e){
      return left(LocalDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getUser() async {
    try{

      final taskOutput = await localDataSource.getUser();

      return right(taskOutput);

    } on LocalDataException catch (e){
      return left(LocalDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, void>> setUser(UserEntity user) async {
    try{

      final taskOutput = await localDataSource.setUser(user);

      return right(taskOutput);

    } on LocalDataException catch (e){
      return left(LocalDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(UserEntity user) async {
    try{

      final taskOutput = await localDataSource.updateUser(user);

      return right(taskOutput);

    } on LocalDataException catch (e){
      return left(LocalDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }


}
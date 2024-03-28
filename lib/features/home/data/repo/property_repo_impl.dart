
import 'package:Mawthoq/core/errors/failure.dart';
import 'package:Mawthoq/features/home/data/data_source/remote/property_remote_data_source.dart';

import 'package:Mawthoq/features/home/data/entities/get_one_property_response.dart';

import 'package:Mawthoq/features/home/data/entities/get_properties_response.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/di/app_module.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/infrastructure/services/network_service.dart';
import '../../domain/repo/property_repo.dart';

class PropertyRepoImpl implements PropertyRepo {

  NetworkService networkService = getIt<NetworkService>();
  PropertyRemoteDataSource remoteDataSource = getIt<PropertyRemoteDataSource>();


  @override
  Future<Either<Failure, GetPropertiesResponse>> getHomeProperties({required String token, required String status, required int page}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      final authResponse = await remoteDataSource.getHomeProperties(token: token, status: status, page: page);

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
  Future<Either<Failure, GetOnePropertyResponse>> getOneProperty({required String token, required int propertyId}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      final authResponse = await remoteDataSource.getOneProperty(token: token, propertyId: propertyId);

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



}
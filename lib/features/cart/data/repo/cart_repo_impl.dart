import 'package:Mawthoq/core/errors/failure.dart';
import 'package:Mawthoq/features/cart/data/data_source/remote/cart_remote_data_source.dart';
import 'package:Mawthoq/features/cart/data/entities/get_cart_response.dart';
import 'package:Mawthoq/features/cart/data/entities/modify_cart_response.dart';
import 'package:Mawthoq/features/cart/domain/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/di/app_module.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/infrastructure/services/network_service.dart';

class CartRepoImpl implements CartRepo {

  NetworkService networkService = getIt<NetworkService>();
  CartRemoteDataSource remoteDataSource = getIt<CartRemoteDataSource>();

  @override
  Future<Either<Failure, ModifyCartResponse>> addToCart({required String token, required int propertyId, required double amount}) async  {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      final cartResponse = await remoteDataSource.addToCart(token: token, propertyId: propertyId, amount: amount);

      if (cartResponse.statusCode != true) {
        return left(RemoteDataFailure(
            cartResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(cartResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, GetCartResponse>> getCart({required String token}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      final cartResponse = await remoteDataSource.getCart(token: token);

      if (cartResponse.statusCode != true) {
        return left(RemoteDataFailure(
            cartResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(cartResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, ModifyCartResponse>> removeFromCart({required String token, required int cartItem}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      final cartResponse = await remoteDataSource.removeFromCart(token: token, cartItem: cartItem);

      if (cartResponse.statusCode != true) {
        return left(RemoteDataFailure(
            cartResponse.message.toString(),
            failureCode: 1
        ));
      }

      return right(cartResponse);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }
}
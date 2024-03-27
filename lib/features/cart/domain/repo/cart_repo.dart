import 'package:Mawthoq/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../data/entities/get_cart_response.dart';
import '../../data/entities/modify_cart_response.dart';

abstract class CartRepo {

  Future<Either<Failure,ModifyCartResponse>> addToCart({required String token,required int propertyId,required double amount});

  Future<Either<Failure,ModifyCartResponse>> removeFromCart({required String token,required int cartItem});

  Future<Either<Failure,GetCartResponse>> getCart({required String token});

}
import 'package:Mawthoq/features/cart/data/entities/modify_cart_response.dart';
import 'package:Mawthoq/features/cart/domain/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../auth/domain/usecases/get_user_use_case.dart';
import '/core/di/app_module.dart';

class AddToCartUseCase {
  CartRepo repo = getIt<CartRepo>();

  Future<Either<Failure, ModifyCartResponse>> call({
    required int propertyId,
    required double amount,
  }) async {
    return getIt<GetUserUseCase>().call().then((value) => value.fold((error) {
          return left(error);
        }, (success) async {
          return await repo.addToCart(
              token: success!.token!, propertyId: propertyId, amount: amount);
        }));
  }
}

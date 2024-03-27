import 'package:Mawthoq/features/cart/domain/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../auth/domain/usecases/get_user_use_case.dart';
import '../../data/entities/get_cart_response.dart';
import '../../data/entities/modify_cart_response.dart';
import '/core/di/app_module.dart';
import '../../../../core/errors/failure.dart';

class RemoveFromCartUseCase {

  CartRepo repo = getIt<CartRepo>();

  Future<Either<Failure, ModifyCartResponse>> call({required int cartItemId}) async {
    return getIt<GetUserUseCase>().call().then(
            (value) => value.fold(
                (error) {
              return left(error);
            },
                (success) async {
                  return await repo.removeFromCart(token: success!.token!, cartItem: cartItemId);
            }
        ));


  }

}
import 'package:Mawthoq/core/di/app_module.dart';
import 'package:Mawthoq/core/errors/failure.dart';
import 'package:Mawthoq/core/usecases/validate_username_use_case.dart';
import 'package:Mawthoq/features/cart/data/entities/get_cart_response.dart';
import 'package:Mawthoq/features/cart/domain/usecase/add_to_cart_use_case.dart';
import 'package:Mawthoq/features/cart/domain/usecase/get_cart_use_case.dart';
import 'package:Mawthoq/features/cart/domain/usecase/remove_from_cart_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';

import '../../../../../core/usecases/validate_amount_use_case.dart';
import '../../../../../core/views/widgets/custom_flush_bar.dart';
import '../../../data/entities/modify_cart_response.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  TextEditingController amountController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  onConfirmTap(BuildContext context, int propertyId){
    if(formKey.currentState!.validate()){
      _addToCart(context,propertyId);
    }
  }

  _addToCart(BuildContext context, int propertyId) {
    emit(CartIsLoading());
    getIt<AddToCartUseCase>().call(propertyId: propertyId, amount: double.parse(amountController.text)).then(
      (value) => value.fold(
        (error) {
          emit(CartError(error));
          showFlushBar(
              context,
              title: "Error ${error.failureCode}",
              message : error.message
          );
        },
        (success) {
          emit(CartSuccess(modifyCartResponse: success));
          Navigator.pop(context);
        }
      )
    );
  }

  getCart() {
    emit(CartIsLoading());
    getIt<GetCartUseCase>().call().then(
            (value) => value.fold(
                (error) {
              emit(CartError(error));

            },
                (success) {
              emit(CartSuccess(getCartResponse: success));

            }
        )
    );
  }

  removeFromCart(BuildContext context, int cartItemId) {
    emit(CartIsLoading());
    getIt<RemoveFromCartUseCase>().call(cartItemId: cartItemId).then(
            (value) => value.fold(
                (error) {
              emit(CartError(error));

            },
                (success) {
              emit(CartSuccess(modifyCartResponse: success));

            }
        )
    );
  }

  String? validateAmount() {
    return getIt<ValidateAmountUseCase>().call(amountController.text);
  }

}

part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartIsLoading extends CartState {}

class CartSuccess extends CartState {
  static GetCartResponse? getCartResponse;
  static ModifyCartResponse? modifyCartResponse;

  CartSuccess({GetCartResponse? getCartResponse,ModifyCartResponse? modifyCartResponse}){
    if(getCartResponse != null){
      CartSuccess.getCartResponse = getCartResponse;
    }

    if(modifyCartResponse != null){
      CartSuccess.modifyCartResponse = modifyCartResponse;
    }
  }

}

class CartError extends CartState {
  static Failure failure = Failure("", failureCode: -1);

  CartError(Failure failure){
    CartError.failure = failure;
  }

}

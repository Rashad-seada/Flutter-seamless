import '../../../../../core/errors/failure.dart';
import '../../../../auth/data/entities/user_entity.dart';
import '../../../data/entities/get_account_response.dart';

abstract class AccountState {}

class AccountInitial extends AccountState {}

class AccountSuccess extends AccountState {
  static UserEntity? userEntity;

  AccountSuccess(UserEntity userEntity){
    AccountSuccess.userEntity = userEntity;
  }
}

class AccountError extends AccountState {
  static Failure failure = Failure("", failureCode: 0);

  AccountError(Failure failure){
    AccountError.failure = failure;
  }

}

class AccountIsGettingAccount extends AccountState {}

class AccountIsLoggingOut extends AccountState {}

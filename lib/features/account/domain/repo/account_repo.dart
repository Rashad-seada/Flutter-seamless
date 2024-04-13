import 'package:Mawthoq/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../auth/data/entities/user_entity.dart';
import '../../data/entities/get_account_response.dart';

abstract class AccountRepo {

  Future<Either<Failure,GetAccountResponse>> getAccount({required String token});


}
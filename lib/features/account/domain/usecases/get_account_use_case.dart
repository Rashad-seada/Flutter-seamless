import 'package:Mawthoq/features/auth/data/entities/auth_response.dart';
import 'package:Mawthoq/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:Mawthoq/features/auth/domain/usecases/set_user_use_case.dart';
import 'package:dartz/dartz.dart';
import '../../data/entities/get_account_response.dart';
import '../repo/account_repo.dart';
import '/core/di/app_module.dart';
import '/features/auth/domain/model/user_model.dart';
import '/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';

class GetAccountUseCase {

  AccountRepo repo = getIt<AccountRepo>();

  Future<Either<Failure, GetAccountResponse>> call() async {

    return getIt<GetUserUseCase>().call().then((value) => value.fold(
            (error) {
              return left(error);

            },
            (success) async {
              if(success?.token != null){
                return await repo.getAccount(token: success!.token!).then(
                        (value) =>
                        value.fold(
                                (authError) {
                              return left(authError);
                            },
                                (authResponse) async {
                              if (authResponse.user != null) {
                                final userWithToken = authResponse.user?.copyWith(
                                  token: success.token,
                                );

                                await getIt<SetUserUseCase>().call(userWithToken!).then((
                                    value) =>
                                    value.fold(
                                            (userError) {
                                          return left(userError);
                                        },
                                            (userSuccess) {
                                        }
                                    ));
                              }
                              return right(authResponse);

                            }));
              }

              return left(Failure("token return with null", failureCode: 0));

            }
    ));


  }


}
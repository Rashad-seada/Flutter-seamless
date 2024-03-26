import 'package:Mawthoq/features/auth/data/entities/auth_response.dart';
import 'package:Mawthoq/features/auth/data/entities/logout_response.dart';
import 'package:Mawthoq/features/auth/domain/usecases/delete_user_use_case.dart';
import 'package:Mawthoq/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:dartz/dartz.dart';
import '/core/di/app_module.dart';
import '/features/auth/domain/model/user_model.dart';
import '/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';

class LogoutUseCase {

  AuthRepo repo = getIt<AuthRepo>();

  Future<Either<Failure, LogoutResponse>> call() async {

    return getIt<GetUserUseCase>().call().then(
        (value) => value.fold(
                (userError) {
                  return left(userError);
                },
                (userSuccess) async {
                  return await repo.logout(token: userSuccess!.token!).then(
                          (value) => value.fold(
                                (logoutError) {
                                  return left(logoutError);
                                },
                                (logoutSuccess) {

                                  return getIt<DeleteUserUseCase>().call().then(
                                          (value) => value.fold(
                                                  (deleteUserError) {
                                                    return left(deleteUserError);
                                                  },
                                                  (deleteUserSuccess) {
                                                    return right(logoutSuccess);
                                                  }
                                          )
                                  );

                                }
                          ));

                }
        )

    );
  }

}
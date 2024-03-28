import 'package:Mawthoq/features/auth/data/entities/auth_response.dart';
import 'package:Mawthoq/features/auth/domain/usecases/set_user_use_case.dart';
import 'package:dartz/dartz.dart';
import '/core/di/app_module.dart';
import '/features/auth/domain/model/user_model.dart';
import '/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';

class RegisterUseCase {

  AuthRepo repo = getIt<AuthRepo>();

  Future<Either<Failure, AuthResponse>> call(String username,String email,String password) async {
    return await repo.register(email: email, password: password, username: username).then(
            (value) =>
            value.fold(
                    (authError) {
                  return left(authError);
                },
                    (authResponse) async {
                  if (authResponse.data?.user != null) {
                    final userWithToken = authResponse.data?.user?.copyWith(
                      token: authResponse.data?.token,
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

                }));;
  }

}
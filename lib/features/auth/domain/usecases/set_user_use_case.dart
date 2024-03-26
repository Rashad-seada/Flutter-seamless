import 'package:Mawthoq/features/auth/data/entities/auth_response.dart';
import 'package:dartz/dartz.dart';
import '../../data/entities/user_entity.dart';
import '/core/di/app_module.dart';
import '/features/auth/domain/model/user_model.dart';
import '/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';

class SetUserUseCase {

  AuthRepo repo = getIt<AuthRepo>();

  Future<Either<Failure, void>> call(UserEntity user) async {
    return await repo.setUser(user);
  }

}
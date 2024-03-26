import 'package:Mawthoq/features/auth/data/entities/auth_response.dart';
import 'package:dartz/dartz.dart';
import '../../data/entities/user_entity.dart';
import '/core/di/app_module.dart';
import '/features/auth/domain/model/user_model.dart';
import '/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';

class GetUserUseCase {

  AuthRepo repo = getIt<AuthRepo>();

  Future<Either<Failure, UserEntity?>> call() async {
    return await repo.getUser();
  }

}
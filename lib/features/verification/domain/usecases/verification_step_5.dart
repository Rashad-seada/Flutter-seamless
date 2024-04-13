import 'package:Mawthoq/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:Mawthoq/features/verification/domain/repo/verification_repo.dart';
import 'package:dartz/dartz.dart';
import '../../data/entities/verification_response.dart';
import '/core/di/app_module.dart';
import '../../../../core/errors/failure.dart';

class VerificationStep5UseCase {
  VerificationRepo repo = getIt<VerificationRepo>();

  Future<Either<Failure, VerificationResponse>> call({
    required String country,
    required String city,
    required String area,
    required String streetAddress,

  }) async {
    return getIt<GetUserUseCase>().call().then((value) => value.fold((error) {
          return left(error);
        }, (success) async {
          return await repo.step5(token: success!.token!, country: country, city: city, area: area, streetAddress: streetAddress);
    }));
  }
}

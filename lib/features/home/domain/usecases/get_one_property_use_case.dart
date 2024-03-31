import 'package:Mawthoq/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:Mawthoq/features/home/domain/repo/property_repo.dart';
import 'package:dartz/dartz.dart';
import '../../data/entities/get_one_property_response.dart';
import '../../data/entities/get_properties_response.dart';
import '/core/di/app_module.dart';
import '../../../../core/errors/failure.dart';

class GetOnePropertyUseCase {
  PropertyRepo repo = getIt<PropertyRepo>();

  Future<Either<Failure, GetOnePropertyResponse>> call(
      {required int propertyId}) async {
    return getIt<GetUserUseCase>().call().then((value) => value.fold((error) {
          return left(error);
        }, (success) async {
          return await repo.getOneProperty(
              token: success!.token!, propertyId: propertyId);
        }));
  }
}

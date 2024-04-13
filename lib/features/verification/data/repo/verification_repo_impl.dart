import 'package:Mawthoq/core/errors/failure.dart';
import 'package:Mawthoq/features/verification/data/entities/verification_response.dart';
import 'package:Mawthoq/features/verification/domain/repo/verification_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/di/app_module.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/infrastructure/services/network_service.dart';
import '../data_source/remote/verification_remote_data_source.dart';

class VerificationRepoImpl implements VerificationRepo {
  NetworkService networkService = getIt<NetworkService>();
  VerificationRemoteDataSource remoteDataSource =
      getIt<VerificationRemoteDataSource>();

  @override
  Future<Either<Failure, VerificationResponse>> step1(
      {required String token}) async {
    try {
      if (!await networkService.isConnected) {
        return left(ServiceFailure("Please check your internet connection",
            failureCode: 0));
      }

      final verificationResponse = await remoteDataSource.step1(token: token);

      if (verificationResponse.statusCode != true) {
        return left(RemoteDataFailure(verificationResponse.message.toString(),
            failureCode: 1));
      }

      return right(verificationResponse);
    } on RemoteDataException catch (e) {
      return left(RemoteDataFailure(e.message, failureCode: 2));
    } on ServiceException catch (e) {
      return left(ServiceFailure(e.message, failureCode: 3));
    } catch (e) {
      return left(InternalFailure(e.toString(), failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, VerificationResponse>> step2(
      {required String token, required double initialInvestment}) async {
    try {
      if (!await networkService.isConnected) {
        return left(ServiceFailure("Please check your internet connection",
            failureCode: 0));
      }

      final verificationResponse = await remoteDataSource.step2(
          token: token, initialInvestment: initialInvestment);

      if (verificationResponse.statusCode != true) {
        return left(RemoteDataFailure(verificationResponse.message.toString(),
            failureCode: 1));
      }

      return right(verificationResponse);
    } on RemoteDataException catch (e) {
      return left(RemoteDataFailure(e.message, failureCode: 2));
    } on ServiceException catch (e) {
      return left(ServiceFailure(e.message, failureCode: 3));
    } catch (e) {
      return left(InternalFailure(e.toString(), failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, VerificationResponse>> step3(
      {required String token,
      required String employmentStatus,
      required String incomeSource,
      String? employmentCompany,
      String? employmentOwner,
      String? employmentAddress,
      String? employmentTitle,
      String? employmentDomain,
      String freelancerUrl = ""}) async {
    try {
      if (!await networkService.isConnected) {
        return left(ServiceFailure("Please check your internet connection",
            failureCode: 0));
      }

      final verificationResponse = await remoteDataSource.step3(
          token: token,
          employmentStatus: employmentStatus,
          incomeSource: incomeSource,
          employmentCompany : employmentCompany,
          employmentOwner : employmentOwner,
          employmentAddress : employmentAddress,
          employmentTitle : employmentTitle,
          employmentDomain : employmentDomain,
          freelancerUrl : freelancerUrl
      );

      if (verificationResponse.statusCode != true) {
        return left(RemoteDataFailure(verificationResponse.message.toString(),
            failureCode: 1));
      }

      return right(verificationResponse);
    } on RemoteDataException catch (e) {
      return left(RemoteDataFailure(e.message, failureCode: 2));
    } on ServiceException catch (e) {
      return left(ServiceFailure(e.message, failureCode: 3));
    } catch (e) {
      return left(InternalFailure(e.toString(), failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, VerificationResponse>> step4({required String token}) async {
    try {
      if (!await networkService.isConnected) {
        return left(ServiceFailure("Please check your internet connection",
            failureCode: 0));
      }

      final verificationResponse = await remoteDataSource.step4(token: token);

      if (verificationResponse.statusCode != true) {
        return left(
            RemoteDataFailure(verificationResponse.message.toString(), failureCode: 1));
      }

      return right(verificationResponse);
    } on RemoteDataException catch (e) {
      return left(RemoteDataFailure(e.message, failureCode: 2));
    } on ServiceException catch (e) {
      return left(ServiceFailure(e.message, failureCode: 3));
    } catch (e) {
      return left(InternalFailure(e.toString(), failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, VerificationResponse>> step5(
      {required String token,
      required String country,
      required String city,
      required String area,
      required String streetAddress}) async {
    try {
      if (!await networkService.isConnected) {
        return left(ServiceFailure("Please check your internet connection",
            failureCode: 0));
      }

      final verificationResponse = await remoteDataSource.step5(token: token, country: country, city: city, area: area, streetAddress: streetAddress);

      if (verificationResponse.statusCode != true) {
        return left(
            RemoteDataFailure(verificationResponse.message.toString(), failureCode: 1));
      }

      return right(verificationResponse);
    } on RemoteDataException catch (e) {
      return left(RemoteDataFailure(e.message, failureCode: 2));
    } on ServiceException catch (e) {
      return left(ServiceFailure(e.message, failureCode: 3));
    } catch (e) {
      return left(InternalFailure(e.toString(), failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, VerificationResponse>> step6({required String token}) async {
    try {
      if (!await networkService.isConnected) {
        return left(ServiceFailure("Please check your internet connection",
            failureCode: 0));
      }

      final verificationResponse = await remoteDataSource.step6(token: token);

      if (verificationResponse.statusCode != true) {
        return left(
            RemoteDataFailure(verificationResponse.message.toString(), failureCode: 1));
      }

      return right(verificationResponse);
    } on RemoteDataException catch (e) {
      return left(RemoteDataFailure(e.message, failureCode: 2));
    } on ServiceException catch (e) {
      return left(ServiceFailure(e.message, failureCode: 3));
    } catch (e) {
      return left(InternalFailure(e.toString(), failureCode: 4));
    }
  }

  @override
  Future<Either<Failure, VerificationResponse>> step7(
      {required String token,
      required XFile front,
      required XFile back,
      required XFile image}) async {
    try {
      if (!await networkService.isConnected) {
        return left(ServiceFailure("Please check your internet connection",
            failureCode: 0));
      }

      final verificationResponse = await remoteDataSource.step7(token: token, front: front, back: back, image: image);

      if (verificationResponse.statusCode != true) {
        return left(
            RemoteDataFailure(verificationResponse.message.toString(), failureCode: 1));
      }

      return right(verificationResponse);
    } on RemoteDataException catch (e) {
      return left(RemoteDataFailure(e.message, failureCode: 2));
    } on ServiceException catch (e) {
      return left(ServiceFailure(e.message, failureCode: 3));
    } catch (e) {
      return left(InternalFailure(e.toString(), failureCode: 4));
    }
  }
}

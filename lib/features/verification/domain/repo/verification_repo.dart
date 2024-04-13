import 'package:Mawthoq/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/entities/verification_response.dart';

abstract class VerificationRepo {

  Future<Either<Failure,VerificationResponse>> step1({required String token});

  Future<Either<Failure,VerificationResponse>> step2({required String token,required double initialInvestment});

  Future<Either<Failure,VerificationResponse>> step3({
    required String token,
    required String employmentStatus,
    required String incomeSource,
    String? employmentCompany,
    String? employmentOwner,
    String? employmentAddress,
    String? employmentTitle,
    String? employmentDomain,
    String freelancerUrl = ""
  });

  Future<Either<Failure,VerificationResponse>> step4({required String token});

  Future<Either<Failure,VerificationResponse>> step5({
    required String token,
    required String country,
    required String city,
    required String area,
    required String streetAddress,
  });

  Future<Either<Failure,VerificationResponse>> step6({required String token});

  Future<Either<Failure,VerificationResponse>> step7({
    required String token,
    required XFile front,
    required XFile back,
    required XFile image,
  });

}
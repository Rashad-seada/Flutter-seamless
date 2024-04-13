import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../../../../core/config/app_consts.dart';
import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/infrastructure/api/api.dart';
import '../../entities/verification_response.dart';

abstract class VerificationRemoteDataSource {

  Future<VerificationResponse> step1({required String token});

  Future<VerificationResponse> step2({required String token,required double initialInvestment});

  Future<VerificationResponse> step3({
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

  Future<VerificationResponse> step4({required String token});

  Future<VerificationResponse> step5({
    required String token,
    required String country,
    required String city,
    required String area,
    required String streetAddress,
  });

  Future<VerificationResponse> step6({required String token});

  Future<VerificationResponse> step7({
    required String token,
    required XFile front,
    required XFile back,
    required XFile image,
  });

}

class VerificationRemoteDataSourceImpl implements VerificationRemoteDataSource {

  final _client = getIt<Api>();

  @override
  Future<VerificationResponse> step1({required String token}) async {
    try {

      final response = await _client.get(
          AppConsts.baseUrl + AppConsts.onboardingEndPoint+"/1",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
      );

      Map<String, dynamic> responseData = response.data;

      return VerificationResponse.fromJson(responseData);
    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<VerificationResponse> step2({required String token, required double initialInvestment}) async {
    try {
      final requestData = {
        "onboarding_initial_investment" : initialInvestment.toString()
      };

      final response = await _client.post(
          AppConsts.baseUrl + AppConsts.onboardingEndPoint+"/2",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          data: requestData);

      Map<String, dynamic> responseData = response.data;

      return VerificationResponse.fromJson(responseData);
    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<VerificationResponse> step3({required String token, required String employmentStatus, required String incomeSource, String? employmentCompany, String? employmentOwner, String? employmentAddress, String? employmentTitle, String? employmentDomain, String freelancerUrl = ""}) async {
    try {
      final requestData = {
        "employment_status" : employmentStatus,
        "income_source" : incomeSource,

        "freelancer_url" : freelancerUrl,

        if(employmentCompany != null)
        "employment_company" : employmentCompany,

        if(employmentOwner != null)
        "employment_owner" : employmentOwner,

        if(employmentAddress != null)
        "employment_address" : employmentAddress,

        if(employmentTitle != null)
          "employment_title" : employmentTitle,

        if(employmentDomain != null)
          "employment_domain" : employmentDomain,


      };

      final response = await _client.post(
          AppConsts.baseUrl + AppConsts.onboardingEndPoint+"/3",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          data: requestData);

      Map<String, dynamic> responseData = response.data;

      return VerificationResponse.fromJson(responseData);
    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<VerificationResponse> step4({required String token}) async {
    try {

      final response = await _client.get(
          AppConsts.baseUrl + AppConsts.onboardingEndPoint+"/4",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
      );

      Map<String, dynamic> responseData = response.data;

      return VerificationResponse.fromJson(responseData);
    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<VerificationResponse> step5({required String token, required String country, required String city, required String area, required String streetAddress}) async {
    try {
      final requestData = {
        "country" : country,
        "city" : city,
        "area" : area,
        "street_address" : streetAddress
      };

      final response = await _client.post(
          AppConsts.baseUrl + AppConsts.onboardingEndPoint+"/5",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          data: requestData);

      print(response.data);

      Map<String, dynamic> responseData = response.data;

      return VerificationResponse.fromJson(responseData);
    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<VerificationResponse> step6({required String token}) async {
    try {

      final response = await _client.get(
        AppConsts.baseUrl + AppConsts.onboardingEndPoint+"/6",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      Map<String, dynamic> responseData = response.data;

      return VerificationResponse.fromJson(responseData);
    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<VerificationResponse> step7({required String token, required XFile front, required XFile back, required XFile image}) async {
    try {

      FormData requestData = FormData.fromMap({
        'front': await MultipartFile.fromFile(front.path, filename: basename(front.path)),
        'back': await MultipartFile.fromFile(back.path, filename: basename(back.path)),
        'image': await MultipartFile.fromFile(image.path, filename: basename(image.path)),
      });


      final response = await _client.post(
          AppConsts.baseUrl + AppConsts.onboardingEndPoint+"/7",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          data: requestData);

      Map<String, dynamic> responseData = response.data;

      return VerificationResponse.fromJson(responseData);
    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }
}
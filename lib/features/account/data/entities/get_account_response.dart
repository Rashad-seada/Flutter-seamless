import 'package:Mawthoq/core/entities/api_error.dart';

import '../../../auth/data/entities/user_entity.dart';

class GetAccountResponse {
  bool? statusCode;
  String? message;
  UserEntity? user;
  ApiError? error;

  GetAccountResponse({this.statusCode, this.message, this.user, this.error});

  GetAccountResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    user = json['data'] != null ? new UserEntity.fromJson(json['data']) : null;
    error = json['error'] != null ? new ApiError.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.user != null) {
      data['data'] = this.user!.toJson();
    }
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}




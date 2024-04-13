import '../../../../core/entities/api_error.dart';

class VerificationResponse {
  bool? statusCode;
  String? message;
  Data? data;
  ApiError? error;

  VerificationResponse({this.statusCode, this.message, this.data, this.error});

  VerificationResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'] != null ? new ApiError.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Data {
  int? currentStep;

  Data({this.currentStep});

  Data.fromJson(Map<String, dynamic> json) {
    currentStep = json['current_step'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_step'] = this.currentStep;
    return data;
  }
}

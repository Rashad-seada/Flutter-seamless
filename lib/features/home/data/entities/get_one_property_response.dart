import 'package:Mawthoq/core/entities/api_error.dart';
import 'package:Mawthoq/features/home/data/entities/property_entity.dart';

class GetOnePropertyResponse {
  bool? statusCode;
  String? message;
  PropertyEntity? data;
  ApiError? error;

  GetOnePropertyResponse(
      {this.statusCode, this.message, this.data, this.error});

  GetOnePropertyResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new PropertyEntity.fromJson(json['data']) : null;
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



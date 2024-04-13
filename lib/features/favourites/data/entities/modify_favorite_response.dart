import '../../../../core/entities/api_error.dart';

class ModifyFavoriteResponse {
  bool? statusCode;
  String? message;
  ApiError? error;

  ModifyFavoriteResponse({this.statusCode, this.message, this.error});

  ModifyFavoriteResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    error = json['error'] != null ? new ApiError.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

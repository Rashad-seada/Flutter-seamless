import 'package:Mawthoq/core/entities/api_error.dart';
import 'package:Mawthoq/features/home/data/entities/property_entity.dart';

import 'favorite_item_entity.dart';

class GetFavoriteResponse {
  bool? statusCode;
  String? message;
  List<FavoriteItemEntity>? data;
  ApiError? error;

  GetFavoriteResponse({this.statusCode, this.message, this.data, this.error});

  GetFavoriteResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FavoriteItemEntity>[];
      json['data'].forEach((v) {
        data!.add(new FavoriteItemEntity.fromJson(v));
      });
    }
    error = json['error'] != null ? new ApiError.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}


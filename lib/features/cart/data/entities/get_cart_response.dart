import 'package:Mawthoq/features/cart/data/entities/cart_item_entity.dart';
import 'package:Mawthoq/features/home/data/entities/property_entity.dart';

class GetCartResponse {
  bool? statusCode;
  String? message;
  List<CartItemEntity>? data;

  GetCartResponse({this.statusCode, this.message, this.data});

  GetCartResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CartItemEntity>[];
      json['data'].forEach((v) {
        data!.add(new CartItemEntity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




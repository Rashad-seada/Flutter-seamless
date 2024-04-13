import '../../../home/data/entities/property_entity.dart';

class FavoriteItemEntity {
  int? id;
  int? userId;
  int? propertyId;
  String? createdAt;
  String? updatedAt;
  PropertyEntity? property;

  FavoriteItemEntity(
      {this.id,
        this.userId,
        this.propertyId,
        this.createdAt,
        this.updatedAt,
        this.property});

  FavoriteItemEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    propertyId = json['property_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    property = json['property'] != null
        ? new PropertyEntity.fromJson(json['property'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['property_id'] = this.propertyId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.property != null) {
      data['property'] = this.property!.toJson();
    }
    return data;
  }
}

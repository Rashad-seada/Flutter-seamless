import 'package:hive/hive.dart';
part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity {

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? token;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? email;

  @HiveField(4)
  String? emailVerifiedAt;

  @HiveField(5)
  String? createdAt;

  @HiveField(6)
  String? updatedAt;

  @HiveField(7)
  int? receiveEmails;

  @HiveField(8)
  int? verified;

  UserEntity({
    this.id,
    this.token,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.receiveEmails,
    this.verified,
  });

  UserEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    receiveEmails = json['receive_emails'] ?? 0;
    verified = json['verified'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['receive_emails'] = receiveEmails;
    data['verified'] = verified;
    return data;
  }

  UserEntity copyWith({
    int? id,
    String? token,
    String? name,
    String? email,
    String? emailVerifiedAt,
    String? createdAt,
    String? updatedAt,
    int? receiveEmails,
    int? verified,
  }) {
    return UserEntity(
      id: id ?? this.id,
      token: token ?? this.token,
      name: name ?? this.name,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      receiveEmails: receiveEmails ?? this.receiveEmails,
      verified: verified ?? this.verified,
    );
  }
}

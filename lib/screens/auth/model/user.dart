// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';
import 'package:get/get.dart';

import '../../un_aprovverd_screen.dart';
UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.user,
    this.token,
    this.store,
    this.error=false
  });

  User user;
  bool error;
  String token;
  String fcmToken;
  List<StoreId> store;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    user: User.fromJson(json["user"]),
    token: json["token"],
    store: List<StoreId>.from(json["store"].map((x) => StoreId.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
    "fcmToken":fcmToken,
    "store": List<dynamic>.from(store.map((x) => x.toJson())),
  };
}

class StoreId {
  StoreId({
    this.id,
  });

  int id;

  factory StoreId.fromJson(Map<String, dynamic> json) => StoreId(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

class User {
  User({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.role,
    this.emailVerifiedAt,
    this.image,
    this.approve,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  dynamic name;
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  String mobile;
  String role;
  dynamic emailVerifiedAt;
  dynamic image;
  dynamic approve;
  dynamic address;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"]??-1,
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    mobile: json["mobile"],
    role: json["role"],
    emailVerifiedAt: json["email_verified_at"],
    image: json["image"],
    approve: json["approve"],
    address: json["address"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "mobile": mobile,
    "role": role,
    "email_verified_at": emailVerifiedAt,
    "image": image,
    "approve": approve,
    "address": address,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

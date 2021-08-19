// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

ReviewModel reviewModelFromJson(String str) => ReviewModel.fromJson(json.decode(str));

String reviewModelToJson(ReviewModel data) => json.encode(data.toJson());

class ReviewModel {
  ReviewModel({
    this.rates,
  });

  List<Rate> rates;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    rates: List<Rate>.from(json["rates"].map((x) => Rate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "rates": List<dynamic>.from(rates.map((x) => x.toJson())),
  };
}

class Rate {
  Rate({
    this.userId,
    this.userName,
    this.userImage,
    this.userComment,
    this.userRate,
    this.storeId,
    this.doctorId,
  });

  int userId;
  dynamic userName;
  String userImage;
  String userComment;
  int userRate;
  String storeId;
  int doctorId;

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
    userId: json["user_id"],
    userName: json["user_name"],
    userImage: json["user_image"],
    userComment: json["user_comment"],
    userRate: json["user_rate"],
    storeId: json["store_id"],
    doctorId: json["doctor_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_name": userName,
    "user_image": userImage,
    "user_comment": userComment,
    "user_rate": userRate,
    "store_id": storeId,
    "doctor_id": doctorId,
  };
}

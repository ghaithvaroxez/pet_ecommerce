// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

ReviewModel reviewModelFromJson(String str) =>
    ReviewModel.fromJson(json.decode(str));

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
    this.ratedType,
    this.userFirstName,
    this.userLastName,
    this.ratedStoreName,
    this.ratedStoreImage,
    this.ratedStoreId,
    this.userImage,
    this.userComment,
    this.userRate,
    this.storeId,
    this.storeName,
    this.storeImage,
    this.doctorId,
    this.doctorFirstName,
    this.doctorLastName,
    this.doctorImage,
  });

  int userId;
  String ratedType;
  String userFirstName;
  String userLastName;
  String ratedStoreName;
  String ratedStoreImage;
  dynamic ratedStoreId;
  String userImage;
  String userComment;
  int userRate;
  int storeId;
  String storeName;
  String storeImage;
  int doctorId;
  String doctorFirstName;
  String doctorLastName;
  String doctorImage;

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        userId: json["user_id"],
        ratedType: json["rated_type"],
        userFirstName: json["user_first_name"],
        userLastName: json["user_last_name"],
        ratedStoreName: json["ratedStore_name"],
        ratedStoreImage: json["ratedStore_image"],
        ratedStoreId: json["ratedStore_id"],
        userImage: json["user_image"],
        userComment: json["user_comment"],
        userRate: json["user_rate"],
        storeId: json["store_id"],
        storeName: json["store_name"],
        storeImage: json["store_image"],
        doctorId: json["doctor_id"],
        doctorFirstName: json["doctor_first_name"],
        doctorLastName: json["doctor_last_name"],
        doctorImage: json["doctor_image"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "rated_type": ratedType,
        "user_first_name": userFirstName,
        "user_last_name": userLastName,
        "ratedStore_name": ratedStoreName,
        "ratedStore_image": ratedStoreImage,
        "ratedStore_id": ratedStoreId,
        "user_image": userImage,
        "user_comment": userComment,
        "user_rate": userRate,
        "store_id": storeId,
        "store_name": storeName,
        "store_image": storeImage,
        "doctor_id": doctorId,
        "doctor_first_name": doctorFirstName,
        "doctor_last_name": doctorLastName,
        "doctor_image": doctorImage,
      };
}

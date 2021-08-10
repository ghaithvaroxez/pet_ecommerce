// To parse this JSON data, do
//
//     final favOffersModel = favOffersModelFromJson(jsonString);

import 'dart:convert';

FavOffersModel favOffersModelFromJson(String str) => FavOffersModel.fromJson(json.decode(str));

String favOffersModelToJson(FavOffersModel data) => json.encode(data.toJson());

class FavOffersModel {
  FavOffersModel({
    this.myFavourites,
  });

  List<MyFavourite> myFavourites;

  factory FavOffersModel.fromJson(Map<String, dynamic> json) => FavOffersModel(
    myFavourites: List<MyFavourite>.from(json["my Favourites"].map((x) => MyFavourite.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "my Favourites": List<dynamic>.from(myFavourites.map((x) => x.toJson())),
  };
}

class MyFavourite {
  MyFavourite({
    this.id,
    this.offerId,
    this.offerStoreName,
    this.offerImage,
    this.offerDate,
  });

  int id;
  int offerId;
  String offerStoreName;
  String offerImage;
  String offerDate;

  factory MyFavourite.fromJson(Map<String, dynamic> json) => MyFavourite(
    id: json["id"],
    offerId: json["offer_id"],
    offerStoreName: json["offer_store_name"],
    offerImage: json["offer_image"],
    offerDate: json["offer_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "offer_id": offerId,
    "offer_store_name": offerStoreName,
    "offer_image": offerImage,
    "offer_date": offerDate,
  };
}

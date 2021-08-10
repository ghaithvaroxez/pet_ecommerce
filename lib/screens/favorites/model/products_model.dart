// To parse this JSON data, do
//
//     final favProductsModel = favProductsModelFromJson(jsonString);

import 'dart:convert';

FavProductsModel favProductsModelFromJson(String str) => FavProductsModel.fromJson(json.decode(str));

String favProductsModelToJson(FavProductsModel data) => json.encode(data.toJson());

class FavProductsModel {
  FavProductsModel({
    this.myFavourites,
  });

  List<MyFavourite> myFavourites;

  factory FavProductsModel.fromJson(Map<String, dynamic> json) => FavProductsModel(
    myFavourites: List<MyFavourite>.from(json["my Favourites"].map((x) => MyFavourite.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "my Favourites": List<dynamic>.from(myFavourites.map((x) => x.toJson())),
  };
}

class MyFavourite {
  MyFavourite({
    this.id,
    this.itemId,
    this.itemName,
    this.itemImage,
  });

  int id;
  int itemId;
  String itemName;
  String itemImage;

  factory MyFavourite.fromJson(Map<String, dynamic> json) => MyFavourite(
    id: json["id"],
    itemId: json["item_id"],
    itemName: json["item_name"],
    itemImage: json["item_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "item_id": itemId,
    "item_name": itemName,
    "item_image": itemImage,
  };
}

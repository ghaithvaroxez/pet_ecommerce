// To parse this JSON data, do
//
//     final favoriteStoreModel = favoriteStoreModelFromJson(jsonString);

import 'dart:convert';

import 'package:pets/screens/stores/model/all_stores.dart';

FavoriteStoreModel favoriteStoreModelFromJson(String str) => FavoriteStoreModel.fromJson(json.decode(str));

String favoriteStoreModelToJson(FavoriteStoreModel data) => json.encode(data.toJson());

class FavoriteStoreModel {
  FavoriteStoreModel({
    this.myFavourites,
  });

  List<Store> myFavourites;

  factory FavoriteStoreModel.fromJson(Map<String, dynamic> json) => FavoriteStoreModel(
    myFavourites: List<Store>.from(json["my Favourites"].map((x) => Store.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "my Favourites": List<dynamic>.from(myFavourites.map((x) => x.toJson())),
  };
}


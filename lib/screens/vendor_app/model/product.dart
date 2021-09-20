// To parse this JSON data, do
//
//     final storeProduct = storeProductFromJson(jsonString);

import 'dart:convert';
// import 'foo.dart';

StoreProduct storeProductFromJson(String str) =>
    StoreProduct.fromJson(json.decode(str));

String storeProductToJson(StoreProduct data) => json.encode(data.toJson());

class StoreProduct {
  StoreProduct({
    this.id,
    this.name,
    this.body,
    this.image,
    this.price,
    this.favourites,
    this.fav,
    this.categoryId,
    this.categoryName,
    this.typeId,
    this.typeName,
    this.storeId,
    this.storeName,
    this.date,
    this.visible,
    this.favStatus,
    this.error = false,
  });

  bool error;
  int id;
  String name;
  String body;
  String image;
  var price;
  int favourites;
  int fav;
  int categoryId;
  String categoryName;
  int typeId;
  String typeName;
  int storeId;
  String storeName;
  String date;
  String visible;
  bool favStatus;

  factory StoreProduct.fromJson(Map<String, dynamic> json) => StoreProduct(
      id: json["id"],
      name: json["name"],
      body: json["body"],
      image: json["image"],
      price: json["price"],
      favourites: json["favourites"],
      fav: json["fav"],
      categoryId: json["category_id"],
      categoryName: json["category_name"],
      typeId: json["type_id"],
      typeName: json["type_name"],
      storeId: json["store_id"],
      storeName: json["store_name"],
      date: json["date"],
      visible: json["visible"],
      favStatus: json["fav_status"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "body": body,
        "image": image,
        "price": price,
        "favourites": favourites,
        "fav": fav,
        "category_id": categoryId,
        "category_name": categoryName,
        "type_id": typeId,
        "type_name": typeName,
        "store_id": storeId,
        "store_name": storeName,
      };
}

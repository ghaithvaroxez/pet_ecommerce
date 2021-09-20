// To parse this JSON data, do
//
//     final customerStoreOffers = customerStoreOffersFromJson(jsonString);

import 'dart:convert';

CustomerStoreOffers customerStoreOffersFromJson(String str) =>
    CustomerStoreOffers.fromJson(json.decode(str));

String customerStoreOffersToJson(CustomerStoreOffers data) =>
    json.encode(data.toJson());

class CustomerStoreOffers {
  CustomerStoreOffers({
    this.offers,
  });

  List<Offer> offers;

  factory CustomerStoreOffers.fromJson(Map<String, dynamic> json) =>
      CustomerStoreOffers(
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
      };
}

class Offer {
  Offer(
      {this.id,
      this.storeId,
      this.storeName,
      this.category,
      this.type,
      this.name,
      this.desc,
      this.image,
      this.date,
      this.favStatus,
      this.visible,
      this.error = false});

  bool error;
  int id;
  int storeId;
  String storeName;
  String category;
  String type;
  String name;
  String desc;
  String image;
  String date;
  bool favStatus;
  String visible;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
      id: json["id"],
      storeId: json["store_id"],
      storeName: json["store_name"],
      category: json["category"],
      type: json["type"],
      name: json["name"],
      desc: json["desc"],
      image: json["image"],
      date: json["date"],
      favStatus: json["fav_status"] == null ? false : json["fav_status"],
      visible: json["visible"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "store_name": storeName,
        "category": category,
        "type": type,
        "name": name,
        "desc": desc,
        "image": image,
        "date": date,
      };
}

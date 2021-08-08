// To parse this JSON data, do
//
//     final customerStoreBody = customerStoreBodyFromJson(jsonString);

import 'dart:convert';

CustomerStoreBody customerStoreBodyFromJson(String str) => CustomerStoreBody.fromJson(json.decode(str));

String customerStoreBodyToJson(CustomerStoreBody data) => json.encode(data.toJson());

class CustomerStoreBody {
  CustomerStoreBody({
    this.store,
  });

  Store store;

  factory CustomerStoreBody.fromJson(Map<String, dynamic> json) => CustomerStoreBody(
    store: Store.fromJson(json["store"]),
  );

  Map<String, dynamic> toJson() => {
    "store": store.toJson(),
  };
}

class Store {
  Store({
    this.id,
    this.name,
    this.image,
    this.email,
    this.phone,
    this.district,
    this.longitude,
    this.latitude,
    this.openFrom,
    this.closedAt,
    this.info,
    this.favourites,
    this.storeContacts,
  });

  int id;
  String name;
  String image;
  String email;
  String phone;
  String district;
  String longitude;
  String latitude;
  String openFrom;
  String closedAt;
  String info;
  int favourites;
  List<StoreContact> storeContacts;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    email: json["email"],
    phone: json["phone"],
    district: json["district"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    openFrom: json["open_from"],
    closedAt: json["closed_at"],
    info: json["info"],
    favourites: json["favourites"],
    storeContacts: List<StoreContact>.from(json["store_contacts"].map((x) => StoreContact.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "email": email,
    "phone": phone,
    "district": district,
    "longitude": longitude,
    "latitude": latitude,
    "open_from": openFrom,
    "closed_at": closedAt,
    "info": info,
    "favourites": favourites,
    "store_contacts": List<dynamic>.from(storeContacts.map((x) => x.toJson())),
  };
}

class StoreContact {
  StoreContact({
    this.id,
    this.storeId,
    this.doctorId,
    this.link,
    this.type,
  });

  int id;
  int storeId;
  String doctorId;
  String link;
  String type;

  factory StoreContact.fromJson(Map<String, dynamic> json) => StoreContact(
    id: json["id"],
    storeId: json["store_id"],
    doctorId: json["doctor_id"],
    link: json["link"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "store_id": storeId,
    "doctor_id": doctorId,
    "link": link,
    "type": type,
  };
}

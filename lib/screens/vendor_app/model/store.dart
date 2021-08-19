// To parse this JSON data, do
//
//     final storeModel = storeModelFromJson(jsonString);

import 'dart:convert';

StoreModel storeModelFromJson(String str) => StoreModel.fromJson(json.decode(str));

String storeModelToJson(StoreModel data) => json.encode(data.toJson());

class StoreModel {
  StoreModel({
    this.store,
  });

  Store store;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
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
    this.info,
    this.favourites,
    this.storeContacts,
    this.storeWorksDays,
  });

  int id;
  String name;
  String image;
  String email;
  String phone;
  String district;
  String longitude;
  String latitude;
  String info;
  int favourites;
  List<StoreContact> storeContacts;
  List<StoreWorksDay> storeWorksDays;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    email: json["email"],
    phone: json["phone"],
    district: json["district"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    // openFrom: json["open_from"],
    // closedAt: json["closed_at"],
    info: json["info"],
    favourites: json["favourites"],
    storeContacts: null?null:List<StoreContact>.from(json["store_contacts"].map((x) => StoreContact.fromJson(x))),
  storeWorksDays:null?[]:List<StoreWorksDay>.from(json["store_works_days"].map((x) => StoreWorksDay.fromJson(x))),
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
    // "open_from": openFrom,
    // "closed_at": closedAt,
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

// To parse this JSON data, do
//
//     final worksDays = worksDaysFromJson(jsonString);


WorksDays worksDaysFromJson(String str) => WorksDays.fromJson(json.decode(str));

String worksDaysToJson(WorksDays data) => json.encode(data.toJson());

class WorksDays {
  WorksDays({
    this.storeWorksDays,
  });

  List<StoreWorksDay> storeWorksDays;

  factory WorksDays.fromJson(Map<String, dynamic> json) => WorksDays(
    storeWorksDays: List<StoreWorksDay>.from(json["store_works_days"].map((x) => StoreWorksDay.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "store_works_days": List<dynamic>.from(storeWorksDays.map((x) => x.toJson())),
  };
}

class StoreWorksDay {
  StoreWorksDay({
    this.id,
    this.storeId,
    this.doctorId,
    this.day,
    this.from,
    this.to,
    this.vac,
    this.dayId
  });

  int id;
  int dayId;
  int storeId;
  int doctorId;
  String day;
  String from;
  String to;
  String vac;

  factory StoreWorksDay.fromJson(Map<String, dynamic> json) => StoreWorksDay(
    id: json["id"],
    storeId: json["store_id"],
    doctorId: json["doctor_id"],
    day: json["day"],
    from: json["from"],
    to: json["to"],
    vac: json["vac"],
    dayId: json["day_id"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "store_id": storeId,
    "doctor_id": doctorId,
    "day": day,
    "from": from,
    "to": to,
    "vac": vac,
  };
}

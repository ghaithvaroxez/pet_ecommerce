// To parse this JSON data, do
//
//     final statusModel = statusModelFromJson(jsonString);

import 'dart:convert';

StatusModel statusModelFromJson(String str) => StatusModel.fromJson(json.decode(str));

String statusModelToJson(StatusModel data) => json.encode(data.toJson());

class StatusModel {
  StatusModel({
    this.statusAll,
  });

  List<StatusAll> statusAll;

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
    statusAll: List<StatusAll>.from(json["status_all"].map((x) => StatusAll.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_all": List<dynamic>.from(statusAll.map((x) => x.toJson())),
  };
}

class StatusAll {
  StatusAll({
    this.id,
    this.storeId,
    this.userId,
    this.image,
    this.type,
    this.duration
  });

  int id;
  dynamic storeId;
  dynamic userId;
  String image;
  String type;
  String thumb;
int duration;
  factory StatusAll.fromJson(Map<String, dynamic> json) => StatusAll(
    id: json["id"],
    storeId: json["store_id"],
    userId: json["user_id"],
    image: json["image"],
    type: json["type"],
    duration: json["duration"]==""?15:json["duration"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "store_id": storeId,
    "user_id": userId,
    "image": image,
  };

}

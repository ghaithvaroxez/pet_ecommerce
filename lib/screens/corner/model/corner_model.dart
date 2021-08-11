// To parse this JSON data, do
//
//     final cornersModel = cornersModelFromJson(jsonString);

import 'dart:convert';

CornersModel cornersModelFromJson(String str) => CornersModel.fromJson(json.decode(str));

String cornersModelToJson(CornersModel data) => json.encode(data.toJson());

class CornersModel {
  CornersModel({
    this.corners,
  });

  List<Corner> corners;

  factory CornersModel.fromJson(Map<String, dynamic> json) => CornersModel(
    corners: List<Corner>.from(json["corners"].map((x) => Corner.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "corners": List<dynamic>.from(corners.map((x) => x.toJson())),
  };
}

class Corner {
  Corner({
    this.id,
    this.storeId,
    this.storeName,
    this.userId,
    this.userName,
    this.doctorName,
    this.name,
    this.desc,
    this.image,
    this.images,
  });

  int id;
  int storeId;
  String storeName;
  int userId;
  String userName;
  String doctorName;
  String name;
  String desc;
  String image;
  List<Img> images;

  factory Corner.fromJson(Map<String, dynamic> json) => Corner(
    id: json["id"],
    storeId: json["store_id"]==""?-1:json["store_id"],
    storeName: json["store_name"],
    userId: json["user_id"]==""?-1:json["user_id"],
    userName: json["user_name"],
    doctorName: json["doctor_name"],
    name: json["name"],
    desc: json["desc"],
    image: json["image"],
    images: List<Img>.from(json["images"].map((x) => Img.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "store_id": storeId,
    "store_name": storeName,
    "user_id": userId,
    "user_name": userName,
    "doctor_name": doctorName,
    "name": name,
    "desc": desc,
    "image": image,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Img {
  Img({
    this.id,
    this.path,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int id;
  String path;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  factory Img.fromJson(Map<String, dynamic> json) => Img(
    id: json["id"],
    path: json["path"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "path": path,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    this.cornerId,
    this.imageId,
  });

  int cornerId;
  int imageId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    cornerId: json["corner_id"],
    imageId: json["image_id"],
  );

  Map<String, dynamic> toJson() => {
    "corner_id": cornerId,
    "image_id": imageId,
  };
}

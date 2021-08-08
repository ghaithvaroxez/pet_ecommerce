// To parse this JSON data, do
//
//     final imagesModel = imagesModelFromJson(jsonString);

import 'dart:convert';

ImagesModel imagesModelFromJson(String str) => ImagesModel.fromJson(json.decode(str));

String imagesModelToJson(ImagesModel data) => json.encode(data.toJson());

class ImagesModel {
  ImagesModel({
    this.images,
  });

  List<Image> images;

  factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Image {
  Image({
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

  factory Image.fromJson(Map<String, dynamic> json) => Image(
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
    this.storeId,
    this.imageId,
  });

  int storeId;
  int imageId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    storeId: json["store_id"],
    imageId: json["image_id"],
  );

  Map<String, dynamic> toJson() => {
    "store_id": storeId,
    "image_id": imageId,
  };
}

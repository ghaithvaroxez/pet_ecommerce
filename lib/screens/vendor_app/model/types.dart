// To parse this JSON data, do
//
//     final types = typesFromJson(jsonString);

import 'dart:convert';

Types typesFromJson(String str) => Types.fromJson(json.decode(str));

String typesToJson(Types data) => json.encode(data.toJson());

class Types {
  Types({
    this.productTypes,
  });

  List<ProductType> productTypes;

  factory Types.fromJson(Map<String, dynamic> json) => Types(
        productTypes: List<ProductType>.from(
            json["product_types"].map((x) => ProductType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_types":
            List<dynamic>.from(productTypes.map((x) => x.toJson())),
      };
}

class ProductType {
  ProductType({
    this.id,
    this.name,
    this.image,
  });

  int id;
  String name;
  String image;

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

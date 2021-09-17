// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  Categories({
    this.categories,
  });

  List<Category> categories;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.image,
    this.error=false
  });
  bool b;
bool error;
  int id;
  String name;
  String image;


  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

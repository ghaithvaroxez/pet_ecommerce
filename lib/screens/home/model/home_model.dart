// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

import 'package:pets/screens/status/model/status_model.dart';
import 'package:pets/screens/stores/model/all_stores.dart';
import 'package:pets/screens/vendor_app/model/categories.dart';
import 'package:pets/screens/vendor_app/model/product.dart';
import '../../doctors/model/all_doctors.dart';
import 'package:pets/screens/stores/model/custoer_store_offer.dart';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.categories,
    this.slides,
    this.products,
    this.status,
    this.stores,
    this.doctors,
    this.offers,
    this.barns,
    this.sieves,
  });

  List<Category> categories;
  List<Slide> slides;
  List<StoreProduct> products;
  List<StatusAll> status;
  List<Store> stores;
  List<Doctor> doctors;
  List<Offer> offers;
  List<Store> barns;
  List<Store> sieves;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        slides: List<Slide>.from(json["slides"].map((x) => Slide.fromJson(x))),
        products: List<StoreProduct>.from(
            json["products"].map((x) => StoreProduct.fromJson(x))),
        status: List<StatusAll>.from(
            json["subjects"].map((x) => StatusAll.fromJson(x))),
        stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
        doctors:
            List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x))),
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
        barns: List<Store>.from(json["barns"].map((x) => Store.fromJson(x))),
        sieves: List<Store>.from(json["sieves"].map((x) => Store.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "slides": List<dynamic>.from(slides.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "status": List<dynamic>.from(status.map((x) => x.toJson())),
        "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
        "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
        "barns": List<dynamic>.from(barns.map((x) => x.toJson())),
        "sieves": List<dynamic>.from(sieves.map((x) => x)),
      };
}

class Slide {
  Slide({
    this.id,
    this.title,
    this.body,
    this.image,
  });

  int id;
  String title;
  String body;
  String image;

  factory Slide.fromJson(Map<String, dynamic> json) => Slide(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "image": image,
      };
}

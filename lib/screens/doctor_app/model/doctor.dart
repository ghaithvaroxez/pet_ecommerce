// To parse this JSON data, do
//
//     final doctorModel = doctorModelFromJson(jsonString);

import 'dart:convert';

import 'package:pets_ecommerce/screens/vendor_app/model/store.dart';

DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());

class DoctorModel {
  DoctorModel({
    this.doctor,
  });

  Doctor doctor;

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    doctor: Doctor.fromJson(json["doctor"]),
  );

  Map<String, dynamic> toJson() => {
    "doctor": doctor.toJson(),
  };
}

class Doctor {
  Doctor({
    this.id,
    this.firstName,
    this.lastName,
    this.address,
    this.email,
    this.mobile,
    this.doctorContacts,
    this.doctorServices,
    this.image,
    this.openFrom,
    this.info,
    this.closeAt,
    this.doctorWorkDays,
    this.long,
    this.lat
  });

  int id;
  String firstName;
  String lastName;
  String address;
  String email;
  String mobile;
  List<DoctorContact> doctorContacts;
  List<DoctorService> doctorServices;
  String image;
String openFrom;
String closeAt;
String info;
List<StoreWorksDay> doctorWorkDays;
double long;
double lat;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    address: json["district"],
    email: json["email"],
    mobile: json["mobile"],
    image: json["image"],
    openFrom: json["open_from"],
    closeAt: json["closed_at"],
    info: json["info"],
    doctorContacts: List<DoctorContact>.from(json["doctor_contacts"].map((x) => DoctorContact.fromJson(x))),
    doctorServices: List<DoctorService>.from(json["doctor_services"].map((x) => DoctorService.fromJson(x))),
    doctorWorkDays:List<StoreWorksDay>.from(json["doctor_works_days"].map((x) => StoreWorksDay.fromJson(x))),
    long: json["longitude"]==-1?-1.01:json["longitude"],
    lat: json["latitude"]==-1?-1.01:json["latitude"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "address": address,
    "email": email,
    "mobile": mobile,
    "doctor_contacts": List<dynamic>.from(doctorContacts.map((x) => x.toJson())),
    "doctor_services": List<dynamic>.from(doctorServices.map((x) => x.toJson())),
  };
}

class DoctorContact {
  DoctorContact({
    this.id,
    this.type,
    this.link,
    // this.createdAt,
    // this.updatedAt,
  });

  int id;
  String type;
  String link;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory DoctorContact.fromJson(Map<String, dynamic> json) => DoctorContact(
    id: json["id"],
    type: json["type"],
    link: json["link"],
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "link": link,
    // "created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
  };
}

class DoctorService {
  DoctorService({
    this.id,
    this.doctorId,
    this.categoryId,
    this.categoryName,
    this.desc,
    this.price,
    this.image,
    this.date,
    this.name
  });

  int id;
  dynamic doctorId;
  int categoryId;
  String categoryName;
  String desc;
  String price;
  String image;
  String date;
  String name;

  factory DoctorService.fromJson(Map<String, dynamic> json) => DoctorService(
    id: json["id"],
    doctorId: json["doctor_id"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    desc: json["desc"],
    price: json["price"],
    image: json["image"],
    date: json["date"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "category_id": categoryId,
    "category_name": categoryName,
    "desc": desc,
    "price": price,
    "image": image,
    "date": date,
  };
}



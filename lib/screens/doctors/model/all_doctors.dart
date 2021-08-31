// To parse this JSON data, do
//
//     final allDoctors = allDoctorsFromJson(jsonString);

import 'dart:convert';

AllDoctors allDoctorsFromJson(String str) => AllDoctors.fromJson(json.decode(str));

String allDoctorsToJson(AllDoctors data) => json.encode(data.toJson());

class AllDoctors {
  AllDoctors({
    this.doctors,
  });

  List<Doctor> doctors;

  factory AllDoctors.fromJson(Map<String, dynamic> json) => AllDoctors(
    doctors: List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
  };
}

class Doctor {
  Doctor({
    this.id,
    this.firstName,
    this.lastName,
    this.district,
    this.info,
    this.email,
    this.mobile,
    this.image,
    this.openFrom,
    this.closedAt,
    this.doctorContacts,
    this.doctorServices,
    this.favStatus,
    this.long,
    this.lat,
    this.error=false,
  });

  bool error;
  int id;
  String firstName;
  String lastName;
  String district;
  String info;
  String email;
  String mobile;
  String image;
  String openFrom;
  String closedAt;
  List<DoctorContact> doctorContacts;
  List<DoctorService> doctorServices;
  double lat;
  double long;

bool favStatus;
  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    district: json["district"],
    info: json["info"],
    email: json["email"],
    mobile: json["mobile"],
    image: json["image"],
    openFrom: json["open_from"],
    closedAt: json["closed_at"],
    doctorContacts:json["doctor_contacts"]==null?[]: List<DoctorContact>.from(json["doctor_contacts"].map((x) => DoctorContact.fromJson(x))),
    doctorServices:json["doctor_services"]==null?[]: List<DoctorService>.from(json["doctor_services"].map((x) => DoctorService.fromJson(x))),
 favStatus: json["fav_status"]==null?false:json["fav_status"],
    long: json["longitude"]==-1?-1.01:json["longitude"],
    lat: json["latitude"]==-1?-1.01:json["latitude"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "district": district,
    "info": info,
    "email": email,
    "mobile": mobile,
    "image": image,
    "open_from": openFrom,
    "closed_at": closedAt,
    "doctor_contacts": List<dynamic>.from(doctorContacts.map((x) => x.toJson())),
    "doctor_services": List<dynamic>.from(doctorServices.map((x) => x.toJson())),
  };
}

class DoctorContact {
  DoctorContact({
    this.id,
    this.storeId,
    this.doctorId,
    this.link,
    this.type,
  });

  int id;
  String storeId;
  int doctorId;
  String link;
  String type;

  factory DoctorContact.fromJson(Map<String, dynamic> json) => DoctorContact(
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

class DoctorService {
  DoctorService({
    this.id,
    this.doctorId,
    this.categoryId,
    this.categoryName,
    this.name,
    this.desc,
    this.price,
    this.image,
    this.date,
  });

  int id;
  dynamic doctorId;
  int categoryId;
  String categoryName;
  String name;
  String desc;
  String price;
  String image;
  String date;

  factory DoctorService.fromJson(Map<String, dynamic> json) => DoctorService(
    id: json["id"],
    doctorId: json["doctor_id"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    name: json["name"],
    desc: json["desc"],
    price: json["price"],
    image: json["image"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "category_id": categoryId,
    "category_name": categoryName,
    "name": name,
    "desc": desc,
    "price": price,
    "image": image,
    "date": date,
  };
}

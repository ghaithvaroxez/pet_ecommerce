// To parse this JSON data, do
//
//     final allDays = allDaysFromJson(jsonString);

import 'dart:convert';

AllDays allDaysFromJson(String str) => AllDays.fromJson(json.decode(str));

String allDaysToJson(AllDays data) => json.encode(data.toJson());

class AllDays {
  AllDays({
    this.days,
  });

  List<Day> days;

  factory AllDays.fromJson(Map<String, dynamic> json) => AllDays(
        days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "days": List<dynamic>.from(days.map((x) => x.toJson())),
      };
}

class Day {
  Day({
    this.id,
    this.day,
  });

  int id;
  String day;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        id: json["id"],
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day": day,
      };
}

// To parse this JSON data, do
//
//     final notificationsModel = notificationsModelFromJson(jsonString);

import 'dart:convert';

NotificationsModel notificationsModelFromJson(String str) =>
    NotificationsModel.fromJson(json.decode(str));

String notificationsModelToJson(NotificationsModel data) =>
    json.encode(data.toJson());

class NotificationsModel {
  NotificationsModel({
    this.notifications,
  });

  List<Notification> notifications;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
        notifications: List<Notification>.from(
            json["notifications"].map((x) => Notification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notifications":
            List<dynamic>.from(notifications.map((x) => x.toJson())),
      };
}

class Notification {
  Notification({
    this.id,
    this.type,
    this.image,
    this.title,
    this.body,
    this.userId,
    this.itemId,
    this.isRead,
    this.createdAt,
  });

  int id;
  String type;
  String image;
  String title;
  String body;
  int userId;
  int itemId;
  bool isRead;
  String createdAt;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        type: json["type"],
        image: json["image"],
        title: json["title"],
        body: json["body"],
        userId: json["user_id"],
        itemId: json["item_id"],
        isRead: json["is_read"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "image": image,
        "title": title,
        "body": body,
        "user_id": userId,
        "item_id": itemId,
        "is_read": isRead,
        "created_at": createdAt,
      };
}

// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromJson(jsonString);

import 'dart:convert';

OrdersModel ordersModelFromJson(String str) => OrdersModel.fromJson(json.decode(str));

String ordersModelToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
  OrdersModel({
    this.orders,
  });

  List<Order> orders;

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

class Order {
  Order({
    this.id,
    this.title,
    this.orderType,
    this.userId,
    this.userName,
    this.userImage,
    this.categoryId,
    this.categoryName,
    this.typeId,
    this.typeName,
    this.question,
    this.image,
    this.price,
    this.date,
    this.answers,
  });

  int id;
  String title;
  String orderType;
  int userId;
  String userName;
  String userImage;
  int  categoryId;
  String categoryName;
  int typeId;
  String typeName;
  String question;
  String image;
  int price;
  String date;
  List<Answer> answers;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    title: json["title"],
    orderType: json["order_type"],
    userId: json["user_id"],
    userName: json["user_name"] == null ? null : json["user_name"],
    userImage: json["user_image"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    typeId: json["type_id"],
    typeName: json["type_name"],
    question: json["question"],
    image: json["image"],
    price: json["price"],
    date: json["date"],
    answers:json["answers"]==null?[]: List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "order_type": orderType,
    "user_id": userId,
    "user_name": userName == null ? null : userName,
    "user_image": userImage,
    "category_id": categoryId,
    "category_name": categoryName,
    "type_id": typeId,
    "type_name": typeName,
    "question": question,
    "image": image,
    "price": price,
    // "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
  };
}

class Answer {
  Answer({
    this.id,
    this.orderId,
    this.answeredType,
    this.answeredStoreId,
    this.answeredId,
    this.answeredName,
    this.answeredImage,
    this.userId,
    this.userName,
    this.question,
    this.answer,
    // this.publish,
    this.price,
    this.image,
    this.answeredStoreImage,
    this.answeredStoreName
  });

  int id;
  int orderId;
  String answeredType;
  int answeredStoreId;
  String answeredStoreImage;
  String answeredStoreName;
  int answeredId;
  dynamic answeredName;
  String answeredImage;
  int userId;
  var userName;
  String question;
  String answer;
  // String publish;
  int price;
  String image;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    id: json["id"],
    orderId: json["order_id"],
    answeredType: json["answered_type"],
    answeredStoreId: json["answered_store_id"],
    answeredId: json["answered_id"],
    answeredName: json["answered_name"],
    answeredImage: json["answered_image"],
    userId: json["user_id"],
    userName: json["user_name"],
    question: json["question"],
    answer: json["answer"],
    // publish: json["publish"],
    price: json["price"]==""?0:json["price"],
    image: json["image"],
    answeredStoreImage: json["answered_store_image"],
    answeredStoreName: json["answered_store_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "answered_type": answeredType,
    "answered_store_id": answeredStoreId,
    "answered_id": answeredId,
    "answered_name": answeredName,
    "answered_image": answeredImage,
    "user_id": userId,
    "user_name": userName,
    "question": question,
    "answer": answer,
    // "publish": publish,
    "price": price,
    "image": image,
  };
}

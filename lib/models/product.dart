import 'dart:io';

import 'package:flutter/material.dart';

class Product{
  String name;
  String price;
  String desc;
  bool isAvailable;
  String date;
  File img;
  String category;
  String type;
Product({this.name,this.price,this.desc,this.isAvailable,this.date,this.img,this.category,this.type,});
}
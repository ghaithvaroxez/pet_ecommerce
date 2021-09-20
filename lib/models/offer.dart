import 'dart:io';

import 'package:flutter/material.dart';

class Offer {
  String name;
  String desc;
  bool isAvailable;
  String date;
  File img;
  String category;
  String type;

  Offer({
    this.name,
    this.desc,
    this.isAvailable,
    this.date,
    this.img,
    this.category,
    this.type,
  });
}

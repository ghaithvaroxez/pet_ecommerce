import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitle extends GetxController {
  var title = "".obs;

  void updateTitle(String t) {
    title.value = t;
    update();
  }
}

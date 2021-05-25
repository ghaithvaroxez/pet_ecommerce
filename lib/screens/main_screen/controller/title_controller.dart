import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shape_of_view/generated/i18n.dart';

class CustomTitle extends GetxController
{
  var title="".obs;

  void updateTitle(String t)
  {
    title.value=t;
    update();
  }

}



import 'package:flutter/material.dart';


class AnimalTypeModel
{

  final String type;
  final List<String> typeNames;
  int selectedTypeIndex=0;
  AnimalTypeModel({@required this.type,@required this.typeNames});

}
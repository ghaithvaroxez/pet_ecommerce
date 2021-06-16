import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class blablaPage extends StatelessWidget {
  final blablaLogic logic = Get.put(blablaLogic());
  final blablaState state = Get.find<blablaLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

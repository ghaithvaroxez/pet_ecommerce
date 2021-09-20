import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/screens/corner/model/corner_model.dart';
import '../requests/my_corner_requests.dart';
import 'package:get/get.dart';

class MyCornersListController extends GetxController {
  List<Corner> corners = [];
  bool loading = false;
  MyCornersRequests myCornersRequests = MyCornersRequests();

  getCorners() async {
    var corner = await myCornersRequests.getAllCorners();
    corners = corner.corners;
    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    init();
  }

  init() async {
    setLoading();
    await myCornersRequests.getmodel();
    await getCorners();
    removeLoading();
    update();
  }

  addCorner(@required String cornerImage, @required String name,
      @required String desc, @required List<String> subImages) async {
    try {
      setLoading();
      bool k =
          await myCornersRequests.addCorner(cornerImage, name, desc, subImages);
      if (k) {
        Get.back();
        Get.rawSnackbar(
            message: "لقد تم اضافة زاويتك بنجاح ",
            backgroundColor: Colors.green);
        await getCorners();

        removeLoading();
      } else {
        Get.rawSnackbar(
            message: "عذرا حدث خطأ ما الرجاء المحاولة مرة أخرى ",
            backgroundColor: Colors.redAccent);
        Get.back();
        removeLoading();
      }
    } catch (e) {
      consolePrint(e.toString());
      Get.rawSnackbar(
          message: "عذرا حدث خطأ ما الرجاء المحاولة مرة أخرى ",
          backgroundColor: Colors.redAccent);
      Get.back();
      removeLoading();
    }
    update();
  }

  deleteCorner(int id) async {
    try {
      setLoading();
      bool k = await myCornersRequests.deleteCorner(id);
      if (k) {
        Get.rawSnackbar(
            message: "لقد تم حذف زاويتك بنجاح ", backgroundColor: Colors.green);
        await getCorners();
        removeLoading();
      } else {
        Get.rawSnackbar(
            message: "عذرا حدث خطأ ما الرجاء المحاولة مرة أخرى ",
            backgroundColor: Colors.redAccent);
        removeLoading();
      }
    } catch (e) {
      consolePrint(e.toString());
      Get.rawSnackbar(
          message: "عذرا حدث خطأ ما الرجاء المحاولة مرة أخرى ",
          backgroundColor: Colors.redAccent);
      removeLoading();
    }
    update();
  }

  //state management
  setLoading() {
    loading = true;
    update();
  }

  removeLoading() {
    loading = false;
    update();
  }
}

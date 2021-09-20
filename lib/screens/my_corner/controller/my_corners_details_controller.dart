import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/screens/corner/model/corner_model.dart';
import 'package:pets/screens/my_corner/view/my_corners_list.dart';
import '../requests/my_corner_requests.dart';
import 'package:get/get.dart';

class MyCornersDetailsController extends GetxController {
  bool loading = false;
  MyCornersRequests myCornersRequests = MyCornersRequests();
  Corner currentCorner;
  int cId;

  MyCornersDetailsController(this.cId);

  getCorner() async {
    currentCorner = await myCornersRequests.getCornerId(cId);
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
    await getCorner();
    removeLoading();
    update();
  }

  addSubImage(String image) async {
    setLoading();

    try {
      bool k = await myCornersRequests.addSubPhoto(image, cId);
      if (k == true) {
        await getCorner();
        // Get.back();
        removeLoading();
      } else {
        // Get.back();
        removeLoading();
        Get.rawSnackbar(
            message: "can't add your photo now try again later",
            backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      // Get.back();
      removeLoading();
      Get.rawSnackbar(
          message: "can't add your photo now try again later",
          backgroundColor: Colors.redAccent);
    }
    update();
  }

  subImageToStory(int id) async {
    setLoading();

    try {
      bool k = await myCornersRequests.subPhotoToStory(id);
      if (k == true) {
        await getCorner();
        // Get.back();
        removeLoading();
      } else {
        // Get.back();
        removeLoading();
        Get.rawSnackbar(
            message: "can't add your photo to story now try again later",
            backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      // Get.back();
      removeLoading();
      Get.rawSnackbar(
          message: "can't add your photo to story now try again later",
          backgroundColor: Colors.redAccent);
    }
    update();
  }

  deleteSubImage(int imageId) async {
    setLoading();

    try {
      bool k = await myCornersRequests.deleteSubPhoto(imageId);
      if (k == true) {
        await getCorner();
        // Get.back();
        removeLoading();
        update();
      } else {
        // Get.back();
        removeLoading();
        update();
        Get.rawSnackbar(
            message: "can't delete your photo now try again later",
            backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      Get.back();
      removeLoading();
      update();
      Get.rawSnackbar(
          message: "can't delete your photo now try again later",
          backgroundColor: Colors.redAccent);
    }
  }

  editCorner(String name, String desc, String image, bool newImage) async {
    consolePrint("in my corner controller image:" + image);
    consolePrint("in my corner controller bool image:" + newImage.toString());
    setLoading();

    try {
      bool k = await myCornersRequests.editCorner(
          newImage ? image : null, name, desc, cId);
      if (k == true) {
        await getCorner();
        await cornerController.init();
        Get.back();
        removeLoading();
        update();
      } else {
        Get.back();
        await cornerController.init();
        removeLoading();
        update();
        Get.rawSnackbar(
            message: "can't edit your corner now try again later",
            backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      Get.back();
      removeLoading();
      update();
      Get.rawSnackbar(
          message: "can't edit your corner  now try again later",
          backgroundColor: Colors.redAccent);
    }
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

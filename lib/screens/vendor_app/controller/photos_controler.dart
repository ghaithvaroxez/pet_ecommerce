import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/enums.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/product.dart';
import 'package:pets_ecommerce/screens/vendor_app/requests/photos_requests.dart';
import '../model/image_model.dart' as im;
class VendorPhotosController extends GetxController{

  List<im.Image> images=[];
  VendorAppPhotosReq vendorAppPhotosReq=VendorAppPhotosReq();
  bool loading=false;
  getPhotos()async {
    var imageModel=await vendorAppPhotosReq.getStoreImages();
    consolePrint("kkkkkkkkkkkkkkkkkkkkkkk  after request");
    consolePrint(imageModel.toString());
    images=imageModel.images;
    update();
  }
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    init();
  }
  init()async{
    await vendorAppPhotosReq.getmodel();
    await  getPhotos();
  }
  addNewImage(
      {@required String image})async
  {
    activeLoading();

    try{
      bool k = await vendorAppPhotosReq.addPhoto(
     image);
      if (k == true) {
        await getPhotos();
        // Get.back();
        removeLoading();
      } else {
        // Get.back();
        removeLoading();
        Get.rawSnackbar(
            message: "can't add your photo now try again later",
            backgroundColor: Colors.redAccent);
      }
    }catch(e)
    {
      // Get.back();
      removeLoading();
      Get.rawSnackbar(
          message: "can't add your photo now try again later",
          backgroundColor: Colors.redAccent);
    }
    update();

  }

  deletePhoto(int  imageID)
  async {
    activeLoading();

    try {
      bool k = await vendorAppPhotosReq.deletePhoto(
        // category_id: product.categoryId,
        // type_id: product.typeId,
        // name_ar: product.name,
        // name_en: product.name,
        // body_ar: product.body,
        // body_en: product.body,
        // image: product.image,
          imageID);
      if (k == true) {
        await getPhotos();
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
    } catch(e) {
      Get.back();
      removeLoading();
      update();
      Get.rawSnackbar(
          message: "can't delete your photo now try again later",
          backgroundColor: Colors.redAccent);
    }
  }
  ///state_management

  activeLoading(){
    loading=true;
    update();
  }
  removeLoading(){
    loading=false;
    update();
  }



}


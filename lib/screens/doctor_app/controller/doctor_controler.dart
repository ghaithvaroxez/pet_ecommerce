import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/screens/doctor_app/model/doctor.dart';
import 'package:pets_ecommerce/screens/doctor_app/requests/doctor_info_requests.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/location_model.dart';

import 'dart:io';
import 'package:image/image.dart' as Im;
class DoctorController extends GetxController {
  DoctorModel doctorModel;
  // LocationModel locationModel;
  bool init=false;
  DoctorAppRequests doctorAppRequests = DoctorAppRequests();
  bool isLoading = false;

  fetchData() async {
    setLoading();
    await doctorAppRequests.getModel();
    await getDoctorInfo();
    // locationModel= await vendorAppRequests.getLocations();
    init=true;
    removeLoading();
    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  getDoctorInfo() async {
    doctorModel = await doctorAppRequests
        .getDoctorInfo();
removeLoading();
update();
  }

  changeLocation(int value) async {
    try {
      setLoading();
      bool k =await doctorAppRequests.updateAddress(address: value);
      if ( k== true) {
        await getDoctorInfo();
        removeLoading();
      } else {
        removeLoading();
        Get.rawSnackbar(
            message: "error can't update doctor data now try again later !!",
            backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      removeLoading();
    }
    update();
  }


  changeImage(String path) async {
    try {
      setLoading();
      bool k =await doctorAppRequests.updateImage(img: path);
      if ( k== true) {
        await getDoctorInfo();
        removeLoading();
      } else {
        removeLoading();
        Get.rawSnackbar(
            message: "error can't update store data now try again later !!",
            backgroundColor: Colors.redAccent);
        update();
      }
    } catch (e) {
      removeLoading();
      update();
    }

  }


  changeTime(String t1,String t2) async {
    try {
      setLoading();
      bool k =await doctorAppRequests.updateOpenAtCloseAt(openAt: t1,closeAt: t2);
      if ( k== true) {
        await getDoctorInfo();
        removeLoading();
      } else {
        removeLoading();
        Get.rawSnackbar(
            message: "error can't update store Times now try again later !!",
            backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      removeLoading();
    }
    update();

  }

  changeEmail(String email) async {
    try {
      setLoading();
      bool k =await doctorAppRequests.updateEmail(email: email);
      if ( k== true) {
        await getDoctorInfo();
        removeLoading();
      } else {
        removeLoading();
        Get.rawSnackbar(
            message: "error can't update store Times now try again later !!",
            backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      removeLoading();
    }
    update();

  }



  changeInfo(String info) async {
    try {
      setLoading();
      bool k =await doctorAppRequests.updateInfo(info: info);
      if ( k== true) {
        await getDoctorInfo();
        removeLoading();
      } else {
        removeLoading();
        Get.rawSnackbar(
            message: "error can't update store Times now try again later !!",
            backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      removeLoading();
    }
    update();

  }



  changeSocial({String link, String type, int socialId}) async {
    try {
      setLoading();
      bool k =await doctorAppRequests.updateSocial(link: link,type: type,SocialId: socialId);
      if ( k== true) {
        await getDoctorInfo();
        removeLoading();
      } else {
        removeLoading();
        Get.rawSnackbar(
            message: "error can't update contact now try again later !!",
            backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      removeLoading();
    }
    update();
  }

  AddSocial({String link, String type}) async {
    try {
      setLoading();
      bool k =await doctorAppRequests.addSocial(link: link,type: type);
      if ( k== true) {
        await getDoctorInfo();
        removeLoading();
      } else {
        removeLoading();
        Get.rawSnackbar(
            message: "error add contact now try again later !!",
            backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      removeLoading();
    }
    update();

  }

  DeleteSocial(int socialId ) async {
    try {
      setLoading();
      bool k =await doctorAppRequests.deleteSocial(SocialId: socialId);
      if ( k== true) {
        await getDoctorInfo();
        removeLoading();
      } else {
        removeLoading();
        Get.rawSnackbar(
            message: "error can't delete it  now try again later !!",
            backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      removeLoading();
    }
    update();

  }

  addNewService(
      {
        @required int category_id,
        // @required int type_id,
        @required String name_ar,
        @required String name_en,
        @required String body_ar,
        @required String body_en,
        @required String image,
        @required String price})async
  {
    setLoading();

    try{
      bool k = await doctorAppRequests.AddService(
          category_id: category_id,
          // type_id: type_id,
          name_ar: name_ar,
          name_en: name_en,
          body_ar: body_ar,
          body_en: body_en,
          image: image,
          price: price
      );
      if (k == true) {
        await getDoctorInfo();
        Get.back();
        removeLoading();
      } else {
        Get.back();
        removeLoading();
        Get.rawSnackbar(
            message: "can't add your product now try again later",
            backgroundColor: Colors.redAccent);
      }
    }catch(e)
    {
      Get.back();
      removeLoading();
      Get.rawSnackbar(
          message: "can't add your product now try again later",
          backgroundColor: Colors.redAccent);
    }
    update();

  }

  deleteService(DoctorService service)
  async {
    setLoading();

    try{
      bool k = await doctorAppRequests.deleteService(
        // category_id: product.categoryId,
        // type_id: product.typeId,
        // name_ar: product.name,
        // name_en: product.name,
        // body_ar: product.body,
        // body_en: product.body,
        // image: product.image,
          ServiceId: service.id);
      if (k == true) {
        await getDoctorInfo();
        Get.back();
        removeLoading();
        update();
      } else {
        Get.back();
        removeLoading();
        update();
        Get.rawSnackbar(
            message: "can't delete your product now try again later",
            backgroundColor: Colors.redAccent);
      }
    }catch(e){
      Get.back();
      removeLoading();
      update();
      Get.rawSnackbar(
          message: "can't delete your product now try again later",
          backgroundColor: Colors.redAccent);
    }
  }


  editService(DoctorService service,String newImage)
  async {
    setLoading();

    try{
      bool k = await doctorAppRequests.UpdateService(
        category_id: service.categoryId,
        // type_id: product.typeId,
        // name_ar: product.name,
        // name_en: product.name,
        body_ar: service.desc,
        body_en: service.desc,
        serviceId: service.id,
        price: service.price,
        image: newImage == "" ? null : newImage,
      );
      if (k == true) {
        await getDoctorInfo();
        Get.back();
        removeLoading();
        update();
      } else {
        Get.back();
        removeLoading();
        update();
        Get.rawSnackbar(
            message: "can't edit your product now try again later",
            backgroundColor: Colors.redAccent);
      }
    }catch(e){

      Get.back();
      removeLoading();
      update();
      Get.rawSnackbar(
          message: "can't edit your product now try again later",
          backgroundColor: Colors.redAccent);

    }
  }


  setLoading() {
    isLoading = true;
    update();
  }

  removeLoading() {
    isLoading = false;
    update();
  }
}

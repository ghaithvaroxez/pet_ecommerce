import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/screens/vendor_app/model/location_model.dart';
import '../model/store.dart';
import '../requests/vendor_app_requests.dart';
import 'dart:io';
import 'package:image/image.dart' as Im;
import 'package:pets/screens/stores/model/custome_store_body.dart';

class VendorInfoController extends GetxController {
  CustomerStoreBody storeInfo;
  LocationModel locationModel;
  bool init=false;
  VendorAppRequests vendorAppRequests = VendorAppRequests();
  bool isLoading = false;

  fetchData() async {
    setLoading();
    await vendorAppRequests.getModel();
    await getStoreInfo();
   locationModel= await vendorAppRequests.getLocations();
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

  getStoreInfo() async {
    storeInfo = await vendorAppRequests
        .getStoreInfo();
    update();
  }
setLatLong(double lat,double long)
async{
  try {
    setLoading();
    bool k =await vendorAppRequests.setLatLong(lat: lat,long: long);
    if ( k== true) {
      await getStoreInfo();
      removeLoading();
    } else {
      removeLoading();
      Get.rawSnackbar(
          message: "error can't set your location now try again later !!",
          backgroundColor: Colors.redAccent);
    }
  } catch (e) {
    removeLoading();
    Get.rawSnackbar(
        message: "error can't set your location now try again later !!",
        backgroundColor: Colors.redAccent);
    consolePrint(e.toString());
  }
  update();
}

  changeLocation(int value) async {
    try {
      setLoading();
      bool k =await vendorAppRequests.updateAddress(address: value);
      if ( k== true) {
       await getStoreInfo();
        removeLoading();
      } else {
        removeLoading();
        Get.rawSnackbar(
            message: "error can't update store data now try again later !!",
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
      bool k =await vendorAppRequests.updateImage(img: path);
      if ( k== true) {
       await getStoreInfo();
        removeLoading();
      } else {
        removeLoading();
        Get.rawSnackbar(
            message: "error can't update store data now try again later !!",
            backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      removeLoading();
    }
    update();
  }


  addTime(int id,String t1,String t2,bool vacation) async {
    try {
      setLoading();
      bool k =await vendorAppRequests.addOpenAtCloseAt(id:id,openAt: t1,closeAt: t2,
          // vacation: vacation?"vacation":""
      );
      if ( k== true) {
       await getStoreInfo();
        removeLoading();
      } else {
        removeLoading();
        Get.rawSnackbar(
            message: "error can't update store Times now try again later !!",
            backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      consolePrint(e.toString());
      removeLoading();
    }
    update();

  }

  editTime(int id,String t1,String t2,bool vacation) async {
    try {
      setLoading();
      consolePrint("id:"+id.toString());
      consolePrint("from:"+t1.toString());
      consolePrint("to:"+t2.toString());
      bool k =await vendorAppRequests.editOpenAtCloseAt(id:id,openAt: t1,closeAt: t2,vacation: vacation?"vacation":"b");
      if ( k== true) {
       await getStoreInfo();
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
  deleteTime(int id) async {
    try {
      setLoading();
      bool k =await vendorAppRequests.deleteOpenAtCloseAt(id:id,);
      if ( k== true) {
       await getStoreInfo();
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
      bool k =await vendorAppRequests.updateEmail(email: email);
      if ( k== true) {
       await getStoreInfo();
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
      bool k =await vendorAppRequests.updateInfo(info: info);
      if ( k== true) {
       await getStoreInfo();
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
      bool k =await vendorAppRequests.updateSocial(link: link,type: type,SocialId: socialId);
      if ( k== true) {
       await getStoreInfo();
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
      bool k =await vendorAppRequests.addSocial(link: link,type: type,Storeid: storeInfo.store.id);
      if ( k== true) {
       await getStoreInfo();
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
      bool k =await vendorAppRequests.deleteSocial(SocialId: socialId);
      if ( k== true) {
       await getStoreInfo();
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



  setLoading() {
    isLoading = true;
    update();
  }

  removeLoading() {
    isLoading = false;
    update();
  }
}


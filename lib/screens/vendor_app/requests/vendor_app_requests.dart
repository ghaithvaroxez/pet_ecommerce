import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/screens/auth/controller/services/auth_services.dart';
import 'package:pets_ecommerce/screens/auth/model/user.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/location_model.dart';
import 'package:pets_ecommerce/services/http_requests_service.dart';
import '../model/store.dart';

class VendorAppRequests extends HttpService {
  UserModel vendor;

  getModel() async {
    vendor = await AuthServices.getCurrentUser();
    consolePrint(vendor.store[0].id.toString());
  }

  Future<Store> getStoreInfo() async
  {
    consolePrint("id:" + vendor.store[0].id.toString());
    final apiResult = await getRequest(
      Api.getStoreBodyId + '/' + vendor.store[0].id.toString(),
      queryParameters: null,
    );
    return StoreModel.fromJson(apiResult.data).store;
    // StoreModel storeModel= storeModelFromJson(apiResult.data["store"]);
    //
    // return storeModel.store;
  }
  Future<LocationModel> getLocations() async
  {

    final apiResult = await getRequest(
      Api.getLocations ,
      queryParameters: null,
    );
    if(apiResult.statusCode==200)
    return LocationModel.fromJson(apiResult.data);
    // StoreModel storeModel= storeModelFromJson(apiResult.data["store"]);
    //
    // return storeModel.store;
  }


Future<bool> updateAddress({
  // int openAt,
  // int closeAt,
  // String img,
  // String email,
  int address,
})
async {
  FormData formData =
  new FormData.fromMap({
    // openAt!=null?? "open_from":openAt,
    // closeAt!=null?? "closed_at":closeAt,
    // img!=null??  "image":
    // await MultipartFile.fromFile(img),
    // email!=null?? "email":email,
    "district_id": address,
  });

  try {
    final apiResult = await postRequest(
        Api.updateStore, formData, includeHeaders: true);
    if (apiResult.statusCode == 200)
      if (apiResult.data["status"] == true) {
        return true;
      }
      else
        return false;
  }
  catch (e) {
    return false;
  }
}

Future<bool> updateEmail({
  // int openAt,
  // int closeAt,
  // String img,
  String email,
  // String address,
})
async {
  FormData formData =
  new FormData.fromMap({
    // openAt!=null?? "open_from":openAt,
    // closeAt!=null?? "closed_at":closeAt,
    // img!=null??  "image":
    // await MultipartFile.fromFile(img),
    "email": email,
    // "address":address,
  });

  try {
    final apiResult = await postRequest(
        Api.updateStore, formData, includeHeaders: true);
    if (apiResult.statusCode == 200)
      if (apiResult.data["status"] == true) {
        return true;
      }
      else
        return false;
  }
  catch (e) {
    return false;
  }
}

Future<bool> updateInfo({
  // int openAt,
  // int closeAt,
  // String img,
  String info,
  // String address,
})
async {
  FormData formData =
  new FormData.fromMap({
    // openAt!=null?? "open_from":openAt,
    // closeAt!=null?? "closed_at":closeAt,
    // img!=null??  "image":
    // await MultipartFile.fromFile(img),
    // "email": email,
    // "address":address,
     "info":info,

  });

  try {
    final apiResult = await postRequest(
        Api.updateStore, formData, includeHeaders: true);
    if (apiResult.statusCode == 200)
      if (apiResult.data["status"] == true) {
        return true;
      }
      else
        return false;
  }
  catch (e) {
    return false;
  }
}

Future<bool> updateImage({
  // int openAt,
  // int closeAt,
  String img,
  // String email,
  // String address,
})
async {

    consolePrint("image:"+img);
    // var x=await MultipartFile./fromFile(img,filename: "img");
    // FormData formdata = new FormData();
    // formdata.add("image", new UploadFileInfo(_image, basename(img)));
  FormData formData =
   FormData.fromMap({
    // openAt!=null?? "open_from":openAt,
    // closeAt!=null?? "closed_at":closeAt,
    "image":
   img,
    // email!=null?? "email":email,
    // "address":address,
  });

  try {
    final apiResult = await postRequest(
        Api.updateStore, formData, includeHeaders: true);
    // consolePrint(" image result "+apiResult.data["status"]);
    if (apiResult.statusCode == 200)
      if (apiResult.data["status"] == true) {
        return true;
      }
      else
        return false;
  }
  catch (e) {
    return false;
  }
}

Future<bool> updateOpenAtCloseAt({
  String openAt,
  String closeAt,
  // String img,
  // String email,
  // String address,
})
async {
  FormData formData =
  new FormData.fromMap({
  "open_from":openAt,
    "closed_at":closeAt,
    // img!=null??  "image":
    // await MultipartFile.fromFile(img),
    // email!=null?? "email":email,
    // "address":address,
  });

  try{
    final apiResult =await postRequest(
        Api.updateStore, formData, includeHeaders: true);
    if(apiResult.statusCode==200)
      if(apiResult.data["status"]==true)
        {
          return true;
        }
    else return false;
  }
  catch(e)
  {
    return false;
  }
}

  Future<bool> updateSocial({
    // int openAt,
    // int closeAt,
    // String img,
    // String email,
    // String address,
String link,
    String type,
    int SocialId,
  })
  async {
    FormData formData =
    FormData.fromMap({
      // openAt!=null?? "open_from":openAt,
      // closeAt!=null?? "closed_at":closeAt,
      // email!=null?? "email":email,
      // "address":address,
      "type":type,
      "link":link,
    });

    try {
      final apiResult = await postRequest(
          Api.updateSocial+"/"+SocialId.toString(), formData, includeHeaders: true);
      // consolePrint(" image result "+apiResult.data["status"]);
      if (apiResult.statusCode == 200)
        if (apiResult.data["class"] == "success") {
          return true;
        }
        else
          return false;
    }
    catch (e) {
      return false;
    }
  }


  Future<bool> addSocial({
    // int openAt,
    // int closeAt,
    // String img,
    // String email,
    // String address,
String link,
    String type,
    int Storeid,
  })
  async {
    FormData formData =
    FormData.fromMap({
      // openAt!=null?? "open_from":openAt,
      // closeAt!=null?? "closed_at":closeAt,
      // email!=null?? "email":email,
      // "address":address,
      "type":type,
      "link":link,
      "store_id":Storeid
    });

    try {
      final apiResult = await postRequest(
          Api.addSocial, formData, includeHeaders: true);
      // consolePrint(" image result "+apiResult.data["status"]);
      if (apiResult.statusCode == 200)
        if (apiResult.data["class"] == "success") {
          return true;
        }
        else
          return false;
    }
    catch (e) {
      return false;
    }
  }

  Future<bool> deleteSocial({
    // int openAt,
    // int closeAt,
    // String img,
    // String email,
    // String address,
String link,
    String type,
    int SocialId,
  })
  async {
    FormData formData =
    FormData.fromMap({
      // openAt!=null?? "open_from":openAt,
      // closeAt!=null?? "closed_at":closeAt,
      // email!=null?? "email":email,
      // "address":address,
      // "type":type,
      // "link":link,
    });

    try {
      final apiResult = await postRequest(
          Api.deleteSocial+"/"+SocialId.toString(), formData, includeHeaders: true);
      // consolePrint(" image result "+apiResult.data["status"]);
      if (apiResult.statusCode == 200)
        if (apiResult.data["class"] == "success") {
          return true;
        }
        else
          return false;
    }
    catch (e) {
      return false;
    }
  }

}
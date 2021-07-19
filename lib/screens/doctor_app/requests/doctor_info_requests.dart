import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/screens/auth/controller/services/auth_services.dart';
import 'package:pets_ecommerce/screens/auth/model/user.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/categories.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/location_model.dart';
import 'package:pets_ecommerce/services/http_requests_service.dart';
import '../model/doctor.dart';

class DoctorAppRequests extends HttpService {
  UserModel doctor;

  getModel() async {
    doctor = await AuthServices.getCurrentUser();
    consolePrint("doctor Id :"+doctor.user.id.toString());
  }

  Future<DoctorModel> getDoctorInfo() async
  {
    consolePrint("doctor Id :"+doctor.user.id.toString());
    final apiResult = await getRequest(
      Api.getDoctorId + '/' + doctor.user.id.toString(),
      queryParameters: null,
    );

    if(apiResult.statusCode==200)
    return DoctorModel.fromJson(apiResult.data);
    // StoreModel storeModel= storeModelFromJson(apiResult.data["store"]);
    //
    // return storeModel.store;
  }

  Future<List<Category>> getStoreCategories() async
  {

    final apiResult = await getRequest(
      Api.categories,
      queryParameters: null,
    );

    return  List<Category>.from(apiResult.data["categories"].map((x) => Category.fromJson(x)));
    // StoreModel storeModel= storeModelFromJson(apiResult.data["store"]);

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
          Api.updateUser, formData, includeHeaders: true);
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
          Api.updateUser, formData, includeHeaders: true);
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
      "info_ar":info,
      "info_en":info,

    });

    try {
      final apiResult = await postRequest(
          Api.updateUser, formData, includeHeaders: true);
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
          Api.updateUser, formData, includeHeaders: true);
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
          Api.updateUser, formData, includeHeaders: true);
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
    // int Storeid,
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
      // "store_id":Storeid
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

  Future<bool> UpdateService
      ({
    @required int category_id,
    // @required int type_id,
    // @required String name_ar,
    // @required String name_en,
    @required String body_ar,
    @required String body_en,
    @required String image,
    @required String price,

    @required int serviceId,
  })
  async {
    FormData formData =
    new FormData.fromMap({
      "category_id":category_id,
      // "type_id":type_id,
      // "name_ar":name_ar,
      // "name_en":name_en,
      "body_ar":body_ar,
      "body_en":body_en,
      "price":price,
      "image":image,
      // "store_id":vendor.store[0].id.toString()
    });

    try {
      final apiResult = await postRequest(
          Api.editServiceById+"/"+serviceId.toString(), formData,
          includeHeaders: true);
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


  Future<bool> AddService({
    @required int category_id,
    // @required int type_id,
    @required String name_ar,
    @required String name_en,
    @required String body_ar,
    @required String body_en,
    @required String image,
    @required String price,
  })
  async {
    FormData formData =
    new FormData.fromMap({
      "category_id":category_id,
      // "type_id":type_id,
      "name_ar":name_ar,
      "name_en":name_en,
      "body_ar":body_ar,
      "body_en":body_en,
      "image":image,
      "price":price,
      // "store_id": vendor.store[0].id
    });

    try {
      final apiResult = await postRequest(
          Api.addService, formData,
          includeHeaders: true);
      if (apiResult.statusCode == 200)
        if (apiResult.data["class"] == "success") {
          return true;
        }
        else
          return false;
    }
    catch (e) {
      consolePrint(e.toString());
      return false;
    }
  }

  Future<bool> deleteService({
    // int openAt,
    // int closeAt,
    // String img,
    // String email,
    int ServiceId,
  })
  async {
    FormData formData =
    new FormData.fromMap({
      // openAt!=null?? "open_from":openAt,
      // closeAt!=null?? "closed_at":closeAt,
      // img!=null??  "image":
      // await MultipartFile.fromFile(img),
      // email!=null?? "email":email,
      // "district_id": address,
    });

    try {
      final apiResult = await postRequest(
          Api.deleteServiceById+"/"+ServiceId.toString(), formData,
          includeHeaders: true);
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
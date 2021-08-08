import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/screens/auth/controller/services/auth_services.dart';
import 'package:pets_ecommerce/screens/auth/model/user.dart';
import 'package:pets_ecommerce/screens/corner/model/corner_model.dart';
import 'package:pets_ecommerce/services/http_requests_service.dart';
import 'package:dio/dio.dart';
class MyCornersRequests extends HttpService {
  UserModel vendor ;
  getmodel()async{
    vendor = await AuthServices.getCurrentUser();
  }

  Future<Corner>  getCornerId(int id)async {
    Corner corner;
    if (vendor.store.length == 1) {
      final apiResult = await getRequest(
        Api.getCornerId + "/" + id.toString(),
        queryParameters: null,
        includeHeaders: true,
      );

      corner = Corner.fromJson(apiResult.data["corner"]);
    }

    else {
      final apiResult = await getRequest(
        Api.getCornerId + "/" + id.toString(),
        queryParameters: null,
        includeHeaders: true,
      );

      corner = Corner.fromJson(apiResult.data["corner"]);
    }

return corner;
  }

  Future<CornersModel> getAllCorners() async
  {
CornersModel cornersModel;
    if(vendor.store.length==1)
    {
      final apiResult = await getRequest(
        Api.myAllCorners + "?store_id="+ vendor.store[0].id.toString(),
        queryParameters: null,
        includeHeaders: true,
      );

cornersModel=CornersModel.fromJson(apiResult.data);
    }

    else {
      final apiResult = await getRequest(
        Api.myAllStatuses,
        queryParameters: null,
        includeHeaders: true,
      );
      cornersModel=cornersModelFromJson(apiResult.data);

    }

    return cornersModel;
  }

  Future<bool> addCorner(@required String cornerImage,@required String name,@required String desc,@required List<String> subImages) async
  {
    if(vendor.store.length==1)
    {
      FormData formData =
      new FormData.fromMap({
        "image":cornerImage,
        "name":name,
        "desc":desc,
        "images_count":subImages.length,
        for(int i=0;i<subImages.length;i++)
        "image$i":subImages[i],
        "store_id": vendor.store[0].id.toString(),
      });
      try {
        final apiResult = await postRequest(
            Api.addCorner,
            formData,
            includeHeaders: true);
        if (apiResult.statusCode == 200)
        {
          return true;
        }
        else
          return false;
      }
      catch (e) {
        return false;
      }
    }
    else {
      FormData formData =
      new FormData.fromMap({
        "image":cornerImage,
        "name":name,
        "desc":desc,
        "images_count":subImages.length,
        for(int i=0;i<subImages.length;i++)
          "image$i":subImages[i],
        // "store_id": vendor.store[0].id.toString(),
      });

      try {
        final apiResult = await postRequest(
            Api.addStatus,
            formData,
            includeHeaders: true);
        if (apiResult.statusCode == 200)
        {
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

  }

  Future<bool> deleteCorner(int id) async
  {
    FormData formData =
    new FormData.fromMap({
      // "images_id":id,
    });

    try {
      final apiResult = await postRequest(
          Api.deleteCorner+"/"+id.toString() ,
          formData,
          includeHeaders: true);
      if (apiResult.statusCode == 200)
      {
        return true;
      }
      else
        return false;
    }
    catch (e) {
      return false;
    }
  }

  Future<bool> editCorner(@required String cornerImage,@required String name,@required String desc,int id) async
  {
    if(vendor.store.length==1)
    {
      FormData formData =
      new FormData.fromMap({
        "image":cornerImage,
        "name":name,
        "desc":desc,
        "store_id": vendor.store[0].id.toString(),
      });
      try {
        final apiResult = await postRequest(
            Api.editCornerbyId+"/"+id.toString(),

            formData,
            includeHeaders: true);
        if (apiResult.statusCode == 200)
        {
          return true;
        }
        else
          return false;
      }
      catch (e) {
        return false;
      }
    }
    else {
      FormData formData =
      new FormData.fromMap({
        "image":cornerImage,
        "name":name,
        "desc":desc,
      });

      try {
        final apiResult = await postRequest(
            Api.editCornerbyId+"/"+id.toString(),
            formData,
            includeHeaders: true);
        if (apiResult.statusCode == 200)
        {
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

  }
  //
  // Future<bool> editCornerName(@required String name,int id) async
  // {
  //   if(vendor.store.length==1)
  //   {
  //     FormData formData =
  //     new FormData.fromMap({
  //       "name":name,
  //       "store_id": vendor.store[0].id.toString(),
  //     });
  //     try {
  //       final apiResult = await postRequest(
  //           Api.editCornerbyId+"/"+id.toString(),
  //
  //           formData,
  //           includeHeaders: true);
  //       if (apiResult.statusCode == 200)
  //       {
  //         return true;
  //       }
  //       else
  //         return false;
  //     }
  //     catch (e) {
  //       return false;
  //     }
  //   }
  //   else {
  //     FormData formData =
  //     new FormData.fromMap({
  //
  //       "name":name,
  //     });
  //
  //     try {
  //       final apiResult = await postRequest(
  //           Api.editCornerbyId+"/"+id.toString(),
  //           formData,
  //           includeHeaders: true);
  //       if (apiResult.statusCode == 200)
  //       {
  //         return true;
  //       }
  //       else
  //         return false;
  //     }
  //     catch (e) {
  //       consolePrint(e.toString());
  //       return false;
  //     }
  //   }
  //
  // }
  //
  // Future<bool> editCornerDesc(@required String desc,int id) async
  // {
  //   if(vendor.store.length==1)
  //   {
  //     FormData formData =
  //     new FormData.fromMap({
  //       "desc":desc,
  //       "store_id": vendor.store[0].id.toString(),
  //     });
  //     try {
  //       final apiResult = await postRequest(
  //           Api.editCornerbyId+"/"+id.toString(),
  //           formData,
  //           includeHeaders: true);
  //       if (apiResult.statusCode == 200)
  //       {
  //         return true;
  //       }
  //       else
  //         return false;
  //     }
  //     catch (e) {
  //       return false;
  //     }
  //   }
  //   else {
  //     FormData formData =
  //     new FormData.fromMap({
  //       "desc":desc,
  //     });
  //
  //     try {
  //       final apiResult = await postRequest(
  //           Api.editCornerbyId+"/"+id.toString(),
  //           formData,
  //           includeHeaders: true);
  //       if (apiResult.statusCode == 200)
  //       {
  //         return true;
  //       }
  //       else
  //         return false;
  //     }
  //     catch (e) {
  //       consolePrint(e.toString());
  //       return false;
  //     }
  //   }
  //
  // }

  Future<bool> addSubPhoto(String image,int id) async
  {
    FormData formData =
    new FormData.fromMap({
      "images_count":"1",
      "image0":image,

    });
    consolePrint("corner image : $image");
    try {
      final apiResult = await postRequest(
          Api.addPhoto+"?corner_id="+id.toString(),
          formData,
          includeHeaders: true);
      if (apiResult.statusCode == 200)

      {
        return true;
      }
      else
        return false;
    }
    catch (e) {
      return false;
    }
  }

  Future<bool> subPhotoToStory(int id) async
  {
    FormData formData;
    if (vendor.store.length == 1){
      formData = new FormData.fromMap({
        // "images_count":"1",
        "store_id": vendor.store[0].id.toString(),
      });
    }
    {
      formData = new FormData.fromMap({
        // "images_count":"1",
        // "image0":image,
      });
    }

    // consolePrint("corner image : $image");
    try {
      final apiResult = await postRequest(
          Api.convertPhotoToStory+"/"+id.toString(),
          formData,
          includeHeaders: true);
      consolePrint(apiResult.statusCode .toString());
      if (apiResult.statusCode == 200)
      {
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

  Future<bool> deleteSubPhoto(int id) async
  {
    FormData formData =
    new FormData.fromMap({
      // "images_id":id,
    });

    try {
      final apiResult = await postRequest(
          Api.removePhoto+"/"+id.toString() ,
          formData,
          includeHeaders: true);
      if (apiResult.statusCode == 200)
      {
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
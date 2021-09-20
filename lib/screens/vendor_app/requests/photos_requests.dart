import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/model/user.dart';
import 'package:pets/services/http_requests_service.dart';
import '../model/product.dart';
import 'package:dio/dio.dart';
import '../model/categories.dart';
import '../model/types.dart';
import '../model/offer.dart';
import '../model/image_model.dart';

class VendorAppPhotosReq extends HttpService {
  UserModel vendor;

  getmodel() async {
    vendor = await AuthServices.getCurrentUser();
  }

  Future<ImagesModel> getStoreImages() async {
    final apiResult = await getRequest(
      Api.getPhotos + '/' + vendor.store[0].id.toString(),
      queryParameters: null,
      includeHeaders: true,
    );

    return ImagesModel.fromJson(apiResult.data["store"]);
  }

  Future<bool> addPhoto(String image) async {
    FormData formData = new FormData.fromMap({
      "images_count": "1",
      "image0": image,
    });
    consolePrint("store image : $image");
    try {
      final apiResult = await postRequest(
          Api.addPhoto + "?store_id=" + vendor.store[0].id.toString(), formData,
          includeHeaders: true);
      if (apiResult.statusCode == 200) {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deletePhoto(int id) async {
    FormData formData = new FormData.fromMap({
      // "images_id":id,
    });

    try {
      final apiResult = await postRequest(
          Api.removePhoto + "/" + id.toString(), formData,
          includeHeaders: true);
      if (apiResult.statusCode == 200) {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }
}

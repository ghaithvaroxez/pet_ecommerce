import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/model/user.dart';
import 'package:pets/screens/vendor_app/model/categories.dart';
import 'package:pets/screens/vendor_app/model/location_model.dart';
import 'package:pets/services/http_requests_service.dart';
import '../../doctor_app/model/doctor.dart';

class UserRequests extends HttpService {
  UserModel user;

  getModel() async {
    user = await AuthServices.getCurrentUser();
    consolePrint("User Id :" + user.user.id.toString());
  }

  Future<DoctorModel> getUserInfo() async {
    consolePrint("user Id :" + user.user.id.toString());
    final apiResult = await getRequest(
      Api.getUserId + '/' + user.user.id.toString(),
      queryParameters: null,
    );

    if (apiResult.statusCode == 200)
      return DoctorModel.fromJson(apiResult.data);
    // StoreModel storeModel= storeModelFromJson(apiResult.data["store"]);
    //
    // return storeModel.store;
  }

  Future<List<City>> getLocations() async {
    final apiResult = await getRequest(
      Api.getLocations,
      queryParameters: null,
    );
    if (apiResult.statusCode == 200) {
      var l = LocationModel.fromJson(apiResult.data);
      return l.cities;
    }
  }

  Future<bool> UpdateUser(
      int location, String first, String last, String email) async {
    FormData formData;
    if (location == -1) {
      formData = new FormData.fromMap({
        "email": email,
        "first_name": first,
        "last_name": last,
      });
    } else {
      formData = new FormData.fromMap({
        "district_id": location,
        "email": email,
        "first_name": first,
        "last_name": last,
      });
    }
    try {
      final apiResult =
          await postRequest(Api.updateUser, formData, includeHeaders: true);
      if (apiResult.statusCode == 200) if (apiResult.data["status"] == true) {
        AuthServices.setName(apiResult.data["user"]["name"]);
        AuthServices.setImage(apiResult.data["user"]["image"]);
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateAddress({
    int address,
  }) async {
    FormData formData = new FormData.fromMap({
      "district_id": address,
    });

    try {
      final apiResult =
          await postRequest(Api.updateUser, formData, includeHeaders: true);
      if (apiResult.statusCode == 200) if (apiResult.data["status"] == true) {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateEmail({
    String email,
  }) async {
    FormData formData = new FormData.fromMap({
      "email": email,
    });

    try {
      final apiResult =
          await postRequest(Api.updateUser, formData, includeHeaders: true);
      if (apiResult.statusCode == 200) if (apiResult.data["status"] == true) {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updatePassword({
    String pass,
  }) async {
    FormData formData = new FormData.fromMap({
      "password": pass,
    });

    try {
      final apiResult =
          await postRequest(Api.updateUser, formData, includeHeaders: true);
      if (apiResult.statusCode == 200) if (apiResult.data["status"] == true) {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  // Future<bool> updatePassword({
  //   String password,
  // })
  // async {
  //   FormData formData =
  //   new FormData.fromMap({
  //     "password": password,
  //   });
  //
  //   try {
  //     final apiResult = await postRequest(
  //         Api.updateUser, formData, includeHeaders: true);
  //     if (apiResult.statusCode == 200)
  //       if (apiResult.data["status"] == true) {
  //         return true;
  //       }
  //       else
  //         return false;
  //   }
  //   catch (e) {
  //     return false;
  //   }
  //
  // }

  Future<bool> updateFirstName({
    String first,
  }) async {
    FormData formData = new FormData.fromMap({
      "first_name": first,
    });

    try {
      final apiResult =
          await postRequest(Api.updateUser, formData, includeHeaders: true);
      if (apiResult.statusCode == 200) if (apiResult.data["status"] == true) {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateLastName({
    String last,
  }) async {
    FormData formData = new FormData.fromMap({
      "last_name": last,
    });

    try {
      final apiResult =
          await postRequest(Api.updateUser, formData, includeHeaders: true);
      if (apiResult.statusCode == 200) if (apiResult.data["status"] == true) {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkPassword(String pass) async {
    try {
      final apiResult =
          await getRequest(Api.checkPassword + pass, includeHeaders: true);
      if (apiResult.statusCode == 200) if (apiResult.data["status"] == 1) {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateImage({
    String img,
  }) async {
    consolePrint("image:" + img);
    FormData formData = FormData.fromMap({
      "image": img,
    });

    try {
      final apiResult =
          await postRequest(Api.updateUser, formData, includeHeaders: true);
      if (apiResult.statusCode == 200) if (apiResult.data["status"] == true) {
        AuthServices.setImage(apiResult.data["user"]["image"]);
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateSocial({
    String link,
    String type,
    int SocialId,
  }) async {
    FormData formData = FormData.fromMap({
      "type": type,
      "link": link,
    });

    try {
      final apiResult = await postRequest(
          Api.updateSocial + "/" + SocialId.toString(), formData,
          includeHeaders: true);
      if (apiResult.statusCode == 200) if (apiResult.data["class"] ==
          "success") {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addSocial({
    String link,
    String type,
  }) async {
    FormData formData = FormData.fromMap({
      "type": type,
      "link": link,
    });

    try {
      final apiResult =
          await postRequest(Api.addSocial, formData, includeHeaders: true);
      if (apiResult.statusCode == 200) if (apiResult.data["class"] ==
          "success") {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteSocial({
    String link,
    String type,
    int SocialId,
  }) async {
    FormData formData = FormData.fromMap({
      // openAt!=null?? "open_from":openAt,
      // closeAt!=null?? "closed_at":closeAt,
      // email!=null?? "email":email,
      // "address":address,
      // "type":type,
      // "link":link,
    });

    try {
      final apiResult = await postRequest(
          Api.deleteSocial + "/" + SocialId.toString(), formData,
          includeHeaders: true);
      // consolePrint(" image result "+apiResult.data["status"]);
      if (apiResult.statusCode == 200) if (apiResult.data["class"] ==
          "success") {
        return true;
      } else
        return false;
    } catch (e) {
      return false;
    }
  }
}

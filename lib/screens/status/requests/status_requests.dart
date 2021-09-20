import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/model/user.dart';
import 'package:pets/services/http_requests_service.dart';
import 'package:dio/dio.dart';
import '../model/status_model.dart';

class StatusRequests extends HttpService {
  UserModel vendor;

  getmodel() async {
    vendor = await AuthServices.getCurrentUser();
  }

  Future<List<StatusAll>> getAllStatuses() async {
    List<StatusAll> status = [];
    if (vendor.store.length == 1) {
      final apiResult = await getRequest(
        Api.myAllStatuses + "?store_id=" + vendor.store[0].id.toString(),
        queryParameters: null,
        includeHeaders: true,
      );

      status = List<StatusAll>.from(
          apiResult.data['my_status_all'].map((x) => StatusAll.fromJson(x)));
    } else {
      final apiResult = await getRequest(
        Api.myAllStatuses,
        queryParameters: null,
        includeHeaders: true,
      );
      status = List<StatusAll>.from(
          apiResult.data['my_status_all'].map((x) => StatusAll.fromJson(x)));
    }

    return status;
  }

  Future<bool> addPhoto(String image) async {
    if (vendor.store.length == 1) {
      FormData formData = new FormData.fromMap({
        "store_id": vendor.store[0].id.toString(),
        "image": image,
        "duration": 15
      });

      try {
        final apiResult =
            await postRequest(Api.addStatus, formData, includeHeaders: true);
        if (apiResult.statusCode == 200) {
          return true;
        } else
          return false;
      } catch (e) {
        return false;
      }
    } else {
      FormData formData = new FormData.fromMap({
        // "store_id": vendor.store[0].id.toString(),
        "image": image,
        "duration": 15
      });

      try {
        final apiResult =
            await postRequest(Api.addStatus, formData, includeHeaders: true);
        if (apiResult.statusCode == 200) {
          return true;
        } else
          return false;
      } catch (e) {
        return false;
      }
    }
  }

  Future<bool> addVideo(String videoPath, int length) async {
    if (vendor.store.length == 1) {
      FormData formData = new FormData.fromMap({
        "store_id": vendor.store[0].id.toString(),
        "file": await MultipartFile.fromFile(videoPath,
            filename: videoPath.split('/').last),
        // "thum":"/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEABALDA4MChAODQ4SERATGCgaGBYWGDEjJR0oOjM9PDkzODdASFxOQERXRTc4UG1RV19iZ2hnPk1xeXBkeFxlZ2MBERISGBUYLxoaL2NCOEJjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY//AABEIAl8EOAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AOJoAWgAoAWgBtAC0AFAC0AFAC0AFAC0AFACigAoAWgBaACgB8Qy4oA6XTF2wk+wpAaA6UAFMAoAKACgBaACgAoAKACgAxQAGgZUvW/dmpZcDDqTsWwUgCgAoAKACgAoAWgAoAKBhQAYoAXFAwoAKAFFABQAUAFABQAUAFABigAoAWgAoAKACgAoAKACgAoAKQBQAUwEoAMUAFABQ"
        "duration": length
      });

      try {
        final apiResult =
            await postRequest(Api.addStatus, formData, includeHeaders: true);
        consolePrint(apiResult.statusMessage);
        consolePrint(apiResult.statusCode.toString());
        if (apiResult.statusCode == 200) {
          return true;
        } else
          return false;
      } catch (e) {
        consolePrint(e.toString());
        // consolePrint(e.statusMessage);
        // consolePrint(e.statusCode.toString());
        return false;
      }
    } else {
      FormData formData = new FormData.fromMap({
        // "store_id": vendor.store[0].id.toString(),
        "file": await MultipartFile.fromFile(videoPath, filename: "dp"),
        // "thum":image
        "duration": length
      });

      try {
        final apiResult =
            await postRequest(Api.addStatus, formData, includeHeaders: true);
        if (apiResult.statusCode == 200) {
          return true;
        } else
          return false;
      } catch (e) {
        return false;
      }
    }
  }

  Future<bool> deleteStatus(int id) async {
    FormData formData = new FormData.fromMap({
      // "images_id":id,
    });

    try {
      final apiResult = await postRequest(
          Api.deleteStatus + "/" + id.toString(), formData,
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

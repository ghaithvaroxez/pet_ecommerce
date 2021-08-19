import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/screens/home/view/home_view.dart';
import '../model/status_model.dart';
import '../requests/status_requests.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';
import 'dart:io';
import 'package:flutter_video_info/flutter_video_info.dart';

class StatusController extends GetxController{



  // ImageFormat _format = ImageFormat.JPEG;
  int _quality = 10;
  int _size = 200;
  String _tempDir;
  String filePath;
  List<StatusAll> status=[];
  StatusRequests statusRequests=StatusRequests();
  bool loading=false;
  getStatuses()async {
    activeLoading();
    status=await statusRequests.getAllStatuses();
    consolePrint(" after get statuses request");
    // await setImages();
    removeLoading();
    update();
  }

  setImage(String path)async {
    // List<File> images = await exportImage(path,10,0.5);
    // consolePrint("image path:"+images[5].path);

    // Uint8List uint8list = await VideoThumbnail.thumbnailData(
    //   video: path,
    //   imageFormat: ImageFormat.JPEG,
    //   maxWidth: 256,
    //   // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
    //   quality: 25,
    // );
    //
    // consolePrint("unit8list:" + uint8list.toString());

    // for(int i=0 ;i<status.length;i++)
    //   {
    //     if(status[i].type!="image")
    //       {
    //



            // String thumb = await Thumbnails.getThumbnail(
            //     thumbnailFolder:'[FOLDER PATH TO STORE THUMBNAILS]', // creates the specified path if it doesnt exist
            //     videoFile: '[VIDEO PATH HERE]',
            //     imageType: ThumbFormat.PNG,
            //     quality: 30);
            //
            //   filePath = uint8list;
            //   if(filePath!="")
            // status[i].thumb=filePath;
            // filePath="";
          // }
          // }
      }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    init();
  }
  init()async{
    await statusRequests.getmodel();
    await  getStatuses();
  }
  addNewImage(
      {@required String image})async
  {
    activeLoading();

    try{
      bool k = await statusRequests.addPhoto(
          image);
      if (k == true) {
        await getStatuses();
        // await statusController.init();
        await homeController.getHome();
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
addNewVideo(
      {@required String videoPath})async
  {
    try{
    activeLoading();

    final videoInfo = FlutterVideoInfo();

    String videoFilePath = videoPath;
    var info = await videoInfo.getVideoInfo(videoFilePath);
    consolePrint("video: length "+info.duration.toString());
    int len=(info.duration/1000).round();
    consolePrint("len:"+len.toString());
if(info.filesize>92440960)//41943040//102440960
  {
    Get.rawSnackbar(
        message: "حجم الفيديو كبير جدا الرجاء اختيار فيديو اخر",
        backgroundColor: Colors.redAccent);
    removeLoading();
return;
  }

      bool k = await statusRequests.addVideo(
          videoPath,len);
      if (k == true) {
        await getStatuses();
        await homeController.getHome();
        // Get.back();
        removeLoading();
      } else {
        // Get.back();
        removeLoading();
        Get.rawSnackbar(
            message: "can't add your video now try again later",
            backgroundColor: Colors.redAccent);
      }
    }catch(e)
    {
      // Get.back();
      removeLoading();
      Get.rawSnackbar(
          message: "can't add your video now try again later",
          backgroundColor: Colors.redAccent);
    }
    update();

  }

  deleteStatus(int  statusID)
  async {
    activeLoading();

    try {
      bool k = await statusRequests.deleteStatus(
        // category_id: product.categoryId,
        // type_id: product.typeId,
        // name_ar: product.name,
        // name_en: product.name,
        // body_ar: product.body,
        // body_en: product.body,
        // image: product.image,
          statusID);

      if (k == true) {
        await getStatuses();
        await homeController.getHome();
        // Get.back();
        removeLoading();
        update();
      } else {
        // Get.back();
        removeLoading();
        update();
        Get.rawSnackbar(
            message: "can't delete your status now try again later",
            backgroundColor: Colors.redAccent);
      }
    } catch(e) {
      Get.back();
      removeLoading();
      update();
      Get.rawSnackbar(
          message: "can't delete your status now try again later",
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

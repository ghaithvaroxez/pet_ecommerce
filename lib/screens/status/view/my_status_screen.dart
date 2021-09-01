import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pets_ecommerce/screens/widgets/drawer/custom_drawer.dart';
import 'package:video_player/video_player.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/auth/controller/services/auth_services.dart';
import 'package:pets_ecommerce/screens/auth/model/user.dart';
import 'package:pets_ecommerce/screens/auth/view/register/register_screen.dart';
import 'package:pets_ecommerce/screens/main_screen/model/main_screen_model.dart';
import 'package:pets_ecommerce/screens/status/model/status_model.dart';
import 'package:pets_ecommerce/screens/widgets/custom_app_bar.dart';
import 'package:pets_ecommerce/screens/widgets/floating_action_button.dart';
import 'dart:math' as Math;
import 'package:image/image.dart' as Im;
import 'dart:io';
import 'package:get/get.dart';
import 'package:video_thumbnail_generator/video_thumbnail_generator.dart';
import '../controller/status_controller.dart';
import 'package:http/http.dart' as http;
import 'package:pets_ecommerce/configuration/constants/api.dart';
import '../view/componenets/video_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import '../view/componenets/status_photo.dart';

class MyStatus extends StatefulWidget {
  @override
  _MyStatusState createState() => _MyStatusState();
}

class _MyStatusState extends State<MyStatus> {
  File image;
  // FlickManager flickManager;

  var video;

  bool loading = false;
  File tmpFile;
  String base64Image;
  String newImage = "";
  bool error = false;

// List<StatusAll> status=[];
//   fetchdata()
//   async {
//     loading=true;
//     setState(() {
//
//     });
// UserModel userModel=await AuthServices.getCurrentUser();
//     String url;
//     var apiResult;
// if(userModel.user.role=="doctor"||userModel.user.role=="user"){
//    url=  Api.baseUrl+Api.myAllStatuses;
//    final uri=Uri.parse(url);
//    apiResult = await http.get(
//   uri
//   );
// }
//     else{
//   url=Api.baseUrl+Api.myAllStatuses+"?store_id="+userModel.store[0].id.toString();
//   final uri=Uri.parse(url);
//    apiResult = await http.get(
//   uri,headers: {"Authorization":"Bearer ${userModel.token}"}
//   );
//
// }
//     consolePrint("after get ");
//     if(apiResult.statusCode==200) {
//       var data=jsonDecode(apiResult.body);
//       consolePrint(data.toString());
//       status =
//       List<StatusAll>.from(data["my_status_all"].map((x) => StatusAll.fromJson(x)));
//     }
//
//     else  error=true;
//
//     loading=false;
//     setState(() {
//
//     });
//   }

  Future<String> compressImage(File f) async {
    loading = true;
    setState(() {});
    print('starting compression');
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    int rand = new Math.Random().nextInt(10000);
    print('before decoding img');
    Im.Image image = Im.decodeImage(f.readAsBytesSync());
    print('before decoding img2');
    image = Im.copyResize(image,
        width: 1080); //MediaQuery.of(context).size.width.toInt());

    // image.format = Im.Image.RGBA; //was in old version of flutter
    //Im.Image newim = Im.remapColors(image, alpha: Im.LUMINANCE);
    // image = Im.remapColors(image, alpha: Im.LUMINANCE);
    print('before reducing quality');
    var newim2 = new File('$path/$rand.jpg')
      ..writeAsBytesSync(Im.encodeJpg(image, quality: 50));

    setState(() {
      tmpFile = newim2;
      base64Image = base64Encode(tmpFile.readAsBytesSync());
      loading = false;
    });

    String fileName = tmpFile.path.split('/').last;

    //await upload(fileName);
    print('done');
    return base64Image;
  }

  getcompress(File imageFile) async {
    setState(() {
      loading = true;
    });
    newImage = await compressImage(imageFile);
    setState(() {
      loading = false;
    });
  }
  _uploadPhoto() async {
    try {
      image=null;
      image = await ImagePicker.pickImage(source: ImageSource.gallery,);


      if (image != null) {
        File imageFile = File(image.path);
        await getcompress(imageFile);

      setState(() {});
      if (newImage != null || newImage != "")
        await statusController.addNewImage(image: newImage);
      else
        consolePrint("error loading image");

      } else {
        consolePrint("image is null");
      }
    } catch (e) {
      consolePrint(e.toString());
      Get.rawSnackbar(
          messageText: Text(
        "حدثت مشكلة ما الرجاء المحاولة مرة اخرى",
        textDirection: TextDirection.rtl,
        style: TextStyle(color: Colors.white),
      ));
    }
  }

  _uploadVideo() async {
    video=null;
    video = await ImagePicker.pickVideo(source: ImageSource.gallery);

   // List<File> images= await exportImage(videoFile.path, 10, 10);
   // await getcompress(images[5]);
    try{
      setState(() {});
    if (video!=null) {
      File videoFile = File(video.path);
        await statusController.addNewVideo(videoPath: videoFile.path);
      }
      // await statusController.addNewImage(image: newImage);
    else
      consolePrint("error loading video");
  } catch (e) {
  consolePrint(e.toString());
  Get.rawSnackbar(
  messageText: Text(
  "حدثت مشكلة ما الرجاء المحاولة مرة اخرى",
  textDirection: TextDirection.rtl,
  style: TextStyle(color: Colors.white),
  ));
  }
    // exportImage(
    //     String filePath, int number, double quality)
    // await statusController.setImage(video.path);

  }

  StatusController statusController = Get.put(StatusController());
  VideoPlayerController vcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchdata();
    // vcontroller=VideoPlayerController.network(statusController.status[0].image)..initialize().then((_) {
    //   setState(() {});  //when your thumbnail will show.
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      floatingActionButton: FancyFab(
        onPressed1: () async {
          await _uploadVideo();
        },
        onPressed2: () async {
          await _uploadPhoto();
        },
        story: true,
      ),
      body:  Builder(
        builder: ((context)=>
     SafeArea(
            child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Container(
                child: Material(
                  elevation: 5,
                  color: Colors.white,
                  child: Container(
                      width: SizeConfig.screenWidth,
                      height: getProportionateScreenHeight(95),
                      child: Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(24),
                          ),
                          GestureDetector(
                            onTap: (){ Scaffold.of(context).openEndDrawer();},

                            // onTap: open_drawer,
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.grey.shade50,
                              child: Image.asset(
                                "assets/images/home/menu_icon.png",
                                height: 24,
                                width: 20,
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                              height: getProportionateScreenHeight(28),
                              width: getProportionateScreenWidth(75),
                              child: AutoSizeText(
                                "حالتي",
                                style: h5_21pt,
                                minFontSize: 8,
                              )),
                          Spacer(),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.grey.shade50,
                            child: Image.asset(
                              "assets/images/home/notification_icon.png",
                              height: 24,
                              width: 20,
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(24),
                          ),
                        ],
                      )),
                ),
              ),

              ///appBar

              GetBuilder<StatusController>(
                init: statusController,
                builder: (controller) => controller.loading
                ? Expanded(child: LoadingScreen())
                : Column(
                  children: [
                    Container(margin:EdgeInsets.symmetric(vertical: 16,horizontal:
                    16),alignment: Alignment.centerRight,child: AutoSizeText("الصور ",style: body3_21pt,),),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row (
                      children: [
                        ...List<Widget>.generate(
                          controller.status.length,
                              (index) => controller.status[index].type ==
                              "image"
                              ? GestureDetector(
                                onTap: (){
                                  Get.to(VideoApp(controller.status[index], index));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: StatusImage(controller.status[index].image,()async{  await controller
                                  .deleteStatus(
                                  controller
                                      .status[
                                  index]
                                      .id);}),
                                ),
                              ):Container(height: 0,width: 0,),
                        ),
                      ],
                    ),
                  ),
                    Container(margin:EdgeInsets.symmetric(vertical: 16,horizontal:
                    16),alignment: Alignment.centerRight,child: AutoSizeText("الفيديوهات ",style: body3_21pt,),),
                  SingleChildScrollView(
                    scrollDirection:Axis.horizontal,
                    child: Row (
                      children: [
                        ...List<Widget>.generate(
                          controller.status.length,
                              (index) => controller.status[index].type !=
                              "image"
                              ? GestureDetector(
                                onTap: (){
                                  Get.to(VideoApp(controller.status[index], index));
                                },
                                child: Container(
                                  height: getProportionateScreenHeight(160),
                                  width: getProportionateScreenWidth(220),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child:
                                        Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: ThumbnailImage(
                                            videoUrl:
                                            Api.imagePath+controller.status[index].image,
                                            height: getProportionateScreenHeight(160),
                                            width: getProportionateScreenWidth(220),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        // height: getProportionateScreenHeight(120),
                                        // width: getProportionateScreenWidth(180),
// color: Colors.grey,
//                                       child:
  //                                     VideoPlayer(vcontroller
  // ),
                                        // child: Image.network(Api.imagePath +
                                        //     controller.status[index].image),
                                      ),
                                      Positioned(
                                          left: getProportionateScreenWidth(8),
                                          top: getProportionateScreenHeight(8),
                                          child: Container(
                                              height:
                                                  getProportionateScreenHeight(35),
                                              width: getProportionateScreenWidth(35),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: GestureDetector(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: ((context) =>
                                                            AlertDialog(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  5)),
                                                              title: Text(
                                                                'هل أنت متأكد ؟',
                                                                textDirection:
                                                                    TextDirection.rtl,
                                                                style: body3_18pt,
                                                              ),
                                                              content: Text(
                                                                'انت على وشك حذف هذه الصوة !',
                                                                textDirection:
                                                                    TextDirection.rtl,
                                                                style: body1_16pt,
                                                              ),
                                                              actions: [
                                                                TextButton(
                                                                  child: Text(
                                                                    'نعم',
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    // language.changeLanguage();
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    await controller
                                                                        .deleteStatus(
                                                                            controller
                                                                                .status[
                                                                                    index]
                                                                                .id);
                                                                    // Navigator.popUntil(context, ModalRoute.withName('/'));
                                                                  },
                                                                ),
                                                                TextButton(
                                                                  child: Text('لا'),
                                                                  onPressed: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                )
                                                              ],
                                                            )));
                                                  },
                                                  child: Image.asset(
                                                    "assets/images/vendor_app/trash.png",
                                                    fit: BoxFit.fill,
                                                  ))))
                                    ],
                                  ),

                                ),
                              ):Container(height: 0,width: 0,),
                        ),
                      ],
                    ),
                  ),
                  ],
                ),
              )
            ],
          ),
        ),))
      ),
    );
  }
}

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/gradient.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/main.dart';
import 'package:pets/screens/auth/controller/services/auth_services.dart';
import 'package:pets/screens/auth/model/user.dart';
import 'package:pets/screens/corner/model/corner_model.dart';
import 'package:http/http.dart' as http;
import 'package:pets/services/http_requests_service.dart';

import '../../loading_screen.dart';
import 'package:get/get.dart';
import '../controller/my_corners_details_controller.dart';
import 'dart:io';
import 'dart:math' as Math;
import 'package:image/image.dart' as Im;

import 'edit_corner_screen.dart';
import './components/corner_images_view.dart';
import 'translations/my_corner_details.i18n.dart';
class MyCornerDetails extends StatefulWidget {
  Corner corner;

  MyCornerDetails(this.corner);

  @override
  _MyCornerDetailsState createState() => _MyCornerDetailsState();
}

class _MyCornerDetailsState extends State<MyCornerDetails> {
  MyCornersDetailsController cornerController;

  bool loading = false;
  bool error = false;
  CornersModel cornersModel;

  // fetchData()async{
  //   loading=true;
  //   setState(() {
  //
  //   });
  //   try {
  //     UserModel userModel= await AuthServices.getCurrentUser();
  //
  //     consolePrint("before corners requests");
  //     var url;
  //     if(userModel.store.length==0){
  //       url = Uri.parse(
  //         "${Api.baseUrl}/myCorners",
  //       );
  //     }
  //     else {
  //       url = Uri.parse(
  //         "${Api.baseUrl}/myCorners?store_id=${userModel.store[0].id.toString()}",
  //       );
  //
  //     }
  //     final apiResult =
  //     await http.get(url,headers: await HttpService().getHeaders());
  //     consolePrint("corners statusCode"+apiResult.statusCode.toString());
  //     if (apiResult.statusCode == 200) {
  //       cornersModel = cornersModelFromJson(apiResult.body);
  //       consolePrint(apiResult.statusCode.toString());
  //     } else {
  //       error = true;
  //     }
  //     loading = false;
  //     setState(() {});
  //   }catch(e)
  //   {
  //     loading = false;
  //     error = true;
  //     setState(() {});
  //     consolePrint("Corners error:"+e.toString());
  //   }
  //   consolePrint("after corners requests");
  //
  // }
  Future<String> compressImage(File f) async {
    loading = false;
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

  var image;

  // FlickManager flickManager;

  var video;

  File tmpFile;
  String base64Image;
  String newImage = "";

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
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
      File imageFile = File(image.path);

      if (image != null) {
        await getcompress(imageFile);
      } else {
        consolePrint("image is null");
      }
      setState(() {});
      if (newImage != null || newImage != "")
        await cornerController.addSubImage(newImage);
      else
        consolePrint("error loading image");
    } catch (e) {
      consolePrint(e.toString());
      Get.rawSnackbar(
          messageText: Text(
        "حدثت مشكلة ما الرجاء المحاولة مرة اخرى",
        // textDirection: TextDirection.rtl,
        style: TextStyle(color: Colors.white),
      ));
    }
  }
//   String name="";
// getName()async{
//   loading=true;
//   setState(() {
//
//   });
//
//     UserModel userModel=await AuthServices.getCurrentUser();
//     if(userModel.store.length==0)
//       {
//         name=userModel.user.firstName+" "+userModel.user.lastName;
//       }
//     else name=userModel.user.name;
//
//   loading=false;
//   setState(() {
//
//   });
// }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    consolePrint("in int state");
    cornerController = Get.put(MyCornersDetailsController(widget.corner.id));
    cornerController.init();
// getName();
    // if(!widget.end)fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: (){
          Get.to(()=>EditCornerScreen(cornerController));

        },
        child: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/profile/edit_icon.png")),
          ),
          // child: FloatingActionButton(

          // backgroundColor: Colors.transparent,
          // onPressed: null,
          // tooltip: 'Inbox',
          // child: Image.asset(
          //   "assets/images/profile/edit_icon.png",
          //   fit: BoxFit.fill,
          // ),
          // ),
        ),
      ),
      body: SafeArea(
        child:
            // error?Container(height: getProportionateScreenHeight(400),width: getProportionateScreenWidth(400),
            //   child: Center(child: AutoSizeText("عذراً لقد حدثت مشكلة الرجاء المحاولة لاحقاً"),),):loading?LoadingScreen():

        GetBuilder<MyCornersDetailsController>(
          init: cornerController,
          builder: (controller) => controller.loading
              ? LoadingScreen()
              : Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        height: getProportionateScreenHeight(270),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: shadow,
                          ),
                          child: Image.network(
                            Api.imagePath + controller.currentCorner.image,
                            fit: BoxFit.fill,
                          ),
                        )),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        height: getProportionateScreenHeight(270),
                        child: Container(
                          child: Image.asset(
                            "assets/images/store/black_layer.png",
                            fit: BoxFit.fill,
                          ),
                        )),
                    Positioned(
                      top: getProportionateScreenHeight(34),
                      left: getProportionateScreenWidth(24),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: getProportionateScreenWidth(48),
                          height: getProportionateScreenHeight(48),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_outlined,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                   appLocal=="ar"? Positioned(
                        top: getProportionateScreenHeight(210),
                        right: getProportionateScreenWidth(15),
                        height: getProportionateScreenHeight(35),
                        child: Container(
                          height: getProportionateScreenHeight(35),
                          // width: getProportionateScreenWidth(150),
                          child: AutoSizeText(
                            widget.corner.userName!=""?widget.corner.userName:widget.corner.doctorName!=""?widget.corner.doctorName:widget.corner.storeName!=""?widget.corner.storeName:"",
                            style: blueButton_25pt,
                          ),
                        )): Positioned(
                       top: getProportionateScreenHeight(210),
                       left: getProportionateScreenWidth(15),
                       height: getProportionateScreenHeight(35),
                       child: Container(
                         height: getProportionateScreenHeight(35),
                         // width: getProportionateScreenWidth(150),
                         child: AutoSizeText(
                           widget.corner.userName!=""?widget.corner.userName:widget.corner.doctorName!=""?widget.corner.doctorName:widget.corner.storeName!=""?widget.corner.storeName:"",
                           style: blueButton_25pt,
                         ),
                       )),
                    Positioned(
                        top: getProportionateScreenHeight(305),
                        right: getProportionateScreenWidth(15),
                        left: 0,
                        height: getProportionateScreenHeight(505),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: getProportionateScreenHeight(35),
                                width: getProportionateScreenWidth(345),
                                child: AutoSizeText(
                                  controller.currentCorner.name,
                                  // textDirection: TextDirection.rtl,
                                  style: h6_20pt,
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Container(
                                width: getProportionateScreenWidth(345),
                                // alignment: Alignment.centerRight,
                                child: AutoSizeText(
                                  controller.currentCorner.desc,
                                  // textDirection: TextDirection.rtl,
                                  style: darkGrayText_16pt,
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(50),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () async {
                                        await _uploadPhoto();
                                      },
                                      child: Container(
                                        margin: appLocal!="ar"?EdgeInsets.only(left: getProportionateScreenWidth(16)) : EdgeInsets.only(right: getProportionateScreenWidth(16)) ,
                                        width:
                                        getProportionateScreenWidth(
                                            105),
                                        height: 130,
                                        decoration: BoxDecoration(
                                            color: Colors.grey
                                                .withOpacity(0.6),
                                            borderRadius:
                                            BorderRadius
                                                .circular(8)),
                                        child: Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.blue,
                                              size: 22,
                                            )),
                                      )),
SizedBox(width: getProportionateScreenWidth(5),),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 130,
                                    width: getProportionateScreenWidth(249),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.currentCorner.images.length,
                                      itemBuilder: (context,index)=>Padding(padding:EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),child: Stack(
                                        children: [


                                          GestureDetector(onTap:(){

                                              Get.to(()=>CornerPhotosView(controller.currentCorner.images,index));

                                          },child: Container(width: getProportionateScreenWidth(105),height: 130,decoration:BoxDecoration(boxShadow: shadow),child: ClipRRect( borderRadius:BorderRadius.circular(8),child: Image.network(Api.imagePath+controller.currentCorner.images[index].path,fit: BoxFit.fill,)),)),
                                          Positioned(
                                              left: getProportionateScreenWidth(
                                                  8),
                                              top: getProportionateScreenHeight(
                                                  8),
                                              child: Container(
                                                  height:
                                                  getProportionateScreenHeight(
                                                      30),
                                                  width:
                                                  getProportionateScreenWidth(
                                                      30),
                                                  decoration:
                                                  BoxDecoration(
                                                      shape: BoxShape
                                                          .circle,
                                                      color: Colors
                                                          .white),
                                                  child:
                                                  GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                            context:
                                                            context,
                                                            builder: ((context) =>
                                                                AlertDialog(
                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                  title: Text(
                                                                    'هل أنت متأكد ؟'.i18n,
                                                                    // textDirection: TextDirection.rtl,
                                                                    style: body1_16pt_blue,
                                                                  ),
                                                                  content: Text(
                                                                    'انت على وشك حذف هذه الصورة !'.i18n,
                                                                    // textDirection: TextDirection.rtl,
                                                                    style: body1_16pt_blue,
                                                                  ),
                                                                  actions: [
                                                                    TextButton(
                                                                      child: Text(
                                                                        'نعم'.i18n,style: body1_16pt_blue,
                                                                      ),
                                                                      onPressed: () async {
                                                                        controller.deleteSubImage(controller.currentCorner.images[index].id);
                                                                        // language.changeLanguage();
                                                                        Navigator.of(context).pop();

                                                                        /// await controller.deleteSubImage(controller.currentCorner.images[index].id);
                                                                        // Navigator.popUntil(context, ModalRoute.withName('/'));
                                                                      },
                                                                    ),
                                                                    TextButton(
                                                                      child: Text('لا'.i18n,style: body1_16pt_blue,),
                                                                      onPressed: () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                    )
                                                                  ],
                                                                )));
                                                      },
                                                      child:
                                                      Image
                                                          .asset(
                                                        "assets/images/vendor_app/trash.png",
                                                        fit: BoxFit
                                                            .fill,
                                                      ),
                                                  ))),
                                          Positioned(
                                              right: getProportionateScreenWidth(
                                                  8),
                                              bottom: getProportionateScreenHeight(
                                                  8),
                                              child: Container(
                                                  height:
                                                  getProportionateScreenHeight(
                                                      30),
                                                  width:
                                                  getProportionateScreenWidth(
                                                      30),
                                                  decoration:
                                                  BoxDecoration(
                                                      shape: BoxShape
                                                          .circle,
                                                      color: Colors
                                                          .white),
                                                  child:
                                                  GestureDetector(
                                                      onTap: () {
                                                        controller.currentCorner.images[index].status=="addedStatus"?
                                                            Get.rawSnackbar(message:"هذه الصورة بلفعل هي حالة لديك ".i18n,backgroundColor: Colors.green)
                                                              :
                                                        showDialog(
                                                            context:
                                                            context,
                                                            builder: ((context) =>
                                                                AlertDialog(
                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                  title: Text(
                                                                    'هل أنت متأكد ؟'.i18n,
                                                                    // textDirection: TextDirection.rtl,
                                                                    style: body1_16pt_blue,
                                                                  ),
                                                                  content: Text(
                                                                    'انت على وشك اضافة هذه الصورة الى حالتك !'.i18n,
                                                                    // textDirection: TextDirection.rtl,
                                                                    style: body1_16pt_blue,
                                                                  ),
                                                                  actions: [
                                                                    TextButton(
                                                                      child: Text('لا'.i18n,style: body1_16pt_blue,),
                                                                      onPressed: () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                    ),
                                                                    TextButton(
                                                                      child: Text(
                                                                        'نعم'.i18n,style: body1_16pt_blue,
                                                                      ),
                                                                      onPressed: () async {
                                                                        controller.subImageToStory(controller.currentCorner.images[index].id);
                                                                        // language.changeLanguage();
                                                                        Navigator.of(context).pop();

                                                                        /// await controller.deleteSubImage(controller.currentCorner.images[index].id);
                                                                        // Navigator.popUntil(context, ModalRoute.withName('/'));
                                                                      },
                                                                    ),

                                                                  ],
                                                                )));
                                                      },
                                                      child:Center (

                                                        child: Directionality(textDirection:TextDirection.ltr,child: Icon(Icons.send,color: controller.currentCorner.images[index].status=="addedStatus"?Colors.blue:Colors.grey,size: 15,)),
                                                      ),
                                                      // Image
                                                      //     .asset(
                                                      //   "assets/images/drawer/drawer_icons/corner_icon.png",
                                                      //   // fit: BoxFit
                                                      //       // .fill,
                                                      //
                                                      // ),
                                                  ))),
                                        ],
                                      )),
                                    ),
                                  ),
                                  // Container(
                                  //   alignment: Alignment.center,
                                  //   height: 130,
                                  //   width: getProportionateScreenWidth(340),
                                  //   child: ListView.builder(
                                  //     scrollDirection: Axis.horizontal,
                                  //     itemCount:
                                  //         controller.currentCorner.images.length,
                                  //     itemBuilder: (context, index) => index == 0
                                  //         ? Row(
                                  //             children: [
                                  //               Stack(
                                  //                 children: [
                                  //                   Positioned(
                                  //                       left: getProportionateScreenWidth(
                                  //                           8),
                                  //                       top: getProportionateScreenHeight(
                                  //                           8),
                                  //                       child: Container(
                                  //                           height:
                                  //                               getProportionateScreenHeight(
                                  //                                   35),
                                  //                           width:
                                  //                               getProportionateScreenWidth(
                                  //                                   35),
                                  //                           decoration:
                                  //                               BoxDecoration(
                                  //                                   shape: BoxShape
                                  //                                       .circle,
                                  //                                   color: Colors
                                  //                                       .white),
                                  //                           child:
                                  //                               GestureDetector(
                                  //                                   onTap: () {
                                  //                                     showDialog(
                                  //                                         context:
                                  //                                             context,
                                  //                                         builder: ((context) =>
                                  //                                             AlertDialog(
                                  //                                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                  //                                               title: Text(
                                  //                                                 'هل أنت متأكد ؟',
                                  //                                                 textDirection: TextDirection.rtl,
                                  //                                                 style: body3_18pt,
                                  //                                               ),
                                  //                                               content: Text(
                                  //                                                 'انت على وشك حذف هذه الزاوية !',
                                  //                                                 textDirection: TextDirection.rtl,
                                  //                                                 style: body1_16pt,
                                  //                                               ),
                                  //                                               actions: [
                                  //                                                 TextButton(
                                  //                                                   child: Text(
                                  //                                                     'نعم',
                                  //                                                   ),
                                  //                                                   onPressed: () async {
                                  //                                                     // language.changeLanguage();
                                  //                                                     Navigator.of(context).pop();
                                  //
                                  //                                                     /// await controller.deleteSubImage(controller.currentCorner.images[index].id);
                                  //                                                     // Navigator.popUntil(context, ModalRoute.withName('/'));
                                  //                                                   },
                                  //                                                 ),
                                  //                                                 TextButton(
                                  //                                                   child: Text('لا'),
                                  //                                                   onPressed: () {
                                  //                                                     Navigator.pop(context);
                                  //                                                   },
                                  //                                                 )
                                  //                                               ],
                                  //                                             )));
                                  //                                   },
                                  //                                   child: Image
                                  //                                       .asset(
                                  //                                     "assets/images/vendor_app/trash.png",
                                  //                                     fit: BoxFit
                                  //                                         .fill,
                                  //                                   )))),
                                  //                   Container(
                                  //                     width:
                                  //                         getProportionateScreenWidth(
                                  //                             120),
                                  //                     child: Image.network(
                                  //                       Api.imagePath +
                                  //                           widget.corner
                                  //                               .images[index],
                                  //                       fit: BoxFit.fill,
                                  //                     ),
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //             ],
                                  //           )
                                  //         : Stack(
                                  //             children: [
                                  //               Positioned(
                                  //                   left:
                                  //                       getProportionateScreenWidth(
                                  //                           8),
                                  //                   top:
                                  //                       getProportionateScreenHeight(
                                  //                           8),
                                  //                   child: Container(
                                  //                       height:
                                  //                           getProportionateScreenHeight(
                                  //                               35),
                                  //                       width:
                                  //                           getProportionateScreenWidth(
                                  //                               35),
                                  //                       decoration: BoxDecoration(
                                  //                           shape:
                                  //                               BoxShape.circle,
                                  //                           color: Colors.white),
                                  //                       child: GestureDetector(
                                  //                           onTap: () {
                                  //                             showDialog(
                                  //                                 context:
                                  //                                     context,
                                  //                                 builder:
                                  //                                     ((context) =>
                                  //                                         AlertDialog(
                                  //                                           shape:
                                  //                                               RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                  //                                           title:
                                  //                                               Text(
                                  //                                             'هل أنت متأكد ؟',
                                  //                                             textDirection:
                                  //                                                 TextDirection.rtl,
                                  //                                             style:
                                  //                                                 body3_18pt,
                                  //                                           ),
                                  //                                           content:
                                  //                                               Text(
                                  //                                             'انت على وشك حذف هذه الزاوية !',
                                  //                                             textDirection:
                                  //                                                 TextDirection.rtl,
                                  //                                             style:
                                  //                                                 body1_16pt,
                                  //                                           ),
                                  //                                           actions: [
                                  //                                             TextButton(
                                  //                                               child: Text(
                                  //                                                 'نعم',
                                  //                                               ),
                                  //                                               onPressed: () async {
                                  //                                                 // language.changeLanguage();
                                  //                                                 Navigator.of(context).pop();
                                  //
                                  //                                                 /// await controller.deleteSubImage(controller.currentCorner.images[index].id);
                                  //                                                 // Navigator.popUntil(context, ModalRoute.withName('/'));
                                  //                                               },
                                  //                                             ),
                                  //                                             TextButton(
                                  //                                               child: Text('لا'),
                                  //                                               onPressed: () {
                                  //                                                 Navigator.pop(context);
                                  //                                               },
                                  //                                             )
                                  //                                           ],
                                  //                                         )));
                                  //                           },
                                  //                           child: Image.asset(
                                  //                             "assets/images/vendor_app/trash.png",
                                  //                             fit: BoxFit.fill,
                                  //                           )))),
                                  //               Container(
                                  //                 width:
                                  //                     getProportionateScreenWidth(
                                  //                         103),
                                  //                 child: Image.network(
                                  //                   Api.imagePath +
                                  //                       controller.currentCorner
                                  //                           .images[index],
                                  //                   fit: BoxFit.fill,
                                  //                 ),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //
                                  //     ///105
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
        )
              //:LoadingScreen(),
      ),
    );
  }
}

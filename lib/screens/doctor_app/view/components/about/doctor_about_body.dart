import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';
import 'package:pets_ecommerce/configuration/constants/gradient.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/auth/view/register/register_screen.dart';
import 'package:pets_ecommerce/screens/doctor_app/controller/doctor_controler.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/location_model.dart';
import 'package:pets_ecommerce/screens/vendor_app/requests/vendor_app_requests.dart';
import '../about/components/edit_time_screen.dart';
import '../about/components/edit_email_screen.dart';
import '../about/components/edit_info_screen.dart';
import '../about/components/edit_social.dart';
import '../about/components/add_social_screen.dart';
import 'dart:math' as Math;
import 'package:image/image.dart' as Im;

import 'package:pets_ecommerce/screens/home/view/components/social_media_components.dart';
import 'package:pets_ecommerce/screens/stores/view/components/about/review_card.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/screens/vendor_app/controller/info_controller.dart';
import 'package:pets_ecommerce/screens/widgets/text_field.dart';
class AboutDoctorBodyScreen extends StatefulWidget {
  DoctorController doctorController;
  AboutDoctorBodyScreen(this.doctorController);
  @override
  _AboutDoctorBodyScreenState createState() => _AboutDoctorBodyScreenState();
}

class _AboutDoctorBodyScreenState extends State<AboutDoctorBodyScreen> {
  bool loaddata=false;
  List<City> addresses=[];
  // fetchData() async {
  //   loaddata=true;
  //   setState(() {
  //
  //   });
  //   await _vendorAppRequests.getModel();
  //   storeInfo= await _vendorAppRequests.getStoreInfo();
  //   // locationModel= await vendorAppRequests.getLocations();
  //   loaddata=false;
  //   setState(() {
  //
  //   });
  // }
  getaddresses() async {
    loaddata=true;
    setState(() {

    });
    try{
      LocationModel locationModel = await _vendorAppRequests.getLocations();
      addresses=locationModel.cities;
      loaddata=false;
      setState(() {

      });
    }catch(e)
    {
      consolePrint(e.toString());
      // loaddata=false;
      // setState(() {
      //
      // });
    }


  }

  TextEditingController openAt=TextEditingController();
  TextEditingController closeAt=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController info=TextEditingController();
  TextEditingController tempSocialLink=TextEditingController();
  TextEditingController tempSocialType=TextEditingController();
  VendorAppRequests _vendorAppRequests=VendorAppRequests();
  File tmpFile;
  String base64Image;
  Future<String> compressImage(File f) async {
    loaddata=true;
    setState(() {

    });
    print('starting compression');
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    int rand = new Math.Random().nextInt(10000);
    print('before decoding img');
    Im.Image image = Im.decodeImage(f.readAsBytesSync());
    print('before decoding img2');
    image = Im.copyResize(image,width: 1080);//MediaQuery.of(context).size.width.toInt());

    // image.format = Im.Image.RGBA; //was in old version of flutter
    //Im.Image newim = Im.remapColors(image, alpha: Im.LUMINANCE);
    // image = Im.remapColors(image, alpha: Im.LUMINANCE);
    print('before reducing quality');
    var newim2 = new File('$path/$rand.jpg')
      ..writeAsBytesSync(Im.encodeJpg(image, quality: 50));

    setState(() {
      tmpFile = newim2;
      base64Image = base64Encode(tmpFile.readAsBytesSync());
    });

    String fileName = tmpFile.path.split('/').last;

    //await upload(fileName);
    print('done');
    return base64Image;
  }



  @override
  void initState() {
    // TODO: implement init
    super.initState();
    getaddresses();
    // fetchData();

  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  GetBuilder<DoctorController> (
      init: widget.doctorController,
      builder: (controller)=> controller.isLoading==true?Center(child: Container(height: getProportionateScreenHeight(100),width: getProportionateScreenWidth(100),child: Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(height: getProportionateScreenHeight(5),),
          AutoSizeText("..Loading"),
        ],
      ),),):Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(24),
            right: getProportionateScreenWidth(24),
            top: getProportionateScreenWidth(16),
            // vertical: getProportionateScreenHeight(26)
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Row(
                  children: [
                    AutoSizeText(
                      controller.doctorModel.doctor.lastName==null ?"":controller.doctorModel.doctor.lastName,
                      style: h5_25pt,
                      minFontSize: 16,
                    ),

                    AutoSizeText(
                      " ",
                      style: h5_25pt,
                      minFontSize: 16,
                    ),

                    AutoSizeText(
                      controller.doctorModel.doctor.firstName==null ?"":controller.doctorModel.doctor.firstName,
                      style: h5_25pt,
                      minFontSize: 16,
                    ),
                    Spacer(),
                  ],
                ),

                Container(
                  height: getProportionateScreenHeight(60),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                            width: getProportionateScreenWidth(165),
                            padding: EdgeInsets.only(right: getProportionateScreenWidth(4)),

                            height:
                            getProportionateScreenHeight(45),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(6),
                              border: Border.all(
                                  width: 1,
                                  color:
                                  Colors.grey.withOpacity(0.6)),
                            ),
                            // padding: EdgeInsets.symmetric(
                            //     horizontal: 15),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                // value: controller.storeInfo.address,
                                // value: _value,
                                items: addresses
                                    .map((City item) {
                                  return DropdownMenuItem<City>(
                                    value: item,
                                    child: Container(
                                      width: getProportionateScreenWidth(150),
                                      height:
                                      getProportionateScreenHeight(30),
                                      child: AutoSizeText(
                                        item.name,
                                        textDirection:
                                        TextDirection.rtl,
                                        style: blackText_14pt,
                                        minFontSize: 8,
                                        maxLines: 1,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (city) async{
                                  print("before");
                                  await controller.changeLocation(city.id);
                                  print("after");

                                },
                                hint: Text(controller.doctorModel.doctor.address==null?"":controller.doctorModel.doctor.address),
                                elevation: 8,
                                style: blackText_14pt,
                                icon: Container(width:getProportionateScreenWidth(8),child: RotatedBox(quarterTurns:90,child: Icon(Icons.arrow_drop_down))),
                                iconDisabledColor: Colors.black,
                                iconEnabledColor: Colors.blue,
                                // isExpanded: true,
                              ),
                            )),
                      ),
                      Spacer(),
                      Container(height: getProportionateScreenHeight(30),width: getProportionateScreenWidth(30),child: Image.asset("assets/images/home/location_icon.png"),),

                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(25),),
                Container(
                  height: getProportionateScreenHeight(30),
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    "معلومات مهنية",
                    minFontSize: 14,
                    style: body3_18pt,
                    maxLines: 1,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(15),),
                Container(
                  // height: getProportionateScreenHeight(50),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.grey)),
                  child: Row(
                    children: [

                      Container(width: getProportionateScreenWidth(250),child: AutoSizeText(controller.doctorModel.doctor.info==null?"اضف معلومات مهنية":controller.doctorModel.doctor.info,style: darkGrayText_14pt,)),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          if(controller.doctorModel.doctor.info==null)
                          {
                            info.text="";
                            Get.to( ()=>EditInfoScreen(t1: info,title: "اضافة معلومات مهنية",action: (){print("before editing info");controller.changeInfo(info.text);print("after editing info");},));
                          }
                          else {
                            info.text= controller.doctorModel.doctor.info;
                            Get.to( ()=>EditInfoScreen(t1: info,title: "تعديل المعلومات مهنية",action: (){print("before editing info");controller.changeInfo(info.text);print("after editing info");},));
                          }


                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: getProportionateScreenHeight(30),
                          width: getProportionateScreenWidth(30),
                          child: Image.asset("assets/images/vendor_app/pen.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                ///location
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Container(
                  height: getProportionateScreenHeight(30),
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      AutoSizeText(
                        "مواعيد العمل",
                        minFontSize: 14,
                        style: body3_18pt,
                        maxLines: 1,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          if(controller.doctorModel.doctor.openFrom!=null&&controller.doctorModel.doctor.closeAt!=null) {
                            openAt.text =
                                controller.doctorModel.doctor.openFrom.toString();
                            closeAt.text =
                                controller.doctorModel.doctor.closeAt.toString();
                          }
                          Get.to(()=>EditTime(action:()async{print("before apply change");await controller.changeTime(openAt.text,closeAt.text);print("after apply change");},t1:openAt,t2:closeAt));

                        },
                        child: Container(
                          child: AutoSizeText(
                            "تعديل",
                            minFontSize: 14,
                            style: darkGrayText_14pt_underlined,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///مواعيد العمل
                SizedBox(
                  height: getProportionateScreenHeight(16),
                ),
                controller.doctorModel.doctor.openFrom==null&&controller.doctorModel.doctor.closeAt==null?
                Row(
                  children: [


                    Container(
                      height: getProportionateScreenHeight(20),
                      alignment: Alignment.bottomCenter,
                      child: AutoSizeText(
                        "اضف  مواعيد العمل لديك",
                        maxLines: 1,
                        style: darkGrayText_14pt,
                        minFontSize: 10,
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: getProportionateScreenHeight(30),
                      width: getProportionateScreenWidth(30),
                      child: Image.asset(
                        "assets/images/vendor_app/clender.png",
                        height: getProportionateScreenHeight(12),
                      ),
                    ),
                  ],
                ):Column(
                    children:[
                      Row(
                        children: [
                          AutoSizeText(
                            "يفتح في تمام الساعة",
                            maxLines: 1,
                            style: darkGrayText_14pt,
                            minFontSize: 10,
                          ),
                          Spacer(),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: AutoSizeText(
                              controller.doctorModel.doctor.openFrom.toString(),
                              maxLines: 1,
                              style: body1_16pt,
                              minFontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(5),),
                      Row(
                        children: [
                          AutoSizeText(
                            "يغلق في تمام الساعة",
                            maxLines: 1,
                            style: darkGrayText_14pt,
                            minFontSize: 10,
                          ),
                          Spacer(),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: AutoSizeText(
                              controller.doctorModel.doctor.closeAt.toString(),
                              maxLines: 1,
                              style: body1_16pt,
                              minFontSize: 10,
                            ),
                          ),
                        ],
                      ),

                    ]
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),

                Column(
                  children: [
                    Container(
                      height: getProportionateScreenHeight(30),
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          AutoSizeText(
                            "معلومات التواصل",
                            minFontSize: 14,
                            style: body3_18pt,
                            maxLines: 1,
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(15),),


                    Container(
                      height: getProportionateScreenHeight(50),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.grey)),
                      child: Row(
                        children: [
                          SizedBox(width: getProportionateScreenWidth(15),),
                          AutoSizeText("رقم الهاتف الجوال",style: darkGrayText_11pt,)  ,
                          Spacer(),
                          AutoSizeText(controller.doctorModel.doctor.mobile,style: darkGrayText_11pt,)  ,
                          Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(8),),
                    Container(
                      height: getProportionateScreenHeight(50),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.grey)),
                      child: Row(
                        children: [
                          SizedBox(width: getProportionateScreenWidth(15),),
                          AutoSizeText("الايميل  الالكتروني",style: darkGrayText_11pt,)  ,
                          Spacer(),
                          GestureDetector(onTap:(){},child: Container(alignment:Alignment.center,width:getProportionateScreenWidth(150),child: AutoSizeText(controller.doctorModel.doctor.email==null?"":controller.doctorModel.doctor.email,style: darkGrayText_11pt,maxLines: 1)))  ,
                          // Spacer(),
                          SizedBox(width: getProportionateScreenWidth(5),),
                          GestureDetector(
                            onTap: (){


                              if(controller.doctorModel.doctor.email==null)
                              {
                                email.text="";
                                Get.to( ()=>EditEmailScreen(t1: email,title: "اضافة بريد الكتروني",action: (){print("before editing email");controller.changeEmail(email.text);print("after editing email");},));
                              }
                              else {
                                email.text= controller.doctorModel.doctor.email;
                                Get.to( ()=>EditEmailScreen(t1: email,title: "تعديل البريد الكتروني",action: (){print("before editing email");controller.changeEmail(email.text);print("after editing email");},));
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: getProportionateScreenHeight(30),
                              width: getProportionateScreenWidth(30),
                              child: Image.asset("assets/images/vendor_app/pen.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20),),
                    Container(
                      height: getProportionateScreenHeight(30),
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          AutoSizeText(
                            " التواصل الاجتماعي",
                            minFontSize: 14,
                            style: body1_16pt,
                            maxLines: 1,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              tempSocialLink.text="";
                              tempSocialType.text="";
                              Get.to( ()=>AddSocialScreen(
                                addAction:()async{
                                  print("before apply change");
                                  await controller.AddSocial(link:tempSocialLink.text,type:tempSocialType.text,);
                                  print("after apply change");
                                },
                                type: tempSocialType,
                                link: tempSocialLink,
                              )
                              );


                              // if(controller.storeInfo.openFrom!=null&&controller.storeInfo.closedAt!=null) {
                              //   openAt.text =
                              //       controller.storeInfo.openFrom.toString();
                              //   closeAt.text =
                              //       controller.storeInfo.closedAt.toString();
                              // }
                              //  Get.to( ()=>EditTime(action:()async{print("before apply change");await controller.changeTime(int.parse(openAt.text),int.parse(closeAt.text));print("after apply change");},t1:openAt,t2:closeAt));

                            },
                            child: Container(
                              child: AutoSizeText(
                                "أضافة",
                                minFontSize: 14,
                                style: darkGrayText_14pt_underlined,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(15),),


                    for(int i=0;i<controller.doctorModel.doctor.doctorContacts.length;i++)
                      if(controller.doctorModel.doctor.doctorContacts[i].type=="facebook")
                        Column(
                          children: [
                            Container(
                              height: getProportionateScreenHeight(50),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.grey)),
                              child: Row(
                                children: [
                                  SizedBox(width: getProportionateScreenWidth(15),),
                                  Expanded(flex:2,child: AutoSizeText("حساب الفيسبوك",style: darkGrayText_11pt,maxLines: 1,))  ,
                                  Spacer(flex:1,),
                                  Expanded(
                                      flex:2,
                                      child:  AutoSizeText(controller.doctorModel.doctor.doctorContacts[i].link,style: darkGrayText_11pt,maxLines: 1,minFontSize: 9,)
                                  ),

                                  GestureDetector(
                                    onTap: (){
                                      tempSocialType.text=controller.doctorModel.doctor.doctorContacts[i].type;
                                      tempSocialLink.text=controller.doctorModel.doctor.doctorContacts[i].link;
                                      Get.to( ()=>EditSocialScreen(
                                        type: tempSocialType,
                                        link: tempSocialLink,
                                        editAction: ()async{
                                          consolePrint("berfor edit social");
                                          await controller.changeSocial(type:tempSocialType.text, link:tempSocialLink.text , socialId:controller.doctorModel.doctor.doctorContacts[i].id);//edit
                                          consolePrint("after edit social");
                                        },
                                        deleteAction: ()async{
                                          consolePrint("berfor edit social");
                                          await controller.DeleteSocial(controller.doctorModel.doctor.doctorContacts[i].id);//delete
                                          consolePrint("after delete social");
                                        },
                                      ));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: getProportionateScreenHeight(30),
                                      width: getProportionateScreenWidth(30),
                                      child: Image.asset("assets/images/vendor_app/pen.png"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(5),),
                          ],
                        ),
                    for(int i=0;i<controller.doctorModel.doctor.doctorContacts.length;i++)
                      if(controller.doctorModel.doctor.doctorContacts[i].type=="instagram")
                        Column(
                          children: [
                            Container(
                              height: getProportionateScreenHeight(50),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.grey)),
                              child: Row(
                                children: [
                                  SizedBox(width: getProportionateScreenWidth(15),),
                                  Expanded(flex:2,child: AutoSizeText("حساب الانستاغرام",style: darkGrayText_11pt,maxLines: 1,))  ,
                                  Spacer(flex:1,),
                                  Expanded(
                                      flex:2,
                                      child:  AutoSizeText(controller.doctorModel.doctor.doctorContacts[i].link,style: darkGrayText_11pt,maxLines: 1,minFontSize: 9,)
                                  ),

                                  GestureDetector(
                                    onTap: (){
                                      tempSocialType.text=controller.doctorModel.doctor.doctorContacts[i].type;
                                      tempSocialLink.text=controller.doctorModel.doctor.doctorContacts[i].link;
                                      Get.to( ()=>EditSocialScreen(
                                        type: tempSocialType,
                                        link: tempSocialLink,
                                        editAction: ()async{
                                          consolePrint("berfor edit social");
                                          await controller.changeSocial(type:tempSocialType.text, link:tempSocialLink.text , socialId:controller.doctorModel.doctor.doctorContacts[i].id);//edit
                                          consolePrint("after edit social");
                                        },
                                        deleteAction: ()async{
                                          consolePrint("berfor edit social");
                                          await controller.DeleteSocial(controller.doctorModel.doctor.doctorContacts[i].id);//delete
                                          consolePrint("after delete social");
                                        },
                                      ));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: getProportionateScreenHeight(30),
                                      width: getProportionateScreenWidth(30),
                                      child: Image.asset("assets/images/vendor_app/pen.png"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(5),),
                          ],
                        ), for(int i=0;i<controller.doctorModel.doctor.doctorContacts.length;i++)
                      if(controller.doctorModel.doctor.doctorContacts[i].type=="phone")
                        Column(
                          children: [
                            Container(
                              height: getProportionateScreenHeight(50),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.grey)),
                              child: Row(
                                children: [
                                  SizedBox(width: getProportionateScreenWidth(15),),
                                  Expanded(flex:2,child: AutoSizeText("رقم الهاتف",style: darkGrayText_11pt,maxLines: 1,))  ,
                                  Spacer(flex:1,),
                                  Expanded(
                                      flex:2,
                                      child:  AutoSizeText(controller.doctorModel.doctor.doctorContacts[i].link,style: darkGrayText_11pt,maxLines: 1,minFontSize: 9,)
                                  ),

                                  GestureDetector(
                                    onTap: (){
                                      tempSocialType.text=controller.doctorModel.doctor.doctorContacts[i].type;
                                      tempSocialLink.text=controller.doctorModel.doctor.doctorContacts[i].link;
                                      Get.to( ()=>EditSocialScreen(
                                        type: tempSocialType,
                                        link: tempSocialLink,
                                        editAction: ()async{
                                          consolePrint("berfor edit social");
                                          await controller.changeSocial(link:tempSocialLink.text, type:tempSocialType.text , socialId:controller.doctorModel.doctor.doctorContacts[i].id);//edit
                                          consolePrint("after edit social");
                                        },
                                        deleteAction: ()async{
                                          consolePrint("berfor delete social");
                                          await controller.DeleteSocial(controller.doctorModel.doctor.doctorContacts[i].id);//delete
                                          consolePrint("after delete social");
                                        },
                                      ));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: getProportionateScreenHeight(30),
                                      width: getProportionateScreenWidth(30),
                                      child: Image.asset("assets/images/vendor_app/pen.png"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(5),),
                          ],
                        ),




                    SizedBox(height: getProportionateScreenHeight(20),),
                    Container(
                      height: getProportionateScreenHeight(30),
                      alignment: Alignment.centerRight,
                      child: AutoSizeText(
                        "شعار الطبيب",
                        minFontSize: 14,
                        style: body3_18pt,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20),),
                    GestureDetector(
                      onTap: ()async{
                        final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
                        File imageFile = File(pickedFile.path);
                        if(pickedFile!=null) {
                          String temp = await compressImage(imageFile);
                          await controller.changeImage(temp);
                        }
                      },
                      child: controller.doctorModel.doctor.image==null||controller.doctorModel.doctor.image==""?Center(
                          child: Container(
                            height: getProportionateScreenHeight(75),
                            width: getProportionateScreenWidth(125),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/vendor_app/upload_photo.png")
                                )
                            ),
                            child: Center(
                              child: AutoSizeText(
                                "حمل صورة",
                                style: body1_16pt,
                                maxLines: 1,
                              ),
                            ),
                          )):Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: borderColor,width: 1,)),child: ClipRRect(borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: Api.imagePath+controller.doctorModel.doctor.image,
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              CircularProgressIndicator(value: downloadProgress.progress),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),),),
                    ),
                    SizedBox(height: getProportionateScreenHeight(30),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

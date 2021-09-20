import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/gradient.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:get/get.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';
import 'package:pets/screens/profile/controller/user_profile_controller.dart';
import 'package:pets/screens/vendor_app/model/location_model.dart';
import 'package:pets/screens/widgets/text_field.dart';
import 'dart:math' as Math;
import 'package:image/image.dart' as Im;
import '../../../main.dart';
import 'components/profile_item.dart';
import 'dart:io';
import 'translations/edit_profile_screen.i18n.dart';

class EditProfileScreen extends StatefulWidget {
  Function refresh;

  EditProfileScreen(this.refresh);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  UserController userController = Get.put(UserController());
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController oldPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  var editFirst = false.obs;
  var editLast = false.obs;
  var editEmail = false.obs;

  String location;
  int locationId = -1;

  File tmpFile;
  String base64Image;

  Future<String> compressImage(File f) async {
    loaddata = true;
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
    });

    String fileName = tmpFile.path.split('/').last;

    //await upload(fileName);
    print('done');
    return base64Image;
  }

  fetchData() async {
    await userController.fetchData();

    location = userController.doctorModel.doctor.address;
    firstNameController.text = userController.doctorModel.doctor.firstName;
    lastNameController.text = userController.doctorModel.doctor.lastName;
    emailController.text = userController.doctorModel.doctor.email;
  }

  checkPassword(String pass) async {
    Get.back();
    bool k = await userController.checkPassword(pass);
    if (k) {
      String ans;
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                title: Text(
                  'ادخل كلمة السر الجديدة '.i18n,
                  // textDirection: TextDirection.rtl,
                  style: body3_18pt,
                ),
                content: Container(
                  width: getProportionateScreenWidth(250),
                  height: getProportionateScreenHeight(60),
                  child: TextField(
                    onChanged: (v) {
                      ans = v;
                      print(ans);
                    },
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'العودة'.i18n,
                      style: GoogleFonts.tajawal(
                          color: Colors.red.withOpacity(0.6)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: Text(
                      'المتابعة'.i18n,
                      style: GoogleFonts.tajawal(
                          color: Colors.blue.withOpacity(0.6)),
                    ),
                    onPressed: () async {
                      if (ans == "" || ans == null) {
                        Get.rawSnackbar(
                            message: "كلمة المرور لا يمكن ان تكون فارغة".i18n,
                            backgroundColor: Colors.red);
                        return;
                      }
                      if (ans.length < 6) {
                        Get.rawSnackbar(
                            message:
                                "كلمة المرور لا يمكن ان تكون اقل من 6 محارف"
                                    .i18n,
                            backgroundColor: Colors.red);
                        return;
                      }
                      Get.back();
                      bool k = await userController.changePassword(pass);
                    },
                  ),
                ],
              )));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    // location=userController.doctorModel.doctor.address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<UserController>(
            init: userController,
            builder: (controller) => controller.isLoading
                ? Container(
                    height: getProportionateScreenHeight(550),
                    child: LoadingScreen())
                : Column(
                    children: [
                      Container(
                        height: getProportionateScreenHeight(410),
                        width: getProportionateScreenWidth(395),
                        child: Stack(
                          children: [
                            Positioned(
                                child: Container(
                              height: getProportionateScreenHeight(48),
                              width: getProportionateScreenWidth(48),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                  "assets/images/profile/back_circle.png"),
                            )),

                            Positioned(
                                child: Container(
                              height: getProportionateScreenHeight(410),
                              width: getProportionateScreenWidth(395),
                              child: Image.asset(
                                "assets/images/drawer/image_background.png",
                                fit: BoxFit.fill,
                              ),
                            )),

                            Positioned(
                              top: getProportionateScreenHeight(64),

                              // left: getProportionateScreenWidth(130),

                              child: Container(
                                height: getProportionateScreenHeight(143),
                                width: getProportionateScreenWidth(395),
                                alignment: Alignment.center,
                                child: Container(
                                  height: getProportionateScreenHeight(143),
                                  width: getProportionateScreenWidth(143),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Stack(
                                    overflow: Overflow.visible,
                                    children: [
                                      Container(
                                        height:
                                            getProportionateScreenHeight(143),
                                        width: getProportionateScreenWidth(143),
                                        child: GestureDetector(
                                          onTap: () async {
                                            final pickedFile =
                                                await ImagePicker().getImage(
                                                    source:
                                                        ImageSource.gallery);
                                            File imageFile =
                                                File(pickedFile.path);
                                            if (pickedFile != null) {
                                              String temp = await compressImage(
                                                  imageFile);
                                              await controller
                                                  .changeImage(temp);
                                              await widget.refresh();
                                            }
                                          },
                                          child: controller.doctorModel.doctor
                                                          .image ==
                                                      null ||
                                                  controller.doctorModel.doctor
                                                          .image ==
                                                      ""
                                              ? Center(
                                                  child: Container(
                                                  height:
                                                      getProportionateScreenHeight(
                                                          75),
                                                  width:
                                                      getProportionateScreenWidth(
                                                          125),
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "assets/images/vendor_app/upload_photo.png"))),
                                                  child: Center(
                                                    child: AutoSizeText(
                                                      "حمل صورة".i18n,
                                                      style: body1_16pt,
                                                      maxLines: 1,
                                                    ),
                                                  ),
                                                ))
                                              : Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: controller
                                                                    .doctorModel
                                                                    .doctor
                                                                    .image ==
                                                                null
                                                            ? AssetImage(
                                                                "assets/images/drawer/user_img.png")
                                                            : NetworkImage(Api
                                                                    .imagePath +
                                                                controller
                                                                    .doctorModel
                                                                    .doctor
                                                                    .image),
                                                        fit: BoxFit.fill),
                                                  ),
                                                ),
                                        ),
                                      ),

                                      // Image.asset("assets/images/drawer/user_img.png")
                                      // ),

                                      Positioned(
                                          bottom:
                                              getProportionateScreenHeight(-6),
                                          right:
                                              getProportionateScreenWidth(15),
                                          child: GestureDetector(
                                              onTap: () async {
                                                final pickedFile =
                                                    await ImagePicker()
                                                        .getImage(
                                                            source: ImageSource
                                                                .gallery);
                                                File imageFile =
                                                    File(pickedFile.path);
                                                if (pickedFile != null) {
                                                  String temp =
                                                      await compressImage(
                                                          imageFile);
                                                  await controller
                                                      .changeImage(temp);
                                                }
                                              },
                                              child: Container(
                                                height: 35,
                                                width: 35,
                                                child: Image.asset(
                                                    "assets/images/vendor_app/camera.png"),
                                              )))

                                      ///change photo
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            ///image

                            Positioned(
                              top: getProportionateScreenHeight(230),

                              // right: getProportionateScreenWidth(130),

                              child: Container(
                                width: getProportionateScreenWidth(395),
                                height: getProportionateScreenHeight(40),
                                alignment: Alignment.center,
                                child: AutoSizeText(
                                  controller.doctorModel.doctor.firstName +
                                      " " +
                                      controller.doctorModel.doctor.lastName,
                                  style: body3_25pt_nb2,
                                  maxLines: 1,
                                ),
                              ),
                            ),

                            ///name
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(50),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: getProportionateScreenWidth(361),
                        height: getProportionateScreenHeight(48),
                        child: Row(
                          children: [
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Container(
                              // alignment: Alignment.topCenter,
                              width: getProportionateScreenWidth(16),
                              height: getProportionateScreenHeight(20),
                              child: Image.asset(
                                  "assets/images/profile/personal_info_icon.png",
                                  fit: BoxFit.fill,
                                  color: Color(0xFF348BA7)),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Container(
                              alignment: appLocal == "ar"
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              width: getProportionateScreenWidth(180),
                              height: getProportionateScreenHeight(40),
                              child: AutoSizeText(
                                " المعلومات الشخصية ".i18n,
                                style: darkBlueText_13pt,
                                maxLines: 1,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(25),
                      ),
                      Container(
                        width: getProportionateScreenWidth(390),
                        margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(24)),
                        // height: getProportionateScreenHeight(50),
                        // alignment: Alignment.centerLeft,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: <Widget>[
                                Container(
                                  // alignment: Alignment
                                  //     .centerRight,
                                  height: getProportionateScreenHeight(30),
                                  width: getProportionateScreenWidth(150),
                                  child: Row(
                                    // mainAxisAlignment:
                                    // MainAxisAlignment
                                    //     .end,
                                    children: [
                                      AutoSizeText(
                                        "الاسم الأخير".i18n,
                                        style: body2_14pt,
                                      ),
                                      Container(
                                        height:
                                            getProportionateScreenHeight(25),
                                        width: getProportionateScreenWidth(15),
                                        child: Image.asset(
                                          "assets/images/auth/star.png",
                                          // fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  // alignment: Alignment
                                  //     .centerLeft,
                                  child: Container(
                                    height: getProportionateScreenHeight(60),
                                    width: getProportionateScreenWidth(150),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.grey, width: 0.3)),
                                    child: CustomTextField(
                                      textEditingController: lastNameController,
                                      // hint:,
                                      // prefixImage: "assets/images/auth/mobile_icon.png",
                                      // textInputType: TextInputType.phone,
                                      color: true,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(15),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   width:
                            //       getProportionateScreenWidth(
                            //           30),
                            // ),
                            Spacer(),
                            Column(
                              children: <Widget>[
                                Container(
                                  // alignment: Alignment
                                  //     .centerRight,
                                  height: getProportionateScreenHeight(30),
                                  width: getProportionateScreenWidth(150),
                                  child: Row(
                                    // mainAxisAlignment:
                                    // MainAxisAlignment
                                    //     .end,
                                    children: [
                                      AutoSizeText(
                                        "الاسم الاول".i18n,
                                        style: body2_14pt,
                                      ),
                                      Container(
                                        height:
                                            getProportionateScreenHeight(25),
                                        width: getProportionateScreenWidth(15),
                                        child: Image.asset(
                                          "assets/images/auth/star.png",
                                          // fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(4),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: getProportionateScreenHeight(60),
                                      width: getProportionateScreenWidth(151),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.grey, width: 0.3)),
                                      child: Row(
                                        children: [
                                          // Obx(
                                          //   ()=>editFirst.value?
                                          Container(
                                            width: getProportionateScreenWidth(
                                                120),
                                            child: CustomTextField(
                                              textEditingController:
                                                  firstNameController,
                                              // hint:,
                                              // prefixImage: "assets/images/auth/mobile_icon.png",
                                              // textInputType: TextInputType.phone,
                                              color: true,
                                            ),
                                            // ):Container(width: getProportionateScreenWidth(120),child: Container(alignment:Alignment.centerRight,
                                            //     margin:EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),child: AutoSizeText(controller.doctorModel.doctor.firstName==null?" ":controller.doctorModel.doctor.firstName,style: darkGrayText_13pt,minFontSize: 9,maxLines: 1,)),),
                                          ),
                                          // Obx(
                                          //       ()=> Container(
                                          //
                                          //     child: editFirst.value?Column(
                                          //       children: [
                                          //         GestureDetector(
                                          //           onTap: (){
                                          //             controller.changeFirstName(firstNameController.text);
                                          //           },
                                          //           child: Container(width: getProportionateScreenWidth(20),height:getProportionateScreenHeight(29),//color: Colors.red,
                                          //           child: Icon(CupertinoIcons.checkmark_alt,color: Colors.blue,size: 20,),),
                                          //         ),
                                          //         GestureDetector(
                                          //           onTap: (){
                                          //             editFirst.value=false;
                                          //           },
                                          //           child: Container(width: getProportionateScreenWidth(20),height:getProportionateScreenHeight(29),//color: Colors.green,
                                          //             child: Icon(CupertinoIcons.clear,color: Colors.red,size: 20,),
                                          //           ),
                                          //         ),
                                          //       ],
                                          //     ):GestureDetector(
                                          //         onTap: (){
                                          //           editFirst.value=true;
                                          //           firstNameController.text=controller.doctorModel.doctor.firstName;
                                          //         },
                                          //         child: Icon
                                          //           (Icons.edit,size: 22,color: Colors.grey,)),
                                          //   ),
                                          // )
                                          // ,
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(15),
                                ),
                              ],
                            ),

                            // Spacer(),
                            // Spacer(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: appLocal == "ar" ? 24 : 24),
                        // alignment: Alignment.centerRight,
                        height: getProportionateScreenHeight(30),
                        width: getProportionateScreenWidth(370),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AutoSizeText(
                              "عنوان السكن".i18n,
                              style: body2_14pt,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(4),
                            ),
                            Container(
                              height: getProportionateScreenHeight(25),
                              width: getProportionateScreenWidth(20),
                              child: Image.asset(
                                "assets/images/auth/star.png",
                                // fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: appLocal == "ar" ? 24 : 24),

                        alignment: appLocal == "ar"
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        // padding: EdgeInsets.only(left: getProportionateScreenWidth(5),right: getProportionateScreenWidth(5)),
                        child: Container(
                            padding: EdgeInsets.only(
                                left: getProportionateScreenWidth(5),
                                right: getProportionateScreenWidth(5)),
                            width: getProportionateScreenWidth(165),
                            height: getProportionateScreenHeight(45),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.grey.withOpacity(0.6)),
                            ),
                            // padding: EdgeInsets.symmetric(
                            //     horizontal: 15),
                            alignment: appLocal == "ar"
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Directionality(
                              textDirection: appLocal == "ar"
                                  ? TextDirection.ltr
                                  : TextDirection.rtl,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  // value: controller.storeInfo.address,
                                  // value: _value,
                                  items: controller.cities.map((City item) {
                                    return DropdownMenuItem<City>(
                                      value: item,
                                      child: Container(
                                        width: getProportionateScreenWidth(100),
                                        height:
                                            getProportionateScreenHeight(45),
                                        child: AutoSizeText(
                                          item.name,
                                          // textDirection:
                                          // TextDirection.rtl,
                                          style: blackText_14pt,
                                          minFontSize: 9,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (city) async {
                                    print("before");
                                    setState(() {
                                      location = city.name;
                                      locationId = city.id;
                                    });
                                    print("after");
                                    // await controller.changeLocation(locationId);
                                  },
                                  hint: Container(
                                    // color: Colors.red,
                                    width: getProportionateScreenWidth(120),
                                    alignment: appLocal == "ar"
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: AutoSizeText(
                                      location,
                                      maxLines: 1,
                                      minFontSize: 9,
                                    ),
                                  ),

                                  elevation: 8,
                                  style: blackText_14pt,
                                  icon: Container(
                                      width: getProportionateScreenWidth(8),
                                      child: RotatedBox(
                                          quarterTurns: 90,
                                          child: Icon(Icons.arrow_drop_down))),
                                  iconDisabledColor: Colors.black,
                                  iconEnabledColor: Colors.blue,
                                  // isExpanded: true,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: appLocal == "ar" ? 24 : 24),
                        alignment: appLocal == "ar"
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        height: getProportionateScreenHeight(30),
                        width: getProportionateScreenWidth(390),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AutoSizeText(
                              "البريد الالكتروني".i18n,
                              style: body2_14pt,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(4),
                            ),
                            Container(
                              height: getProportionateScreenHeight(25),
                              width: getProportionateScreenWidth(20),
                              child: Image.asset(
                                "assets/images/auth/star.png",
                                // fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: CustomTextField(
                          textEditingController: registerPasswordController,
                          hint: "البريد الالكتروني".i18n,
                          // prefixImage:
                          // "assets/images/auth/lock_icon.png",
                          // password: true,
                          textInputType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      GestureDetector(
                          onTap: () {
                            String ans;
                            showDialog(
                                context: context,
                                builder: ((context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      title: Text(
                                        'ادخل كلمة السر القديمة '.i18n,
                                        // textDirection: TextDirection.rtl,
                                        style: body3_18pt,
                                      ),
                                      content: Container(
                                        width: getProportionateScreenWidth(250),
                                        height:
                                            getProportionateScreenHeight(60),
                                        child: TextField(
                                          onChanged: (v) {
                                            ans = v;
                                            print(ans);
                                          },
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text(
                                            'العودة'.i18n,
                                            style: GoogleFonts.tajawal(
                                                color: Colors.red
                                                    .withOpacity(0.6)),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            // Navigator.pop(context);
                                          },
                                        ),
                                        TextButton(
                                          child: Text(
                                            'المتابعة'.i18n,
                                            style: GoogleFonts.tajawal(
                                                color: Colors.blue
                                                    .withOpacity(0.6)),
                                          ),
                                          onPressed: () async {
                                            if (ans == "" || ans == null) {
                                              Get.rawSnackbar(
                                                  message:
                                                      "كلمة المرور لا يمكن ان تكون فارغة"
                                                          .i18n,
                                                  backgroundColor: Colors.red);
                                              return;
                                            }
                                            if (ans.length < 6) {
                                              Get.rawSnackbar(
                                                  message:
                                                      "كلمة المرور لا يمكن ان تكون اقل من 6 محارف"
                                                          .i18n,
                                                  backgroundColor: Colors.red);
                                              return;
                                            }
                                            checkPassword(ans);
                                          },

                                          // language.changeLanguage();
                                          // Navigator.of(context).pop();
                                          // await  LocalStorageService.prefs.clear();
                                          // Get.offAll(SplashScreen());
                                          // Navigator.popUntil(context, ModalRoute.withName('/'));
                                        ),
                                      ],
                                    )));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(12)),
                            width: getProportionateScreenWidth(390),
                            child: AutoSizeText(
                              "هل تريد تغير كلمة المرور ؟".i18n,
                              style: body2_14pt_underlined,
                            ),
                          )),
                      SizedBox(
                        height: getProportionateScreenHeight(25),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        height: getProportionateScreenHeight(60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  if (firstNameController.text == "" ||
                                      lastNameController.text == "") {
                                    CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.error,
                                      text:
                                          "الرجاء ملئ كافة الحقول قبل تعديل البيانات"
                                              .i18n,
                                    );
                                    return;
                                  }
                                  // if(image==null)
                                  // {
                                  //   CoolAlert.show(context: context, type: CoolAlertType.error,text: "الرجاء اضافة صورة للمنتج",title: "فشلت العملية",);
                                  //   return;
                                  // }

                                  // widget.storeProduct.id;
                                  // widget.storeProduct.image;

                                  await controller.updateUser(
                                      locationId,
                                      firstNameController.text,
                                      lastNameController.text,
                                      emailController.text);
                                  await widget.refresh();
                                  // vendorAppTabController.animateTo(0);
                                  // vendorAppLabelController.changeIndex(0);
                                },
                                child: Container(
                                  width: getProportionateScreenWidth(170),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      gradient: blueGradient),
                                  child: Center(
                                    child: AutoSizeText(
                                      "تعديل ".i18n,
                                      style: blueButton_14pt,
                                    ),
                                  ),
                                )),
                            GestureDetector(
                                onTap: () {
                                  // vendorAppTabController.animateTo(0);
                                  // vendorAppLabelController.changeIndex(0);
                                  Get.back();
                                },
                                child: Container(
                                  width: getProportionateScreenWidth(170),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          color: Color(0xFF49C3EA),
                                          width: 0.8)),
                                  child: Center(
                                    child: AutoSizeText(
                                      "العودة".i18n,
                                      style: body2_14pt,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

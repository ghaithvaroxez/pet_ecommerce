import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/gradient.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';
import 'package:pets/screens/my_corner/controller/my_corners_controller.dart';
import 'package:pets/screens/my_corner/controller/my_corners_details_controller.dart';
import 'package:pets/screens/vendor_app/controller/products_controller.dart';
import 'package:pets/screens/vendor_app/model/categories.dart';
import 'package:pets/screens/vendor_app/model/constants.dart';
import 'package:pets/screens/vendor_app/model/product.dart';
import 'package:pets/screens/vendor_app/model/types.dart';
import 'package:pets/screens/vendor_app/requests/products_requests.dart';
import 'package:pets/screens/widgets/text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math' as Math;
import 'package:image/image.dart' as Im;
import 'dart:io';
import 'package:get/get.dart';
import 'translations/ediit_corner_screen.i18n.dart';

class EditCornerScreen extends StatefulWidget {
  @override
  _EditCornerScreenState createState() => _EditCornerScreenState();
  MyCornersDetailsController myCornersDetailsController;

  EditCornerScreen(this.myCornersDetailsController);
}

class _EditCornerScreenState extends State<EditCornerScreen> {
  var image;

  var subImage;

  File tmpFile;
  String base64Image;
  String newImage = "";
  List<String> subImages = [];
  List<File> subImagesFiles = [];

  getcompress(File imageFile) async {
    setState(() {
      isloading = true;
    });
    newImage = await compressImage(imageFile);
    setState(() {
      isloading = false;
    });
  }

  getCompressForSubImages(File imageFile) async {
    setState(() {
      isloading = true;
    });
    String temp = await compressImage(imageFile);
    subImages.add(temp);
    setState(() {
      isloading = false;
    });
  }

  // bool changeImage=false;
  Future<String> compressImage(File f) async {
    isloading = true;
    setState(() {});
    print('starting compression');
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    int rand = new Math.Random().nextInt(10000);
    print('before decoding img');
    Im.Image image = Im.decodeImage(f.readAsBytesSync());
    print('before decoding img2');
    image = Im.copyResize(image, width: 1080);
    //MediaQuery.of(context).size.width.toInt());

    // image.format = Im.Image.RGBA; //was in old version of flutter
    //Im.Image newim = Im.remapColors(image, alpha: Im.LUMINANCE);
    // image = Im.remapColors(image, alpha: Im.LUMINANCE);
    print('before reducing quality');
    var newim2 = new File('$path/$rand.jpg')
      ..writeAsBytesSync(Im.encodeJpg(image, quality: 50));

    setState(() {
      tmpFile = newim2;
      base64Image = base64Encode(tmpFile.readAsBytesSync());
      isloading = false;
    });

    String fileName = tmpFile.path.split('/').last;

    //await upload(fileName);
    print('done');
    return base64Image;
  }

  bool isloading = false;
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();

  // TextEditingController priceController = new TextEditingController();
  // VendorAppProductsReq _vendorAppProductsReq=VendorAppProductsReq();
  // fetchdata()async
  // {
  //   setState(() {
  //     isloading=true;
  //   });
  //   vendor_type_items=await _vendorAppProductsReq.getStoreTypes();
  //   vendor_category_items=await _vendorAppProductsReq.getStoreCategories();
  //   typeName=vendor_type_items[0].name;
  //   categoryName=vendor_category_items[0].name;
  //   typeId=vendor_type_items[0].id;
  //   categoryId=vendor_category_items[0].id;
  //
  //   setState(() {
  //     isloading=false;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.myCornersDetailsController.currentCorner.name;
    descriptionController.text =
        widget.myCornersDetailsController.currentCorner.desc;
    // fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
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
                            Spacer(),
                            Container(
                                height: getProportionateScreenHeight(28),
                                child: AutoSizeText(
                                  "زاويتي".i18n,
                                  style: h5_21pt,
                                  minFontSize: 8,
                                )),
                            Spacer(),
                            SizedBox(
                              width: getProportionateScreenWidth(24),
                            ),
                          ],
                        )),
                  ),
                ),

                ///app bar
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                Container(
                  height: getProportionateScreenHeight(30),
                  child: Container(
                    alignment: Alignment.centerRight,
                    height: getProportionateScreenHeight(30),
                    width: getProportionateScreenWidth(345),

                    // width: getProportionateScreenWidth(150),
                    child: AutoSizeText(
                      "الصورة الرئيسية".i18n,
                      style: body3_18pt,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Container(
                  height: getProportionateScreenHeight(151),
                  width: getProportionateScreenWidth(345),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.6), width: 1)),
                  child: image == null
                      ? GestureDetector(
                          onTap: () async {
                            image = await ImagePicker.pickImage(
                                source: ImageSource.gallery);
                            File imageFile = File(image.path);
                            if (image != null) {
                              newImage = await compressImage(imageFile);
                            }
                            setState(() {});
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                Api.imagePath +
                                    widget.myCornersDetailsController
                                        .currentCorner.image,
                                fit: BoxFit.cover,
                              )))
                      : GestureDetector(
                          onTap: () async {
                            image = await ImagePicker.pickImage(
                                source: ImageSource.gallery);
                            File imageFile = File(image.path);
                            if (image != null) {
                              getcompress(imageFile);
                            }
                            setState(() {});
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                image,
                                fit: BoxFit.cover,
                              )),
                        ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Container(
                  height: getProportionateScreenHeight(30),
                  child: Container(
                    // margin: EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.centerRight,
                    height: getProportionateScreenHeight(30),
                    width: getProportionateScreenWidth(345),
                    // width: getProportionateScreenWidth(150),
                    child: AutoSizeText(
                      "وصف الزاوية".i18n,
                      style: body3_18pt,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Container(
                  height: getProportionateScreenHeight(75),
                  width: getProportionateScreenWidth(345),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.6), width: 1)),
                  child: CustomTextField(
                    textEditingController: nameController,
                    hint: "اكتب عنوان الزاوية هنا".i18n,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Container(
                  height: getProportionateScreenHeight(85),
                  width: getProportionateScreenWidth(345),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.6), width: 1)),
                  child: CustomTextField(
                    textEditingController: descriptionController,
                    hint: "اكتب وصف الزاوية هنا".i18n,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(160),
                ),

                Container(
                  height: getProportionateScreenHeight(60),
                  width: getProportionateScreenWidth(345),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () async {
                            if (nameController.text == "" ||
                                descriptionController.text == "") {
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.error,
                                text: "الرجاء ملئ كافة الحقول قبل اضافة الزاوية"
                                    .i18n,
                              );
                              return;
                            }
                            // if(image==null)
                            // {
                            //   CoolAlert.show(context: context, type: CoolAlertType.error,text: "الرجاء اضافة صورة رئيسية للزاوية",title: "فشلت العملية",);
                            //   return;
                            // }

                            // widget.storeProduct.id;
                            // widget.storeProduct.image;
                            // widget.storeProduct.price=priceController.text;
                            // widget.storeProduct.name=nameController.text;
                            // widget.storeProduct.body=descriptionController.text;
                            await widget.myCornersDetailsController.editCorner(
                                nameController.text,
                                descriptionController.text,
                                newImage,
                                image == null ? false : true);
                            // Get.back();
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
                            //   vendorAppTabController.animateTo(0);
                            //   vendorAppLabelController.changeIndex(0);
                            Get.back();
                          },
                          child: Container(
                            width: getProportionateScreenWidth(170),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: Color(0xFF49C3EA), width: 0.8)),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

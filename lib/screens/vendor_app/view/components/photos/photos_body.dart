import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:pets_ecommerce/screens/vendor_app/controller/photos_controler.dart';

import '../../../../loading_screen.dart';
import '../photos/vendor_photo_card.dart';
import 'dart:math' as Math;
import 'package:image/image.dart' as Im;
import 'dart:io';
import 'package:pets_ecommerce/screens/vendor_app/model/image_model.dart' as im;
import 'package:pets_ecommerce/screens/stores/view/components/photos/photos_view.dart';
class VendorPhotosBody extends StatefulWidget {
  // int id;
  // VendorPhotosBody(this.id);
  @override
  _VendorPhotosBodyState createState() => _VendorPhotosBodyState();
}

class _VendorPhotosBodyState extends State<VendorPhotosBody> {



  // List<im.Image> images=[];
  bool loading =false;
  bool error=false;


  // fetchData()async
  // {
  //   consolePrint("fetch data");
  //   loading=true;
  //   setState(() {
  //
  //   });
  //
  //   var url=Uri.parse("${Api.baseUrl}/store/images/${widget.id}");
  //   final apiResult =await http.get(url);
  //   if(apiResult.statusCode==200)
  //   {
  //     var d= json.decode(apiResult.body);
  //     consolePrint(d["store"].toString());
  //     var model=im.imagesModelFromJson(d["store"]);
  //
  //     images= model.images;
  //   }
  //
  //   else
  //   {
  //     error=true;
  //   }
  //
  //   loading=false;
  //   setState(() {
  //
  //   });
  //
  //
  // }


  VendorPhotosController photosController =Get.put(VendorPhotosController());
  var image ;
  File tmpFile;
  String base64Image;
  String newImage="";
  Future<String> compressImage(File f) async {
    loading=true;
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
      loading=false;
    });

    String fileName = tmpFile.path.split('/').last;

    //await upload(fileName);
    print('done');
    return base64Image;
  }
  getcompress(File imageFile) async
  {
    setState(() {
      loading=true;
    });
    newImage = await compressImage(imageFile);
    setState(() {
      loading=false;
    });
  }
  @override
  void initState() {
    // fetchData();
    // TODO: implement initState
    super.initState();
    consolePrint("initial state of gproductas boud tgg screvnn ffdmfk dfdkmdkfmfdfldsomf ddmksdmkvmm vkds dokfdokm;ksidk;m;;kodfsdm n ds");
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return
loading?LoadingScreen():
    GetBuilder<VendorPhotosController>(
      init:photosController ,
      builder: (controller)=>controller.loading?LoadingScreen():Container(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
            vertical: getProportionateScreenHeight(8)),
        child:  SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [

                  ...List<Widget>.generate(
                    controller.images.length,
                        (index)=>index%2==0?index==controller.images.length-1?Column(children: [

                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),

                            child:    VendorAppImageCard((){
                              Get.to(()=>StorePhotosView(controller.images,index));

                            },controller.images[index],()async{await controller.deletePhoto(controller.images[index].id);}),
                          ),



                        ],):Container(
                      margin: EdgeInsets.symmetric(vertical: 10),

                      child:  VendorAppImageCard((){
                        Get.to(()=>StorePhotosView(controller.images,index));

                      },controller.images[index],()async{await controller.deletePhoto(controller.images[index].id);}),
                    ):Container(height: 0,),

                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(14)),
                    child: GestureDetector(
                      onTap: ()async
                      {
                        image = await ImagePicker.pickImage(source: ImageSource.gallery);
                        File imageFile = File(image.path);

                        if(image!=null) {
                          await getcompress(imageFile);
                        }
                        else {
                          consolePrint("image is null");
                        }
                        setState(() {

                        });
                        if(newImage!=null||newImage!="")
                          await controller.addNewImage(image: newImage);
                        else consolePrint("error loading image");
                      },
                      child: Container(
                        // margin: EdgeInsets.only(left: getProportionateScreenWidth(16),right:getProportionateScreenWidth(16),bottom: getProportionateScreenHeight(16)),
                        width: getProportionateScreenWidth(163),
                        height: getProportionateScreenHeight(160),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: 0.3, color: borderColor),
                            color:Colors.grey.withOpacity(0.4)),
                        child: Center(
                          child: Icon(Icons.add,size: 35,color: Colors.blue,),
                        ),

                      ),
                    ),
                  ),
                  ...List<Widget>.generate(
                    controller.images.length,
                        (index)=>index%2==1?index==controller.images.length-1?Column(children: [

                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),

                            child:    VendorAppImageCard((){
                              Get.to(()=>StorePhotosView(controller.images,index));

                            },controller.images[index],()async{await controller.deletePhoto(controller.images[index].id);}),
                          ),

                        ],):Container(
                      margin: EdgeInsets.symmetric(vertical: 10),

                      child:    VendorAppImageCard((){
                        Get.to(()=>StorePhotosView(controller.images,index));

                      },controller.images[index],()async{await controller.deletePhoto(controller.images[index].id);}),
                    ):Container(height: 0,),

                  ),

                ],
              ),
            ],
          ),
        ),

      ),

    );
  }
}

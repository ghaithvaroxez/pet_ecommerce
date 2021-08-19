import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/auth/controller/services/auth_services.dart';
import 'package:pets_ecommerce/screens/stores/view/components/products/store_product_card.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:pets_ecommerce/screens/vendor_app/controller/photos_controler.dart';
import 'package:pets_ecommerce/services/http_requests_service.dart';

import '../../../../loading_screen.dart';
import '../photos/photo_card.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/image_model.dart' as im;
import '../photos/photos_view.dart';
class CustomerPhotosBody extends StatefulWidget {
  int id;
  CustomerPhotosBody(this.id);
  @override
  _CustomerPhotosBodyState createState() => _CustomerPhotosBodyState();
}

class _CustomerPhotosBodyState extends State<CustomerPhotosBody> {



  List<im.Image> images=[];
  bool loading =true;
  bool error=false;


  fetchData()async
  {
    consolePrint("fetch data");
    loading=true;
    setState(() {

    });

    var url=Uri.parse("http://pets.sourcecode-ai.com/api/store/images/${widget.id.toString()}");
    String token=await AuthServices.getAuthToken();
    consolePrint(token)
;
    final apiResult =await http.get(url,headers: {"Authorization": "Bearer $token",});
    consolePrint("status code :" +apiResult.statusCode.toString());
    consolePrint("id :" +widget.id.toString());

    if(apiResult.statusCode==200)
    {

      var d= json.decode(apiResult.body);
      // consolePrint(d["store"].toString());
      var model=im.ImagesModel.fromJson(d["store"]);
      images= model.images;

    }

    else
    {
      consolePrint("error in fetch data");
      error=true;
    }

    loading=false;
    setState(() {

    });


  }


  // VendorPhotosController photosController =Get.put(VendorPhotosController());
  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
    consolePrint("initial state of gproductas boud tgg screvnn ffdmfk dfdkmdkfmfdfldsomf ddmksdmkvmm vkds dokfdokm;ksidk;m;;kodfsdm n ds");
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return loading?LoadingScreen():images.length==0
?Container(
      width: getProportionateScreenWidth(390),
      height: getProportionateScreenHeight(350),
      child: Center(child: AutoSizeText("لا يوجد عناصر حاليا",style: body1_16pt,)),
    ):
      Container(
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
                    images.length,
                        (index)=>index%2==0?GestureDetector(
                          onTap: (){
                            Get.to(()=>StorePhotosView(images,index));
                          },
                          child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),

                      child:  StoreImageCard(images[index]),
                    ),
                        ):Container(height: 0,),

                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  ...List<Widget>.generate(
                    images.length,
                        (index)=>index%2==1?GestureDetector(
                          onTap: (){
                            Get.to(()=>StorePhotosView(images,index));
                          },
                          child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),

                      child:    StoreImageCard(images[index]),
                    ),
                        ):Container(height: 0,),

                  ),
                ],
              ),
            ],
          ),
        ),

      );
  }
}

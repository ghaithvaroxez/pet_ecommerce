import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/auth/controller/services/auth_services.dart';
import 'package:pets_ecommerce/screens/auth/model/user.dart';
import 'package:pets_ecommerce/screens/corner/model/corner_model.dart';
import 'package:http/http.dart' as http;
import 'package:pets_ecommerce/services/http_requests_service.dart';

import '../../loading_screen.dart';
import 'package:get/get.dart';
class CornerDetails extends StatefulWidget {
  bool end;
  Corner corner;
CornerDetails(this.corner,this.end);
  @override
  _CornerDetailsState createState() => _CornerDetailsState();
}

class _CornerDetailsState extends State<CornerDetails> {

  bool loading=false;
  bool error=false;
  CornersModel cornersModel;
  fetchData()async{

    consolePrint("fetch data");
    loading=true;
    setState(() {

    });
    try {
      UserModel userModel= await AuthServices.getCurrentUser();

      consolePrint("before corners requests");
      var url;
      if(userModel.store.length==0){
         url = Uri.parse(
          "http://pets.sourcecode-ai.com/api/myCorners",
        );
      }
      else {
         url = Uri.parse(
        "http://pets.sourcecode-ai.com/api/myCorners?store_id=${userModel.store[0].id.toString()}",
      );

      }
      final apiResult =
      await http.get(url,headers: await HttpService().getHeaders());
      consolePrint("corners statusCode"+apiResult.statusCode.toString());
      if (apiResult.statusCode == 200) {
        cornersModel = cornersModelFromJson(apiResult.body);
     consolePrint(cornersModel.toString());
      } else {
        error = true;
      }
      loading = false;
      setState(() {});
    }catch(e)
    {
      loading = false;
      error = true;
      setState(() {});
      consolePrint("Corners error:"+e.toString());
    }
    consolePrint("after corners requests");

  }
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    consolePrint("in int state");
    if(!widget.end)fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: SafeArea(
        child: error?Container(height: getProportionateScreenHeight(400),width: getProportionateScreenWidth(400),
          child: Center(child: AutoSizeText("عذراً لقد حدثت مشكلة الرجاء المحاولة لاحقاً"),),):loading?LoadingScreen():Stack(
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
                   Api.imagePath+ widget.corner.image,
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
                onTap: (){
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

            Positioned(
                top: getProportionateScreenHeight(190),

                right:getProportionateScreenWidth(15),
                height: getProportionateScreenHeight(35),
                child: Container(
                  height: getProportionateScreenHeight(35),
                  width: getProportionateScreenWidth(150),

                  child: AutoSizeText("احمد العمودي",style: blueButton_25pt,),

                )),

            Positioned(
                top: getProportionateScreenHeight(305),

                right:getProportionateScreenWidth(15),
                height: getProportionateScreenHeight(505),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: getProportionateScreenHeight(35),
                        width: getProportionateScreenWidth(345),

                        child: AutoSizeText(widget.corner.name,textDirection: TextDirection.rtl,style: h6_20pt,),

                      ),
                      SizedBox(height: getProportionateScreenHeight(20),),
                    Container(
                      width: getProportionateScreenWidth(345),
                      alignment: Alignment.centerRight,
                      child: AutoSizeText(widget.corner.desc
                       ,
                          textDirection: TextDirection.rtl,
                          style: darkGrayText_16pt,),
                    ),
                      SizedBox(height: getProportionateScreenHeight(50),),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          alignment: Alignment.center,
                          height: 130,
                          width: getProportionateScreenWidth(340),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.corner.images.length,
                            itemBuilder: (context,index)=>Padding(padding:EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),child: Container(width: getProportionateScreenWidth(105),decoration:BoxDecoration(boxShadow: shadow),child: ClipRRect( borderRadius:BorderRadius.circular(8),child: Image.network(Api.imagePath+widget.corner.images[index].path,fit: BoxFit.fill,)),)),
                          ),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(20),),
                      widget.end?Container(width: 0,height: 0,):
                      Column(
                        children: [
                          Container(
                            height: getProportionateScreenHeight(35),
                            width: getProportionateScreenWidth(345),

                            child: AutoSizeText("الزوايا السابقة",textDirection: TextDirection.rtl,style: h6_20pt,),

                          ),
                          SizedBox(height: getProportionateScreenHeight(20),),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                              alignment: Alignment.center,
                              height: 130,
                              width: getProportionateScreenWidth(340),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: cornersModel.corners.length,
                                itemBuilder: (context,index)=>
                                cornersModel.corners[index].id!=widget.corner.id?
                                GestureDetector(onTap:(){
                                  consolePrint("pressed !!!!!!");
                                  Get.to(()=>CornerDetails(cornersModel.corners[index],true));
                                },child: Container(width: getProportionateScreenWidth(105),child: Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: Container(width: getProportionateScreenWidth(103),height: getProportionateScreenHeight(127),child: ClipRRect(borderRadius:BorderRadius.circular(8),child: Image.network(Api.imagePath+cornersModel.corners[index].image,fit: BoxFit.fill,)),))
                                // Image.network(cornersModel.corners[index].image,fit: BoxFit.fill,),
                                ))
                                    :Container(width: 0,height: 0,),
                              ),
                            ),
                          ),
                          // SizedBox(height: getProportionateScreenHeight(10),),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/home/view/components/search_bar_component.dart';
import 'package:pets/screens/home/view/components/social_media_components.dart';
import 'package:pets/screens/orders/model/all_orders_model.dart';
import 'package:pets/screens/orders/views/components/vertical_order_list_card.dart';
import 'package:pets/screens/orders/views/order_details_screen.dart';
import 'package:pets/services/http_requests_service.dart';
import '../../../main.dart';
import '../../loading_screen.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'translations/my_answered_order_screen.i18n.dart';


class MyAnswerdOrdersScreen extends StatefulWidget {
  @override
  _MyAnswerdOrdersScreenState createState() => _MyAnswerdOrdersScreenState();
}
// OrdersController allOrdersController=Get.put(OrdersController());

class _MyAnswerdOrdersScreenState extends State<MyAnswerdOrdersScreen> {
  bool loading =false;
  bool error=false;
  List<Answer> answers;
  deleteAnswer(int answerId)async{
    loading=true;
    setState(() {

    });
    try{
      var url = Uri.parse(
          "${Api.baseUrl}/delete/answer/${answerId.toString()}");
      consolePrint("before add answer print");
      consolePrint("try to post on " + url.path);

      final h = await HttpService().getHeaders();
      final apiResult = await http.get(url, headers: h,
        //     body:{
        //   "answer":answer
        // }
      );
      consolePrint("after add to favorite print");

      if (apiResult.statusCode == 200) {
        consolePrint("statusCode==200");
        // var j = jsonDecode(apiResult.body);
        Get.rawSnackbar(message: "لقد تم حذف الرد بنجاح".i18n,backgroundColor: Colors.green.withOpacity(0.8));
        await fetchData();

        // return true;
      } else {
        consolePrint("statusCode!=200");

        loading=false;
        setState(() {

        });
        Get.rawSnackbar(message: "لم نتمكن من حذف ردك الان الرجاء المحاولة لاحقا".i18n,backgroundColor: Colors.red.withOpacity(0.8));

        // return false;
      }
    }
    catch(e){
      consolePrint(e.toString());
      Get.rawSnackbar(message: "لم نتمكن من حذف ردك الان الرجاء المحاولة لاحقا".i18n,backgroundColor: Colors.red.withOpacity(0.8));
    }

  }
  fetchData()async{
    error=false;
    loading=true;
    setState(() {

    });
    // try{

      var url=Uri.parse("${Api.baseUrl}/show/my/answers");
      consolePrint("before print");
      final h=await HttpService().getHeaders();
      final apiResult=await http.get(url,headers: h);
      consolePrint("after print");
consolePrint("statusCode:"+apiResult.statusCode.toString());
      if(apiResult.statusCode==200)
      {
        var j=jsonDecode(apiResult.body);
        answers =j["orders"]==null?[]: List<Answer>.from(j["orders"].map((x) => Answer.fromJson(x)));
      }
      else {
        error=true;
      }

    // }catch(e){
    //   error=true;
    //   consolePrint(e.toString());
    //   loading=false;
    //   setState(() {
    //
    //   });

    // }



    loading=false;
    setState(() {

    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    // allOrdersController.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return
      // GetBuilder<OrdersController>(
      //     init: allOrdersController,
      //     builder: (controller)=>
              Container(
              // margin: EdgeInsets.only(bottom: getProportionateScreenHeight(100)),
              child:   error?Column(mainAxisSize: MainAxisSize.max,children: [
                Container(height:getProportionateScreenHeight(300),width: getProportionateScreenWidth(370),child: Center(child: Text("الرجاء المحاولة مجدداً".i18n,style: body3_18pt,),),),
              ],):  loading?LoadingScreen():RefreshIndicator(
                onRefresh: ()async{
                  await fetchData();
                },
                child:        answers.length==0?Container(height: getProportionateScreenHeight(400),width: getProportionateScreenWidth(390),alignment:Alignment.center,child: AutoSizeText("لا يوجد ردود لك حتى الان".i18n,style: body3_18pt,),):SingleChildScrollView(
                  child: Column(
                    children: [
                ...List<Widget>.generate(   answers.length, (index) => GestureDetector(
                        onTap: (){
                         Get.to(OrderDetailsScreen(answers[index].orderId));
                        },
                        child:   Container(
                          width: getProportionateScreenWidth(345),
                          height: getProportionateScreenHeight(110),
                          margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10),horizontal: getProportionateScreenWidth(22.5)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFFF9F9F9),
                              boxShadow: shadow
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: getProportionateScreenWidth(95),
                                height: getProportionateScreenHeight(110),
                                decoration: BoxDecoration(
                                  borderRadius:appLocal=="ar"?BorderRadius.only(
                                      topRight:  Radius.circular(12),
                                      bottomRight: Radius.circular(12)
                                  ):BorderRadius.only(
                                      topLeft:  Radius.circular(12),
                                      bottomLeft: Radius.circular(12)
                                  ),
                                  color: Colors.white,
                                ),
                                child: ClipRRect( borderRadius: appLocal=="ar"?BorderRadius.only(
                                    topRight:  Radius.circular(12),
                                    bottomRight: Radius.circular(12)
                                ):BorderRadius.only(
                                    topLeft:  Radius.circular(12),
                                    bottomLeft: Radius.circular(12)
                                ),child: Image.network(
                                     answers[index].answeredType=="Store"?
                                  Api.imagePath+    answers[index].answeredStoreImage:
                                  Api.imagePath+   answers[index].answeredImage,fit: BoxFit.fill,)),
                              ),
                              SizedBox(width: getProportionateScreenWidth(10),),
                              Column(
                                children: [
                                  SizedBox(height: getProportionateScreenHeight(6),),
                                  Row(
                                    children: [
                                      Container(width: getProportionateScreenWidth(210),height: getProportionateScreenHeight(20),
                                        child: AutoSizeText(   answers[index].answeredType=="Store"?   answers[index].answeredStoreName:   answers[index].userName,style: body1_16pt,),
                                      ),
                                         Container(
                                          height: getProportionateScreenHeight(30),
                                          width: getProportionateScreenWidth(30),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white
                                          ),
                                          child:GestureDetector(onTap:(){
                                            showDialog(
                                                context: context,
                                                builder: ((context) => AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5)),
                                                  title: Text(
                                                    'هل أنت متأكد ؟'.i18n,
                                                    // textDirection: TextDirection.rtl,
                                                    style: body3_18pt,
                                                  ),
                                                  content: Text(
                                                    'انت على وشك حذف هذا الرد !'.i18n,
                                                    // textDirection: TextDirection.rtl,
                                                    style: body1_16pt,
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      child: Text(
                                                        'نعم'.i18n,
                                                      ),
                                                      onPressed: () async{
                                                        // language.changeLanguage();
                                                        Navigator.of(context).pop();
                                                        await deleteAnswer(   answers[index].id);
                                                        // Navigator.popUntil(context, ModalRoute.withName('/'));
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: Text('لا'.i18n),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    )
                                                  ],
                                                )));
                                          },child: Image.asset("assets/images/vendor_app/trash.png",fit: BoxFit.fill,))
                                      )
                                    ],
                                  ),
                                  SizedBox(height: getProportionateScreenHeight(4),),
                                  Container(width: getProportionateScreenWidth(220),height: getProportionateScreenHeight(36),
                                    child: AutoSizeText(   answers[index].answer.toString(),style: darkGrayText_13pt,),
                                  ),
                                  Container(width: getProportionateScreenWidth(240),height: getProportionateScreenHeight(34),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Spacer(),
                                            SocialMedia(freez: true,),
                                            SizedBox(width: getProportionateScreenWidth(2),),
                                          ],
                                        ),
                                        SizedBox(height: getProportionateScreenHeight(2),)
                                      ],
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ));
    // );

  }
}

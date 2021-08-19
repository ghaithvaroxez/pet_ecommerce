import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/doctor_app/model/doctor.dart';
import 'package:pets_ecommerce/screens/home/view/components/social_media_components.dart';
import 'package:pets_ecommerce/screens/stores/view/components/about/review_card.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/services/http_requests_service.dart';
// import 'package:rating_dialog/rating_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import '../../../model/review_model.dart';
class DoctorPersonalInfoBody extends StatefulWidget {
  Doctor doctor;
  DoctorPersonalInfoBody(this.doctor);

  @override
  _DoctorPersonalInfoBodyState createState() => _DoctorPersonalInfoBodyState();
}

class _DoctorPersonalInfoBodyState extends State<DoctorPersonalInfoBody> {
bool loading=false;
bool error=false;
ReviewModel reviewModel;
  getReviews()async {
    error=false;
    loading=true;
    setState(() {

    });
    consolePrint("befor get ");
    final h=await HttpService().getHeaders();
    try{
      final apiResult = await http.get(
          Api.baseUrl + Api.getDoctorReview + widget.doctor.id.toString(),
          headers: h);
      consolePrint("after get ");
      if (apiResult.statusCode == 200)
        reviewModel = reviewModelFromJson(apiResult.body);
      else
        error = true;
    }catch(e)
    {
      consolePrint(e.toString());
      loading=false;
      setState(() {

      });
      error=true;
    }
    loading=false;
    setState(() {

    });
  }
  addReview(String comment,int rate)
  async {
    loading=true;
    setState(() {

    });
    consolePrint("befor add ");
    final h=await HttpService().getHeaders();
    var m={
      "rate":rate.toString(),
      "comment":comment.toString(),
      "doctor_id":widget.doctor.id.toString(),
    };
    // FormData formData=FormData({
    //
    // });
    var j=jsonEncode(m);
    final apiResult = await http.post(
        Api.baseUrl+Api.addDoctorReview,body: m //+ '/' + widget.id.toString()
        ,headers: h);
    consolePrint("after add ");
    consolePrint(apiResult.statusCode.toString());
    consolePrint(apiResult.body);
    if(apiResult.statusCode==200)
      {

      }
      // doctorModel= doctorModelFromJson(apiResult.body);

    else error=true;

    loading=false;
    setState(() {

    });
  }


 String fb,wa,ins;
 bool bfb=true,bwa=true,bins=true;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i =0; i<widget.doctor.doctorContacts.length;i++)
    {
      if( widget.doctor.doctorContacts[i].type=="facebook"&&bfb==true)
      {
        fb= widget.doctor.doctorContacts[i].link;
        bfb=false;
      }
      else if( widget.doctor.doctorContacts[i].type=="phone"&&bwa==true)
      {
        wa= widget.doctor.doctorContacts[i].link;
        bwa=false;
      }
      else if ( widget.doctor.doctorContacts[i].type=="instagram"&&bins==true)
      {
        ins= widget.doctor.doctorContacts[i].link;
        bins=false;
      }
    }
getReviews();
 }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(24),
            vertical: getProportionateScreenHeight(26)),
        child: ListView(
          children: [
            Row(

              children: [
                Container(
                  height: getProportionateScreenHeight(30),
                  width: getProportionateScreenWidth(150),
                  child: AutoSizeText(
                    widget.doctor.firstName+" "+widget.doctor.lastName,
                    style: body3_25pt,
                  ),
                ),
                Spacer(),
                SocialMedia(fb: fb,ins: ins,wa: wa,freez: false,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/home/clock_icon.png",
                  height: getProportionateScreenHeight(12),
                ),

                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),

                Container(
                  height: getProportionateScreenHeight(20),
                  width: getProportionateScreenWidth(200),
                  child: AutoSizeText(
                    widget.doctor.info,
                    style: darkGrayText_14pt,
                    minFontSize: 10,
                    maxLines: 1,
                    textDirection: TextDirection.rtl,
                  ),
                ),

              ],
            ),
            SizedBox(height: getProportionateScreenHeight(15),),
            Container(
              height: getProportionateScreenHeight(20),
              // width: getProportionateScreenWidth(200),
              alignment: Alignment.centerRight,
              // color: Colors.red,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/images/home/location_icon.png",
                    height: getProportionateScreenHeight(12),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Container(

                    // alignment: Alignment.centerRight,
                    height: getProportionateScreenHeight(20),
                    width: getProportionateScreenWidth(200),
                    child: AutoSizeText(
                    widget.doctor.address,
                      style: darkGrayText_14pt,
                      minFontSize: 10,
                      maxLines: 1,
                      textDirection: TextDirection.rtl,
                    ),
                  ),


                ],
              ),
            ),

            SizedBox(height: getProportionateScreenHeight(15),),
            Container(
              height: getProportionateScreenHeight(30),
              alignment: Alignment.centerRight,
              child: AutoSizeText(
                "مواعيد العمل",
                minFontSize: 14,
                style: body3_18pt,
                maxLines: 1,
              ),
            ),

            ///مواعيد العمل
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),

            for(int i=0;i<widget.doctor.doctorWorkDays.length;i++)
              Row(
                children: [
                  Image.asset(
                    "assets/images/home/clock_icon.png",
                    height: getProportionateScreenHeight(12),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Container(
                    height: getProportionateScreenHeight(20),
                    width: getProportionateScreenWidth(200),
                    child: Row(
                      children: [
                        Container(
                          height: getProportionateScreenHeight(20),
                          // width: getProportionateScreenWidth(120),
                          child: AutoSizeText(
                            "${widget.doctor.doctorWorkDays[i].day} ",textDirection: TextDirection.rtl,
                            style: body3_18pt,
                            minFontSize: 10,
                          ),
                        ),
                        Container(
                          height: getProportionateScreenHeight(20),
                          // width: getProportionateScreenWidth(120),
                          child: AutoSizeText(
                            "${widget.doctor.doctorWorkDays[i].from} ",textDirection: TextDirection.ltr,
                            style: body3_18pt,
                            minFontSize: 10,
                          ),
                        ),
                        Container(
                          height: getProportionateScreenHeight(20),
                          // width: getProportionateScreenWidth(120),
                          child: AutoSizeText(
                            "-",
                            style: body3_18pt,
                            minFontSize: 10,
                          ),
                        ),
                        Container(
                          height: getProportionateScreenHeight(20),
                          // width: getProportionateScreenWidth(120),
                          child: AutoSizeText(
                            "${widget.doctor.doctorWorkDays[i].to} ",textDirection: TextDirection.ltr ,
                            style: body3_18pt,
                            minFontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
    Container(
    margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(105)
    ),
    width: getProportionateScreenWidth(150),
    height: getProportionateScreenHeight(60),
    alignment: Alignment.center,
    // color: Colors.green,
    child: Row(
    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    GestureDetector(onTap: ()async{
    if (await canLaunch('tel:${widget.doctor.mobile}')) {
    await launch('tel:${widget.doctor.mobile}');
    } else {
    Get.rawSnackbar(message: "عذرا فشلت العملية !",);
    }
    },child: Container(width: getProportionateScreenWidth(60),height:getProportionateScreenHeight(60),child: Image.asset("assets/images/store/phone_button_icon.png"))),
    SizedBox(width: getProportionateScreenWidth(12),),
    GestureDetector(
    onTap: ()async{
    if(widget.doctor.email==null)
    {
    Get.rawSnackbar(message: "عذرا المتجر ليس له بريد الكتروني !",);
    return ;
    }
    else {
    if (await canLaunch( 'mailto:${widget.doctor.email}')) {
    await launch( 'mailto:${widget.doctor.email}');
    } else {
    Get.rawSnackbar(message: "عذرا فشلت العملية !",);
    }
    }
    },

    child: Container(width: getProportionateScreenWidth(60),height:getProportionateScreenHeight(60),child: Image.asset("assets/images/store/email_buttom_icon.png"))),
    ],
    ),
    ),
            // SizedBox(
            //   height: getProportionateScreenHeight(15),
            // ),
            // Row(
            //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(height:getProportionateScreenHeight(30), child: AutoSizeText("احدث التقييمات",style:body3_18pt,minFontSize: 12,maxLines: 1,)),
            //    Spacer(),
            //     Container(height:getProportionateScreenHeight(15),child: AutoSizeText("عرض المزيد ",style: body2_14pt,minFontSize: 8,)),
            //   ],
            // ),
            // SizedBox(height: getProportionateScreenHeight(10),),
//             GestureDetector(onTap:()async{
// //               final ratingDialog= RatingDialog(
// //                 // your app's name?
// //                 title: widget.doctor.firstName+" "+widget.doctor.lastName,
// // ratingColor: Colors.blue.withOpacity(0.8),
// //                 // encourage your user to leave a high rating?
// //                 message:
// //                 'ماهو تقيمك لهذا الطبيب  ؟',
// //                 commentHint: 'اخبرنا برئيك عن هذا الطبيب',
// //                 // your app's logo?
// //                 // image: Container(
// //                 //   color: ,
// //                 // ),
// //                 submitButton: 'متابعة',
// //                 onCancelled: () => Get.back(),
// //                 onSubmitted: (response) async{
// //                   print('rating: ${response.rating}, comment: ${response.comment}');
// //                   await addReview(response.comment, response.rating);
// //                 },
// //               );
//
//               // showDialog(context: context, builder: (context)=>ratingDialog);
//             },
//                 child: Container(width: getProportionateScreenWidth(300),height: getProportionateScreenHeight(50),color: Colors.redAccent,)),
//
//            error?Container(
//              height: getProportionateScreenHeight(200),
//              width: getProportionateScreenWidth(300),
//              child: AutoSizeText(
//                "عذرا حدثت مشكلة بجلب التقيمات الرجاء المحاولة مجدداً",
//                style: body1_16pt,
//              ),
//            ):loading?Container(height: getProportionateScreenHeight(200),
//            width: getProportionateScreenWidth(300),
//            child: Container(
//              alignment: Alignment.center,
//              child: CircularProgressIndicator(),
//
//            ),
//            ):
//             Column(
//               children: [
//                ...List<Widget>.generate(reviewModel.rates.length,(index)=>ReviewCad(reviewModel.rates[index].userComment, reviewModel.rates[index].userName, reviewModel.rates[index].userRate,reviewModel.rates[index].userImage))
//               ],
//             ),

            SizedBox(height: getProportionateScreenHeight(25),),
            Container(width: getProportionateScreenWidth(370),height: getProportionateScreenHeight(152),child: Image.asset("assets/images/store/map.png",fit: BoxFit.fill,),)
          ],
        ),
      ),
    );;
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:get/get.dart';
import 'package:pets/screens/orders/model/all_orders_model.dart';

import '../my_order_details.dart';

class MyVerticalOrderListCard extends StatelessWidget {
  Order order;
  Function delete;

  MyVerticalOrderListCard(this.order,this.delete);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: (){
          Get.to(MyOrderDetailsScreen(order.id));
        },
        child: Container(

          alignment: Alignment.center,
          width: getProportionateScreenWidth(345),
          height: getProportionateScreenHeight(134),
          margin: EdgeInsets.only(bottom: getProportionateScreenHeight(8),top: getProportionateScreenHeight(8),left: getProportionateScreenWidth(22.5), right: getProportionateScreenWidth(22.5)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: getProportionateScreenWidth(105),
                height: getProportionateScreenHeight(134),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: offBlue,
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    child: Image.network(
                      
                      Api.imagePath+order.image,
                      height:getProportionateScreenHeight(134) ,
                      width: getProportionateScreenWidth(105),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(16)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: getProportionateScreenHeight(30),
                          width: getProportionateScreenWidth(192),
                          child: Container(
                            height: getProportionateScreenHeight(30),
                            width: getProportionateScreenWidth(192),
                            margin: EdgeInsets.only(right: getProportionateScreenWidth(12)),
                            child: AutoSizeText(
                              order.title,
                              textDirection: TextDirection.rtl,
                              minFontSize: 8,
                              style: body1_16pt,
                            ),
                          ),
                        ),
                        // Spacer(),
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
                                      'هل أنت متأكد ؟',
                                      textDirection: TextDirection.rtl,
                                      style: body3_18pt,
                                    ),
                                    content: Text(
                                      'انت على وشك حذف هذا الطلب !',
                                      textDirection: TextDirection.rtl,
                                      style: body1_16pt,
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text(
                                          'نعم',
                                        ),
                                        onPressed: () async{
                                          // language.changeLanguage();
                                          Navigator.of(context).pop();
                                          await delete();
                                          // Navigator.popUntil(context, ModalRoute.withName('/'));
                                        },
                                      ),
                                      TextButton(
                                        child: Text('لا'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  )));
                            },child: Image.asset("assets/images/vendor_app/trash.png",fit: BoxFit.fill,))
                        ),
                        SizedBox(width: getProportionateScreenWidth(8),),
                      ],
                    ),
                    // SizedBox(height: getProportionateScreenHeight(2),),
                    Container(
                      height: getProportionateScreenHeight(12),
                      width: getProportionateScreenWidth(200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: getProportionateScreenWidth(80),
                            height: getProportionateScreenHeight(12),
                            child:
                            Row(
                              children: [

                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: getProportionateScreenHeight(12),
                                      child: Image.asset(
                                          "assets/images/store/cat_icon.png"),
                                    )),
                                SizedBox(width: getProportionateScreenWidth(5),),
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: getProportionateScreenHeight(12),
                                      child: AutoSizeText(
                                        order.categoryName,
                                        style: darkGrayText_11pt,
                                        minFontSize: 5,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            width: getProportionateScreenWidth(80),
                            height: getProportionateScreenHeight(12),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: getProportionateScreenHeight(12),
                                      child: Image.asset(
                                          "assets/images/home/clock_icon.png"),
                                    )),
                                SizedBox(width: getProportionateScreenWidth(5),),
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: getProportionateScreenHeight(12),
                                      child: AutoSizeText(order.date.toString(),
                                          style: darkGrayText_11pt,
                                          minFontSize: 5,
                                          textDirection: TextDirection.rtl),
                                    )),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Container(
                      height: getProportionateScreenHeight(50),
                      width: getProportionateScreenWidth(200),
                      child: AutoSizeText(
                          order.question,
                          minFontSize: 8,
                          style: darkGrayText_13pt,
                          textDirection: TextDirection.rtl),
                    ),
                  ],
                ),
              ),

              ///blue container
            ],
          ),
        ),
      ),
    );
  }
}

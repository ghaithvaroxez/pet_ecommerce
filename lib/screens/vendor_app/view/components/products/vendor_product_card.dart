import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/api.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/constants.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/product.dart';
import 'package:get/get.dart';

class VendorProductCard extends StatelessWidget {
  StoreProduct product;
  Function delete;
  Function edit;
  Function changeStatus;

  VendorProductCard(
      {@required this.product, @required this.delete, @required this.edit, @required this.changeStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: getProportionateScreenWidth(16),right:getProportionateScreenWidth(16),bottom: getProportionateScreenHeight(16)),
      width: getProportionateScreenWidth(353),
      height: getProportionateScreenHeight(140),
      margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(8)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.3, color: Colors.grey),
          color: backgroundGrey,
          boxShadow: shadow),
      child: Row(
          children: [
          Container(
          width: getProportionateScreenWidth(140),
      height: getProportionateScreenHeight(140),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        child: Stack(
          children: [
            Container(color: Colors.white,
                child: Image.asset("assets/images/home/custom_background.png",
                  fit: BoxFit.fill,)),
            Container(child: CachedNetworkImage(
              width: getProportionateScreenWidth(140),
              height: getProportionateScreenHeight(140),
              imageUrl: Api.imagePath + product.image, fit: BoxFit.fill,
            ),
            ),
          ],
        ),

      ),
    ),
    // SizedBox(width: getProportionateScreenWidth(8),),
    Expanded(
    flex: 4,
    child: Container(

    child: Column(
    children: [
    SizedBox(height: getProportionateScreenHeight(20),),
    Container(
    // margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
    height: getProportionateScreenHeight(20),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Container(width:getProportionateScreenWidth(125),alignment:Alignment.centerRight,height: getProportionateScreenHeight(20),child: AutoSizeText(product.name,style: body1_16pt,),),
    Container(width:getProportionateScreenWidth(80),alignment:Alignment.centerLeft,padding:EdgeInsets.only(left: getProportionateScreenWidth(3)),height: getProportionateScreenHeight(20),child: AutoSizeText("\$"+product.price,style: body2_14pt,maxLines: 1,minFontSize: 8,),),
    ],
    ),
    ),
    SizedBox(height: getProportionateScreenHeight(10),),
    Container(
    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [
    Container(
    alignment: Alignment.centerRight,
    width: getProportionateScreenHeight(136),height:getProportionateScreenHeight(20),child: AutoSizeText(product.categoryName,style: body1_16pt,),),
    Spacer(),
    Container(
    height: getProportionateScreenHeight(20),
    child:Row(
    children: [
    Image.asset("assets/images/home/clock_icon.png"),
    SizedBox(width: getProportionateScreenWidth(5),),
    AutoSizeText(product.date+" ",style: darkGrayText_11pt,),
    ],
    )),
    ]
    ),
    ),
    SizedBox(height: getProportionateScreenHeight(10),),
    Container(padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),alignment: Alignment.centerRight,height: getProportionateScreenHeight(20),child: AutoSizeText(product.body,style: darkGrayText_11pt,),),
    Row(
    children: [
    Spacer(
    ),
    Container(

    width: getProportionateScreenWidth(160),
    height: getProportionateScreenHeight(39),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomLeft: Radius.circular(12) ),
    color: Colors.white,
    ),
    child: Row(
    children: [

    Expanded(child: Container(
      decoration: BoxDecoration(      color: product.visible!="visible"?Colors.black.withOpacity(0.4):Colors.transparent,
        borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomLeft: Radius.circular(12) ),),
      child: GestureDetector(onTap:(){if(product.visible=="visible")
      changeStatus();
      else
        {Get.rawSnackbar(
      backgroundColor: Colors.green
          .withOpacity(0.8),
      message:
      "product already un uploaded");
      }}
      ,child: Padding( padding: const EdgeInsets.all(7.0),child: Image.asset("assets/images/vendor_app/unupload_icon.png"),)),
    )),


    Expanded(child: Container(
      decoration: BoxDecoration(      color: product.visible=="visible"?Colors.black.withOpacity(0.4):Colors.transparent,
        borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomLeft: Radius.circular(12) ),),
      child: GestureDetector(onTap:(){if(product.visible=="visible"){Get.rawSnackbar(
          backgroundColor: Colors.green
              .withOpacity(0.8),
          message:
          "product already  uploaded");
      }else changeStatus();},
          child: Padding( padding: const EdgeInsets.all(7.0),child:Image.asset("assets/images/vendor_app/upload_icon.png"))),
    )),
    Expanded(child: GestureDetector( onTap:edit,child: Image.asset("assets/images/vendor_app/pen.png"))),
    Expanded(child: GestureDetector(onTap:(){
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
    'انت على وشك حذف هذا المنتج !',
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
    },child: Image.asset("assets/images/vendor_app/trash.png"))),
    ],
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    )
    ,

    ]
    ,
    )

    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/api.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/main.dart';
import 'package:pets/screens/notifications/model/notifications_model.dart' as n;
import 'package:get/get.dart';
import 'package:pets/screens/orders/views/order_details_screen.dart';
import 'package:pets/screens/stores/view/components/offers/offer_details_screen_by_id.dart';
import 'package:pets/screens/stores/view/store_details_id.dart';

class NotificationCard extends StatefulWidget {
  n.Notification notification;

  NotificationCard(this.notification);

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.notification.type == "New Order Notification") {
          Get.to(OrderDetailsScreen(widget.notification.itemId));
        } else if (widget.notification.type == "New Offer Notification") {
          Get.to(OfferDetailsPageById(widget.notification.itemId));
        } else if (widget.notification.type == "New Store Notification"||widget.notification.type == "New Sieve Notification"||widget.notification.type == "New Barn Notification") {
          Get.to(StoreDetailsById(widget.notification.itemId));
        }
      },
      child: Container(
        height: getProportionateScreenHeight(95),
        width: getProportionateScreenWidth(390),
        margin: EdgeInsets.symmetric(
            // horizontal: getProportionateScreenWidth(22.5),
            vertical: getProportionateScreenHeight(5)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundGrey,
        ),
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(8),
            vertical: getProportionateScreenHeight(10)),
        child: Row(
          children: [
            // Container(
            //   width: getProportionateScreenWidth(55),
            //   height: getProportionateScreenHeight(55),
            //   decoration: BoxDecoration(shape: BoxShape.circle,
            //   image: DecorationImage(image: NetworkImage(Api.imagePath+widget.notification.image))),
            //
            // ),
            CircleAvatar(backgroundColor: grey,backgroundImage:widget.notification.image==""?AssetImage("assets/images/splash_screen/white_logo.png"):  NetworkImage(Api.imagePath+widget.notification.image),radius: getProportionateScreenWidth(25),),
            SizedBox(width: getProportionateScreenWidth(10),),
            Column(
              children: [
                Container(width: getProportionateScreenWidth(260),height: getProportionateScreenHeight(20),child: AutoSizeText(widget.notification.title,style: darkGrayText_14pt,maxLines: 1,textDirection: appLocal=="en"?TextDirection.ltr:TextDirection.rtl,),),

                Container(width: getProportionateScreenWidth(260),height: getProportionateScreenHeight(35),child: AutoSizeText(widget.notification.body,style: darkGrayText_14pt,maxLines: 1,textDirection: appLocal=="en"?TextDirection.ltr:TextDirection.rtl,),),
                Container(height: getProportionateScreenHeight(20),width: getProportionateScreenWidth(260),alignment:appLocal=="ar"?Alignment.centerRight:Alignment.centerLeft,child:  AutoSizeText(widget.notification.createdAt,style: darkGrayText_14pt,maxLines: 1,textDirection: appLocal=="en"?TextDirection.ltr:TextDirection.rtl,),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

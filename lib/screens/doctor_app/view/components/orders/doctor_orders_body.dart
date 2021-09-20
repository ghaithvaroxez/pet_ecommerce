import 'package:flutter/material.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/vendor_app/view/components/orders/vendor_orders_card.dart';
import '../orders/doctor_order_card.dart';

class DoctorOrdersBodyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(24),
          vertical: getProportionateScreenHeight(26)),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => DoctorAppOrderCard(),
      ),
    );
  }
}

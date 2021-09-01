import 'package:flutter/material.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/doctors/view/components/orders_response/doctor_orders_card.dart';

class DoctorOrdersResponseBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(24),
          vertical: getProportionateScreenHeight(26)),
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) =>  DoctorOrderCard(),
      ),
    );
  }
}

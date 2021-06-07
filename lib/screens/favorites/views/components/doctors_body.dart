import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/home/view/components/doctor_card.dart';
import 'package:pets_ecommerce/screens/stores/view/components/products/store_product_card.dart';

class FavoriteDoctorsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(16)),
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => Column(
          children: [
            Row(
              children: [
                DoctorCard(),
                SizedBox(width: getProportionateScreenWidth(15),),
                DoctorCard(),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(16),),
          ],
        ),
      ),
    );
  }
}

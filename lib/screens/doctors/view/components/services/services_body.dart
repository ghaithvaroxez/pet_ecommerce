import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/doctor_app/model/doctor.dart';
import 'package:pets_ecommerce/screens/doctors/view/components/services/services_card.dart';
import 'package:pets_ecommerce/screens/stores/view/components/products/store_product_card.dart';


class DoctorServicesBody extends StatelessWidget {
  List<DoctorService> doctorServices;
  DoctorServicesBody(this.doctorServices);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(24),
          vertical: getProportionateScreenHeight(26)),
      child:
      SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ...List<Widget>.generate(
                  doctorServices.length,
                      (index)=>index%2==0?Container(
                    margin: EdgeInsets.symmetric(vertical: 10),

                    child:  DoctorServicesCard(doctorServices[index]),
                  ):Container(height: 0,),

                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                ...List<Widget>.generate(
                  doctorServices.length,
                      (index)=>index%2==1?Container(
                    margin: EdgeInsets.symmetric(vertical: 10),

                    child:  DoctorServicesCard(doctorServices[index]),
                  ):Container(height: 0,),

                ),
              ],
            ),
          ],
        ),
      ),


      // ListView.builder(
      //   itemCount: doctorServices.length,
      //   itemBuilder: (context, index) => Column(
      //     children: [
      //       Row(
      //         children: [
      //           DoctorServicesCard(),
      //           SizedBox(width: getProportionateScreenWidth(15),),
      //           DoctorServicesCard(),
      //         ],
      //       ),
      //       SizedBox(height: getProportionateScreenHeight(16),),
      //     ],
      //   ),
      // ),
    );
  }
}

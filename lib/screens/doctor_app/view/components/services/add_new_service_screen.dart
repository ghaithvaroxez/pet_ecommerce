


import 'package:auto_size_text/auto_size_text.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/gradient.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/models/product.dart';
import 'package:pets_ecommerce/screens/doctor_app/model/constants.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/constants.dart';
import 'package:pets_ecommerce/screens/widgets/text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_ecommerce/screens/doctor_app/model/service.dart';
class DoctorAppAddNewService extends StatefulWidget {
  @override
  _DoctorAppAddNewServiceState createState() => _DoctorAppAddNewServiceState();
}

class _DoctorAppAddNewServiceState extends State<DoctorAppAddNewService> {

  List<String> vendor_category_items = [
    "قطط",
    "كلاب",
    "احصنة",
    "هامستر",
  ];
  var image ;

  TextEditingController descriptionController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  String category = "قطط";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: getProportionateScreenHeight(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: getProportionateScreenWidth(180),
                    height: getProportionateScreenHeight(30),
                    child: AutoSizeText(
                      "اضف خدمة جديد",
                      style: h5_21pt,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        descriptionController.text="";
                        priceController.text="";
                        nameController.text="";
                      },
                      child: Container(
                        width: getProportionateScreenWidth(100),
                        height: getProportionateScreenHeight(60),
                        child: AutoSizeText(
                          "إعادة ضبط",
                          style: body2_14pt_underlined,
                          maxLines: 1,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),
            Container(
              height: getProportionateScreenHeight(30),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        height: getProportionateScreenHeight(30),
                        alignment: Alignment.bottomRight,
                        child: AutoSizeText(
                          "الصنف",
                          style: body3_18pt,
                        ),
                      )),
                  Expanded(
                      child: Container(
                        height: getProportionateScreenHeight(30),
                        alignment: Alignment.bottomRight,
                        child: AutoSizeText(
                          "السعر",
                          style: body3_18pt,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Container(
              height: getProportionateScreenHeight(60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                        width: getProportionateScreenWidth(156),
                        height: getProportionateScreenHeight(45),
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              width: 1, color: Colors.grey.withOpacity(0.6)),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            // value: type,
                            items: vendor_category_items.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                category = value;
                              });
                            },
                            hint: Text(category),
                            elevation: 8,
                            style: blackText_14pt,
                            icon: Icon(Icons.arrow_drop_down),
                            iconDisabledColor: Colors.black,
                            iconEnabledColor: Colors.blue.withOpacity(0.6),
                            // isExpanded: true,
                          ),
                        )),
                  ),
                  Container(
                    height: getProportionateScreenHeight(65),
width: getProportionateScreenWidth(156),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.6), width: 1)),
                    child: CustomTextField(
                      textEditingController: priceController,
                      suffixImage: "assets/images/vendor_app/pen.png",
                      textInputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),
            Container(
              height: getProportionateScreenHeight(30),
              alignment: Alignment.centerRight,
              child: AutoSizeText(
                "اسم الخدمة",
                style: body3_18pt,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Container(
              height: getProportionateScreenHeight(65),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.6), width: 1)),
              child:
              CustomTextField(textEditingController: nameController),
            ),
            SizedBox(height: getProportionateScreenHeight(25),),
            Container(
              height: getProportionateScreenHeight(30),
              child: Container(
                alignment: Alignment.centerRight,
                height: getProportionateScreenHeight(30),
                // width: getProportionateScreenWidth(150),
                child: AutoSizeText(
                  "صورة المنتج",
                  style: body3_18pt,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Container(
              height: getProportionateScreenHeight(100),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.6), width: 1)),
              child: image==null?GestureDetector(
                onTap: ()async {
                  image = await ImagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {

                  });
                },
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/vendor_app/upload_photo.png",
                        height: getProportionateScreenHeight(75),
                        width: getProportionateScreenWidth(125),
                      ),
                    ),
                    Center(
                        child: Container(
                          height: getProportionateScreenHeight(20),
                          width: getProportionateScreenWidth(80),
                          child: AutoSizeText(
                            "حمل الصورة",
                            style: body1_16pt,
                            maxLines: 1,
                          ),
                        ))
                  ],
                ),
              ):GestureDetector(
                  onTap: ()async {
                    image = await ImagePicker.pickImage(source: ImageSource.gallery);
                    setState(() {

                    });
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),child: Image.file(image,fit: BoxFit.cover,))),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Container(
              height: getProportionateScreenHeight(30),
              alignment: Alignment.centerRight,
              child: AutoSizeText(
                "وصف الخدمة",
                style: body3_18pt,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Container(
              // height: getProportionateScreenHeight(65),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.6), width: 1)),
              child:
              CustomTextField(textEditingController: descriptionController,),
            ),
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),
            Container(
              height: getProportionateScreenHeight(60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if(nameController.text==""||priceController.text==""||descriptionController.text=="")
                        {
                          CoolAlert.show(context: context, type: CoolAlertType.error,text: "الرجاء ملئ كافة الحقول قبل اضافة المنتج",title: "فشلت العملية");
                          return;
                        }
                        if(image==null)
                        {
                          CoolAlert.show(context: context, type: CoolAlertType.error,text: "الرجاء اضافة صورة للمنتج",title: "فشلت العملية",);
                          return;
                        }
                        customDoctorServicesController.addNewService(Service(name: nameController.text,desc: descriptionController.text,price: priceController.text,img: image,));
                        doctorAppTabController.animateTo(0);
                        customDoctorLabelController.changeIndex(0);
                        customDoctorServicesController.changeToViewServices();
                      },
                      child: Container(
                        width: getProportionateScreenWidth(170),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: blueGradient),
                        child: Center(
                          child: AutoSizeText(
                            "إضافة ",
                            style: blueButton_14pt,
                          ),
                        ),
                      )),
                  GestureDetector(
                      onTap: (){
                        doctorAppTabController.animateTo(0);
                        customDoctorLabelController.changeIndex(0);
                        customDoctorServicesController.changeToViewServices();
                      },
                      child: Container(
                        width: getProportionateScreenWidth(170),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border:
                            Border.all(color: Color(0xFF49C3EA), width: 0.8)),
                        child: Center(
                          child: AutoSizeText(
                            "العودة",
                            style: body2_14pt,
                          ),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

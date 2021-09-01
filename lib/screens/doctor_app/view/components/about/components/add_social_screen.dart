import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/colors.dart';
import 'package:pets_ecommerce/configuration/constants/gradient.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:get/get.dart';
import 'package:pets_ecommerce/screens/widgets/text_field.dart';

List<String> types=[
  "فيسبوك",
  "انستغرام",
  "رقم هاتف"
];
List<String> ReqTypes=[
  "facebook",
  "instagram",
  "phone"
];


class AddSocialScreen extends StatefulWidget {
  Function addAction;
  TextEditingController link;
  TextEditingController type;
  @override
  _AddSocialScreenState createState() => _AddSocialScreenState();

  AddSocialScreen({ this.addAction, this.link,this.type});
}

class _AddSocialScreenState extends State<AddSocialScreen>
{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<3;i++)
      if(widget.type.text==ReqTypes[i])
        widget.type.text=types[i];

        widget.type.text=types[0];

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(



          child: SingleChildScrollView(
            child:  Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Container(
                    child: Material(
                      elevation: 5,
                      color: Colors.white,
                      child: Container(
                          width: SizeConfig.screenWidth,
                          height: getProportionateScreenHeight(95),
                          child: Row(
                            children: [
                              SizedBox(
                                width: getProportionateScreenWidth(24),
                              ),

                              Spacer(),
                              Container(height:getProportionateScreenHeight(28),child: AutoSizeText("اضافة معلومات التواصل الاجتماعي",style: h5_21pt,minFontSize: 8,)),
                              Spacer(),
                              SizedBox(
                                width: getProportionateScreenWidth(24),
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(40),),
                  Container(padding:EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),alignment:Alignment.centerRight,child: AutoSizeText("النوع",style: body1_16pt,textDirection: TextDirection.rtl,)),
                  SizedBox(height: getProportionateScreenHeight(16),),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                          width: getProportionateScreenWidth(156),
                          padding: EdgeInsets.only(right: getProportionateScreenWidth(4)),

                          height:
                          getProportionateScreenHeight(45),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(6),
                            border: Border.all(
                                width: 1,
                                color:
                                Colors.grey.withOpacity(0.6)),
                          ),
                          // padding: EdgeInsets.symmetric(
                          //     horizontal: 15),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              // value: controller.storeInfo.address,
                              // value: _value,
                              items: types
                                  .map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Container(
                                    width: getProportionateScreenWidth(100),
                                    height:
                                    getProportionateScreenHeight(45),
                                    child: AutoSizeText(
                                      item,
                                      textDirection:
                                      TextDirection.rtl,
                                      style: blackText_14pt,
                                      minFontSize: 9,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) async{
widget.type.text=value;
setState(() {

});
                              },
                              hint: Text(widget.type.text),
                              elevation: 8,
                              style: blackText_14pt,
                              icon: Container(width:getProportionateScreenWidth(8),child: RotatedBox(quarterTurns:90,child: Icon(Icons.arrow_drop_down))),
                              iconDisabledColor: Colors.black,
                              iconEnabledColor: Colors.blue,
                              // isExpanded: true,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(40),),
                  Container(height:SizeConfig.screenHeight/3,width:SizeConfig.screenWidth,child: Column(children: [
                    Container(padding:EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),alignment:Alignment.centerRight,child: AutoSizeText("الرابط",style: body1_16pt,textDirection: TextDirection.rtl,)),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child:Container(alignment:Alignment.centerLeft,decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 1,color: borderColor)),child: CustomTextField(textEditingController: widget.link,textInputType: TextInputType.text,)),
                    ),

                    Spacer(),
                    GestureDetector(
                        onTap: ()async {
                          if(widget.link.text=="") {
                            Get.rawSnackbar(
                                message: "you don't enter any link",duration: Duration(seconds: 4));
                            // Get.back();
                          } else {
                            Get.back();
                            for(int i=0;i<3;i++)
                              if(widget.type.text==types[i])
                                widget.type.text=ReqTypes[i];
                            await widget.addAction();
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
                          // width: getProportionateScreenWidth(170),
                          height: getProportionateScreenHeight(56),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: blueGradient),
                          child: Center(
                            child: AutoSizeText(
                              "حفظ ومتابعة ",
                              style: blueButton_14pt,
                            ),
                          ),
                        )),
                  ],),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

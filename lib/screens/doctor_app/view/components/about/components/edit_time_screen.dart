import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/gradient.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/main_screen/model/main_screen_model.dart';
import 'package:pets/screens/widgets/text_field.dart';
import 'package:get/get.dart';
class EditTime extends StatefulWidget {
  Function action;
  TextEditingController t1;
  TextEditingController t2;
  @override
  _EditTimeState createState() => _EditTimeState();

  EditTime({this.action, this.t1, this.t2});

}

class _EditTimeState extends State<EditTime> {
  String _openTime;
  String _closeTime;

  Future<void> _show(bool t,BuildContext context) async {
    final TimeOfDay result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        // builder: (context, child) {
        //   return MediaQuery(
        //       data: MediaQuery.of(context).copyWith(
        //         // Using 12-Hour format
        //           alwaysUse24HourFormat: true),
        //       // If you want 24-Hour format, just change alwaysUse24HourFormat to true
        //      child: Container(),);
        // }
        );
    if (result != null) {
      setState(() {
        t?
        widget.t1.text = result.format(context):widget.t2.text = result.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
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
                  Container(height:getProportionateScreenHeight(28),child: AutoSizeText("تعديل مواعيد العمل",style: h5_21pt,minFontSize: 8,)),
                  Spacer(),
                  SizedBox(
                    width: getProportionateScreenWidth(24),
                  ),
                ],
              )),
        ),
      ),
            SizedBox(height: getProportionateScreenHeight(40),),
            Row(
              children: [
                SizedBox(width: getProportionateScreenWidth(16),),
                GestureDetector(
                  onTap: (){_show(true,context);},
                  child: Container(
                    // width: getProportionateScreenWidth(170),
                    height: getProportionateScreenHeight(56),
                    width: getProportionateScreenWidth(100),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: borderColor,width: 1)
                    ),
                    child: Center(
                      child: AutoSizeText(
                        widget.t1.text,
                        style: whiteButton_14pt,
                      ),
                    ),
                  ),
                ),
              Spacer(),
                Container(padding:EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),alignment:Alignment.centerRight,child: AutoSizeText("يفتح عند الساعة ",style: body1_16pt,textDirection: TextDirection.rtl,)),
                SizedBox(width: getProportionateScreenWidth(16),),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child:Container(alignment:Alignment.centerLeft,decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 1,color: borderColor)),child: CustomTextField(textEditingController: widget.t1,textInputType: TextInputType.number,)),
            // ),
            SizedBox(height: getProportionateScreenHeight(10),),
            Row(
              children: [
                SizedBox(width: getProportionateScreenWidth(16),),
                GestureDetector(
                  onTap: (){_show(false,context);},
                  child: Container(
                    // width: getProportionateScreenWidth(170),
                    height: getProportionateScreenHeight(56),
                    width: getProportionateScreenWidth(100),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: borderColor,width: 1)
                    ),
                    child: Center(
                      child: AutoSizeText(
                        widget.t2.text,
                        style: whiteButton_14pt,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(padding:EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),alignment:Alignment.centerRight,child: AutoSizeText("يغلق عند الساعة ",style: body1_16pt,textDirection: TextDirection.rtl,)),

                SizedBox(width: getProportionateScreenWidth(16),),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 1,color: borderColor)),child: CustomTextField(textEditingController: widget.t2,textInputType: TextInputType.number,color: true,)),
            // ),
Spacer(),
            GestureDetector(
                onTap: ()async {
                  if(widget.t1.text=="" || widget.t2.text=="")
                   Get.rawSnackbar(message: "please fill the fields") ;
                  else {
                    Get.back();
                    await widget.action();

                  }
                },
                child: Container(
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
         SizedBox(height: getProportionateScreenHeight(40),)

          ],
        ),
      ),
    );
  }
}



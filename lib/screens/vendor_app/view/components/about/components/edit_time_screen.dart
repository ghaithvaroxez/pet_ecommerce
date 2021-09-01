import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/constants/gradient.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';
import 'package:pets/screens/main_screen/model/main_screen_model.dart';
import 'package:pets/screens/vendor_app/controller/info_controller.dart';
import 'package:pets/screens/vendor_app/model/all_days.dart';
import 'package:pets/screens/vendor_app/model/store.dart';
import 'package:pets/screens/widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pets/services/http_requests_service.dart';
class EditTimeScreen extends StatefulWidget {
  // Function action;
  TextEditingController t1;
  TextEditingController t2;
  TextEditingController v;
  Function editAction;
  Function deleteAction;
  // VendorInfoController controller;
  // List<StoreWorksDay> storeWorksDay;
  @override
  _EditTimeScreenState createState() => _EditTimeScreenState();

  EditTimeScreen({
    // this.action,
    this.t1,this.t2,
    this.deleteAction,
    this.editAction,
    // this.controller,
    this.v
    // this.storeWorksDay
  });

}

class _EditTimeScreenState extends State<EditTimeScreen> {
  String _openTime;
  String _closeTime;
  bool loading =false;
  bool failed=false;
  bool failed2=false;
  // AllDays allDays;
  List<Day> toRemoveIDs=[];
  // fetchData()async
  // {
  //   loading=true;
  //   setState(() {
  //
  //   });
  //   try {
  //     var url = Uri.parse("${Api.baseUrl}/days");
  //     consolePrint("before print");
  //     final h = await HttpService().getHeaders();
  //     final apiResult = await http.get(url, headers: h);
  //     consolePrint("after print");
  //
  //     if (apiResult.statusCode == 200) {
  //       allDays = allDaysFromJson(apiResult.body);
  //       for (int i = 0; i < widget.storeWorksDay.length; i++) {
  //         for (int j = 0; j < allDays.days.length; j++) {
  //           if (allDays.days[j].id == widget.storeWorksDay[i].dayId) {
  //             toRemoveIDs.add(allDays.days[j]);
  //           }
  //         }
  //       }
  //       for (int i = 0; i < toRemoveIDs.length; i++) {
  //         allDays.days.remove(toRemoveIDs[i]);
  //       }
  //       if (allDays.days.length == 0)
  //         failed2 = true;
  //       else {
  //         dayId = allDays.days[0].id;
  //         dayName = allDays.days[0].day;
  //       }
  //     } else {
  //       failed = true;
  //     }
  //     loading = false;
  //     setState(() {});
  //   }catch(e){
  //     loading = false;
  //     failed=true;
  //     setState(() {});
  //   }
  // }

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
// Map<int,String> getDay={
//     1:"الجمعة",
//   2:"السبت",
//   3:"الأحد",
//   4:"الاثنين",
//   5:"الثلاثاء",
//   6:"الأربعاء",
//   7:"الخميس",
// };
//   Map<String,int> getId={
//     "الجمعة":1,
//  "السبت" :2,
//   "الأحد":3,
//   "الاثنين":4,
//   "الثلاثاء":5,
//   "الأربعاء":6,
//   "الخميس":7,
// };
//   List<String> days=[
//     "الجمعة",
//     "السبت" ,
//     "الأحد",
//     "الاثنين",
//     "الثلاثاء",
//     "الأربعاء",
//     "الخميس",
//   ];
  int dayId;
  String dayName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // for(int i=0;i<widget.storeWorksDay.length;i++)
    //   {
    //     days.remove(widget.storeWorksDay[i].day);
    //   }
    // fetchData();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: failed?Container(width:getProportionateScreenWidth(410),height:getProportionateScreenHeight(200),child: AutoSizeText("عذراً حدثت مشكلة ما الرجاء المحاولة مرة اخرى ",style: body3_18pt,),):loading?LoadingScreen():Column(
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
                        Container(height:getProportionateScreenHeight(28),child: AutoSizeText("اضافة مواعيد العمل",style: h5_21pt,minFontSize: 8,)),
                        Spacer(),
                        SizedBox(
                          width: getProportionateScreenWidth(24),
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(40),),
            // Container(
            //   alignment: Alignment.centerRight,
            //   child: Container(
            //       width:
            //       getProportionateScreenWidth(156),
            //       height:
            //       getProportionateScreenHeight(45),
            //       alignment: Alignment.centerRight,
            //       decoration: BoxDecoration(
            //         borderRadius:
            //         BorderRadius.circular(6),
            //         border: Border.all(
            //             width: 1,
            //             color: Colors.grey
            //                 .withOpacity(0.6)),
            //       ),
            //       padding: EdgeInsets.symmetric(
            //           horizontal: 15),
            //       child: DropdownButtonHideUnderline(
            //         child: DropdownButton<Day>(
            //           // value: type,
            //           items:
            //           allDays.days.map((Day item) {
            //             return DropdownMenuItem<Day>(
            //               value: item,
            //               child: AutoSizeText(item.day),
            //             );
            //           }).toList(),
            //           onChanged: ( item) {
            //             setState(() {
            //               dayName = item.day;
            //               dayId=item.id;
            //             });
            //           },
            //           hint: Text(dayName),
            //           elevation: 8,
            //           style: blackText_14pt,
            //           icon: Icon(Icons.arrow_drop_down),
            //           iconDisabledColor: Colors.black,
            //           iconEnabledColor:
            //           Colors.blue.withOpacity(0.6),
            //           // isExpanded: true,
            //         ),
            //       )),
            // ),
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
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                      onTap: ()async {
                        if(widget.t1.text=="" || widget.t2.text=="")
                          Get.rawSnackbar(message: "please fill the fields") ;
                        else {
                          Get.back();
                          await widget.deleteAction();
                          // await widget.controller.addTime(
                          //     dayId, widget.t1.text, widget.t2.text, false
                          // );

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
                            "حذف",
                            style: blueButton_14pt,
                          ),
                        ),
                      )),
                ),
                SizedBox(width: getProportionateScreenWidth(10),),
                Expanded(
                  child: GestureDetector(
                      onTap: ()async {
                        if(widget.t1.text=="" || widget.t2.text=="")
                          Get.rawSnackbar(message: "please fill the fields") ;
                        else {
                          Get.back();
                          await widget.editAction();

                          // await widget.controller.ed(
                          //     dayId, widget.t1.text, widget.t2.text, false
                          // );

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
                            "تعديل",
                            style: blueButton_14pt,
                          ),
                        ),
                      )),
                ),

              ],
            ),
            SizedBox(height: getProportionateScreenHeight(40),)

          ],
        ),
      ),
    );
  }
}



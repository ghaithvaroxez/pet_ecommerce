import 'package:auto_size_text/auto_size_text.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/printer.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/auth/controller/register_controller.dart';
import 'package:pets_ecommerce/screens/auth/controller/requests/auth_requests.dart';
import 'package:pets_ecommerce/screens/auth/controller/services/auth_services.dart';
import 'package:pets_ecommerce/screens/auth/model/contstants.dart';
import 'package:pets_ecommerce/screens/auth/model/user.dart';
import 'package:pets_ecommerce/screens/auth/view/components/auth_button.dart';
import 'package:pets_ecommerce/screens/auth/view/login/login_screen.dart';
import 'package:pets_ecommerce/screens/auth/view/otp/otp_screen.dart';
import 'package:pets_ecommerce/screens/main_screen/view/main_view.dart';
import 'package:pets_ecommerce/screens/un_aprovverd_screen.dart';
import 'package:pets_ecommerce/screens/vendor_app/model/location_model.dart';
import 'package:pets_ecommerce/screens/vendor_app/requests/vendor_app_requests.dart';
import 'package:pets_ecommerce/screens/widgets/text_field.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  UserType userType;

  RegisterScreen(this.userType);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

List<String> location_items = [
  "القدس",
  "رام الله",
  "القدس",
  "رام الله",
  "القدس",
  "رام الله",
  "القدس",
  "رام الله",
  "القدس",
];
List<City> addresses=[];
bool loaddata=false;

String type;
AuthRequest authRequest = new AuthRequest();
List<String> type_items = [
  "طبيب",
  "مستخدم",
  "متجر",
  "اسطبل",
];

class LoadingScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: CircularProgressIndicator(),
    ));
  }
}

TextEditingController registerFirstNameController = new TextEditingController();

TextEditingController registerLastNameController = new TextEditingController();

TextEditingController registerStoreNameController = new TextEditingController();

TextEditingController registerStableNameController =
    new TextEditingController();

TextEditingController registerPhoneNumberController =
    new TextEditingController();
TextEditingController registerCountyController = new TextEditingController();
TextEditingController registerNumberController = new TextEditingController();

TextEditingController registerPasswordController = new TextEditingController();
TextEditingController otpCodeController = new TextEditingController();

String location = "القدس";

RegisterController registerController = Get.put(RegisterController());

bool showLoading = false;

class _RegisterScreenState extends State<RegisterScreen> {
  VendorAppRequests _vendorAppRequests=VendorAppRequests();
  getaddresses() async {
    loaddata=true;
    setState(() {

    });
    try{
      LocationModel locationModel = await _vendorAppRequests.getLocations();
      addresses=locationModel.cities;
      location=addresses[0].name;
    }catch(e)
    {
      loaddata=false;
      setState(() {

      });
    }

    loaddata=false;
    setState(() {

    });
  }
  @override
  void initState() {
    registerFirstNameController.text = "";
    registerLastNameController.text = "";
    registerStoreNameController.text = "";
    registerStableNameController.text = "";
    registerPhoneNumberController.text = "";
    registerPhoneNumberController.text = "";
    registerNumberController.text = "";
    registerPasswordController.text = "";
    otpCodeController.text = "";
    getaddresses();
    registerController = Get.put(RegisterController());
    switch (widget.userType) {
      case UserType.user:
        registerController.changeType("user");
        type = "مستخدم";
        break;
      case UserType.doctor:
        registerController.changeType("doctor");
        type = "طبيب";
        break;
      case UserType.stable:
        registerController.changeType("stable");
        type = "اسطبل";
        break;
      case UserType.store:
        registerController.changeType("store");
        type = "متجر";
        break;
    }
    // type = widget.userType.toString();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: loaddata==true?LoadingScreen():GetBuilder<RegisterController>(
          init: registerController,
          builder: (controller) => controller.showLoading
              ? LoadingScreen()
              : controller.currentState ==
                      MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              child: Material(
                                elevation: 5,
                                color: Colors.white,
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  height: getProportionateScreenHeight(95),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      "طلب انضمام",
                                      style: h4_21pt,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(16)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: getProportionateScreenHeight(35),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    height: getProportionateScreenHeight(30),
                                    width: getProportionateScreenWidth(370),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height:
                                              getProportionateScreenHeight(25),
                                          width:
                                              getProportionateScreenWidth(20),
                                          child: Image.asset(
                                            "assets/images/auth/star.png",
                                            // fit: BoxFit.fill,
                                          ),
                                        ),
                                        AutoSizeText(
                                          "النوع",
                                          style: body2_14pt,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  GetBuilder<RegisterController>(
                                    init: registerController,
                                    builder: (controller) => Container(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                          width:
                                          getProportionateScreenWidth(156),
                                          height:
                                          getProportionateScreenHeight(45),
                                          alignment: Alignment.centerRight,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(6),
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.grey
                                                    .withOpacity(0.6)),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              // value: type,
                                              items:
                                              type_items.map((String item) {
                                                return DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(item),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  type = value;
                                                });
                                                switch (type) {
                                                  case "مستخدم":
                                                    controller
                                                        .changeType("user");
                                                    break;
                                                  case "طبيب":
                                                    controller
                                                        .changeType("doctor");
                                                    break;
                                                  case "اسطبل":
                                                    controller
                                                        .changeType("stable");
                                                    break;
                                                  case "متجر":
                                                    controller
                                                        .changeType("store");
                                                    break;
                                                }
                                              },
                                              hint: Text(type),
                                              elevation: 8,
                                              style: blackText_14pt,
                                              icon: Icon(Icons.arrow_drop_down),
                                              iconDisabledColor: Colors.black,
                                              iconEnabledColor:
                                              Colors.blue.withOpacity(0.6),
                                              // isExpanded: true,
                                            ),
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(25),
                                  ),
                                  GetBuilder<RegisterController>(
                                      init: registerController,
                                      builder: (controller) => Column(
                                            children: [
                                              controller.type == UserType.stable
                                                  ? Container(
                                                      child: Column(
                                                        children: <Widget>[
                                                          Container(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            height:
                                                                getProportionateScreenHeight(
                                                                    30),
                                                            width:
                                                                getProportionateScreenWidth(
                                                                    370),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Container(
                                                                  height:
                                                                      getProportionateScreenHeight(
                                                                          25),
                                                                  width:
                                                                      getProportionateScreenWidth(
                                                                          20),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/auth/star.png",
                                                                    // fit: BoxFit.fill,
                                                                  ),
                                                                ),
                                                                AutoSizeText(
                                                                  "اسم الاسطبل",
                                                                  style:
                                                                      body2_14pt,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Container(
                                                              height:
                                                                  getProportionateScreenHeight(
                                                                      50),
                                                              width:
                                                                  getProportionateScreenWidth(
                                                                      150),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .grey,
                                                                      width:
                                                                          0.3)),
                                                              child:
                                                                  CustomTextField(
                                                                textEditingController:
                                                                    registerStableNameController,
                                                                // hint:,
                                                                // prefixImage: "assets/images/auth/mobile_icon.png",
                                                                // textInputType: TextInputType.phone,
                                                                color: true,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                getProportionateScreenHeight(
                                                                    15),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),
                                              controller.type == UserType.store
                                                  ? Container(
                                                      child: Column(
                                                        children: <Widget>[
                                                          Container(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            height:
                                                                getProportionateScreenHeight(
                                                                    30),
                                                            width:
                                                                getProportionateScreenWidth(
                                                                    370),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Container(
                                                                  height:
                                                                      getProportionateScreenHeight(
                                                                          25),
                                                                  width:
                                                                      getProportionateScreenWidth(
                                                                          20),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/auth/star.png",
                                                                    // fit: BoxFit.fill,
                                                                  ),
                                                                ),
                                                                AutoSizeText(
                                                                  "اسم المتجر",
                                                                  style:
                                                                      body2_14pt,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Container(
                                                              height:
                                                                  getProportionateScreenHeight(
                                                                      50),
                                                              width:
                                                                  getProportionateScreenWidth(
                                                                      150),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .grey,
                                                                      width:
                                                                          0.3)),
                                                              child:
                                                                  CustomTextField(
                                                                textEditingController:
                                                                    registerStoreNameController,
                                                                // hint:,
                                                                // prefixImage: "assets/images/auth/mobile_icon.png",
                                                                // textInputType: TextInputType.phone,
                                                                color: true,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                getProportionateScreenHeight(
                                                                    15),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),
                                              controller.type ==
                                                          UserType.doctor ||
                                                      controller.type ==
                                                          UserType.user
                                                  ? Container(
                                                      width:
                                                          getProportionateScreenWidth(
                                                              370),
                                                      // height: getProportionateScreenHeight(50),
                                                      // alignment: Alignment.centerLeft,
                                                      child: Row(
                                                        // mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Column(
                                                            children: <Widget>[
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                height:
                                                                    getProportionateScreenHeight(
                                                                        30),
                                                                width:
                                                                    getProportionateScreenWidth(
                                                                        150),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          getProportionateScreenHeight(
                                                                              25),
                                                                      width:
                                                                          getProportionateScreenWidth(
                                                                              15),
                                                                      child: Image
                                                                          .asset(
                                                                        "assets/images/auth/star.png",
                                                                        // fit: BoxFit.fill,
                                                                      ),
                                                                    ),
                                                                    AutoSizeText(
                                                                      "اسم الأخير",
                                                                      style:
                                                                          body2_14pt,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      getProportionateScreenHeight(
                                                                          60),
                                                                  width:
                                                                      getProportionateScreenWidth(
                                                                          150),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .grey,
                                                                          width:
                                                                              0.3)),
                                                                  child:
                                                                      CustomTextField(
                                                                    textEditingController:
                                                                        registerLastNameController,
                                                                    // hint:,
                                                                    // prefixImage: "assets/images/auth/mobile_icon.png",
                                                                    // textInputType: TextInputType.phone,
                                                                    color: true,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    getProportionateScreenHeight(
                                                                        15),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                getProportionateScreenWidth(
                                                                    30),
                                                          ),
                                                          Column(
                                                            children: <Widget>[
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                height:
                                                                    getProportionateScreenHeight(
                                                                        30),
                                                                width:
                                                                    getProportionateScreenWidth(
                                                                        150),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          getProportionateScreenHeight(
                                                                              25),
                                                                      width:
                                                                          getProportionateScreenWidth(
                                                                              15),
                                                                      child: Image
                                                                          .asset(
                                                                        "assets/images/auth/star.png",
                                                                        // fit: BoxFit.fill,
                                                                      ),
                                                                    ),
                                                                    AutoSizeText(
                                                                      "اسم الاول",
                                                                      style:
                                                                          body2_14pt,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                height:
                                                                    getProportionateScreenHeight(
                                                                        60),
                                                                width:
                                                                    getProportionateScreenWidth(
                                                                        150),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey,
                                                                        width:
                                                                            0.3)),
                                                                child:
                                                                    CustomTextField(
                                                                  textEditingController:
                                                                      registerFirstNameController,
                                                                  // hint:,
                                                                  // prefixImage: "assets/images/auth/mobile_icon.png",
                                                                  // textInputType: TextInputType.phone,
                                                                  color: true,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    getProportionateScreenHeight(
                                                                        15),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),
                                            ],
                                          )),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    height: getProportionateScreenHeight(30),
                                    width: getProportionateScreenWidth(370),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height:
                                              getProportionateScreenHeight(25),
                                          width:
                                              getProportionateScreenWidth(20),
                                          child: Image.asset(
                                            "assets/images/auth/star.png",
                                            // fit: BoxFit.fill,
                                          ),
                                        ),
                                        AutoSizeText(
                                          "رقم الهاتف",
                                          style: body2_14pt,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(15),
                                  ),
                                  Row(
                                    children: [
                                      CountryCodePicker(
                                        onInit: (value) {
                                          registerCountyController.text =
                                              value.dialCode;
                                        },
                                        onChanged: (value) {
                                          print("*********");
                                          print(value.dialCode);
                                          print("*********");
                                          registerCountyController.text =
                                              value.dialCode;
                                        },
                                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                        initialSelection: 'US',
                                        favorite: [
                                          '+963',
                                          'SY',
                                          '+1',
                                          'US',
                                          '+44',
                                          'UK'
                                        ],
                                        // optional. Shows only country name and flag
                                        showCountryOnly: false,
                                        // optional. Shows only country name and flag when popup is closed.
                                        showOnlyCountryWhenClosed: false,
                                        // optional. aligns the flag and the Text left
                                        alignLeft: false,
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.3),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: CustomTextField(
                                            textEditingController:
                                                registerNumberController,
                                            hint: "رقم الهاتف الجوال",
                                            prefixImage:
                                                "assets/images/auth/mobile_icon.png",
                                            textInputType: TextInputType.phone,
                                            color: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(20),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    height: getProportionateScreenHeight(30),
                                    width: getProportionateScreenWidth(370),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height:
                                              getProportionateScreenHeight(25),
                                          width:
                                              getProportionateScreenWidth(20),
                                          child: Image.asset(
                                            "assets/images/auth/star.png",
                                            // fit: BoxFit.fill,
                                          ),
                                        ),
                                        AutoSizeText(
                                          "كلمة السر",
                                          style: body2_14pt,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(15),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 0.3),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: CustomTextField(
                                      textEditingController:
                                          registerPasswordController,
                                      hint: "كلمة السر",
                                      prefixImage:
                                          "assets/images/auth/lock_icon.png",
                                      password: true,
                                      textInputType: TextInputType.name,
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(25),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    height: getProportionateScreenHeight(30),
                                    width: getProportionateScreenWidth(370),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height:
                                              getProportionateScreenHeight(25),
                                          width:
                                              getProportionateScreenWidth(20),
                                          child: Image.asset(
                                            "assets/images/auth/star.png",
                                            // fit: BoxFit.fill,
                                          ),
                                        ),
                                        AutoSizeText(
                                          "العنوان",
                                          style: body2_14pt,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(15),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(left: getProportionateScreenWidth(5),right: getProportionateScreenWidth(5)),
                                    child: Container(
                                        padding: EdgeInsets.only(left: getProportionateScreenWidth(5),right: getProportionateScreenWidth(5)),
                                        width: getProportionateScreenWidth(156),
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
                                            items: addresses
                                                .map((City item) {
                                              return DropdownMenuItem<City>(
                                                value: item,
                                                child: Container(
                                                  width: getProportionateScreenWidth(100),
                                                  height:
                                                  getProportionateScreenHeight(45),
                                                  child: AutoSizeText(
                                                    item.name,
                                                    textDirection:
                                                    TextDirection.rtl,
                                                    style: blackText_14pt,
                                                    minFontSize: 9,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (city) async{
                                              print("before");
                                              location=city.name;

                                              print("after");

                                            },
                                            hint: Text(location),
                                            elevation: 8,
                                            style: blackText_14pt,
                                            icon: Container(width:getProportionateScreenWidth(8),child: RotatedBox(quarterTurns:90,child: Icon(Icons.arrow_drop_down))),
                                            iconDisabledColor: Colors.black,
                                            iconEnabledColor: Colors.blue,
                                            // isExpanded: true,
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(40),
                                  ),
                                  AuthButton(
                                    color: true,
                                    title: "متابعة",
                                    ontap: () {
                                      register();
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : OtpScreen(),
        ),
      ),
    );
  }

  Future<bool> verifyPhoneNumber() {
    //api request to check if the number is available
    //if not return false
    //else
  }

  Future<bool> register() async {
    registerPhoneNumberController.text =
        registerCountyController.text + registerNumberController.text;
    consolePrint(registerPhoneNumberController.text);
    if (!AuthServices.isValidPhoneNumber(registerPhoneNumberController.text)) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: " رقم الهاتف الضي ادخلته غير صالح",
      );
      return false;
    }
    if (registerPasswordController.text == "") {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "الرجاء ادخال كلمة مرور لإكمال طلبك ",
      );
      return false;
    }
    if (registerPasswordController.text.length < 6) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "كلمة المرور قصيرة جدا",
      );
      return false;
    }

    if (await authRequest.isExist(registerPhoneNumberController.text)) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: " رقم الهاتف  موجود مسبقا بالفعل",
      );
      return false;
    } else {
      await authRequest.verifyPhoneNumber(registerPhoneNumberController.text);
    }
  }
}

Future<bool> register2() async {
  // CoolAlert.show(
  //   type: CoolAlertType.loading,
  // );
  String mobile="00"+registerPhoneNumberController.text.substring(1);
  consolePrint(mobile);
  bool auth = true;
  switch (type) {
    case "مستخدم":
      {
        if (!await authRequest.registerUserRequest(
            firstName: registerFirstNameController.text,
            secondName: registerLastNameController.text,
            mobile: mobile,
            password: registerPasswordController.text,
            address: location)) {
          auth = false;
          // Get.back();
          // CoolAlert.show(
          //   type: CoolAlertType.error,
          //   text: "حدث خطأ ما يرجى التاكد من المعلومات المدخلة",
          // );
        }
      }
      break;
    case "طبيب":
      {
        if (!await authRequest.registerDoctorRequest(
            firstName: registerFirstNameController.text,
            secondName: registerLastNameController.text,
            mobile: mobile,
            password: registerPasswordController.text,
            address: location)) {
          // Get.back();
          auth = false;
          customDialog("حدث خطأ ما اثناء التسجيل الرجاء المحاولة  مرة اخرى");

          // CoolAlert.show(
          //   type: CoolAlertType.error,
          //   text: "حدث خطأ ما يرجى التاكد من المعلومات المدخلة",
          // );
        }
      }
      break;
    case "اسطبل":
      {
        if (!await authRequest.registerStableRequest(
            stable_name: registerStableNameController.text,
            mobile: mobile,
            password: registerPasswordController.text,
            address: location)) {
          // Get.back();
          auth = false;
          customDialog("حدث خطأ ما اثناء التسجيل الرجاء المحاولة  مرة اخرى");

          // CoolAlert.show(
          //   type: CoolAlertType.error,
          //   text: "حدث خطأ ما يرجى التاكد من المعلومات المدخلة",
          // );
        }
      }
      break;
    case "متجر":
      {
        if (!await authRequest.registerStoreRequest(
            store_name: registerStoreNameController.text,
            mobile: mobile,
            password: registerPasswordController.text,
            address: location)) {
          // Get.back();
          auth = false;
          customDialog("حدث خطأ ما اثناء التسجيل الرجاء المحاولة  مرة اخرى");
          // CoolAlert.show(
          //   type: CoolAlertType.error,
          //   text: "حدث خطأ ما يرجى التاكد من المعلومات المدخلة",
          // );
        }
      }
      break;
  }

  // Get.back();
  // registerController.changeState();
  // registerController.changeLoading();
  if (auth) {
    UserModel user = await authRequest.loginRequest(
        mobile:mobile,
        password: registerPasswordController.text);

    if (user.error != true) {
      if (user.user.approve == "pending") {
        Get.offAll(UnApprovedScreen());
      } else
        Get.offAll(MainScreen());
    } else
      {
      Get.offAll(LoginScreen());
      customDialog("حدث خطأ ما اثناء التسجيل الرجاء تسجيل الدخول  مرة اخرى");
    }
    // CoolAlert.show(
    //   type: CoolAlertType.error,
    //   text: "حدث خطأ ما يرجى تسجيل الدخول مرة اخرى",
    // );

  }

  return auth;
}

customDialog(String title) {
  return Get.dialog(Text(title), barrierColor: Colors.grey.withOpacity(0.6));
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/auth/controller/register_controller.dart';
import 'package:pets_ecommerce/screens/auth/controller/requests/auth_requests.dart';
import 'package:pets_ecommerce/screens/auth/model/contstants.dart';
import 'package:pets_ecommerce/screens/auth/model/user.dart';
import 'package:pets_ecommerce/screens/auth/view/components/auth_button.dart';
import 'package:pets_ecommerce/screens/auth/view/otp/otp_screen.dart';
import 'package:pets_ecommerce/screens/main_screen/view/main_view.dart';
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
    return Container(child: Center(
      child: CircularProgressIndicator(

      ),
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

TextEditingController registerPasswordController = new TextEditingController();
TextEditingController otpCodeController = new TextEditingController();

String location = "القدس";

RegisterController registerController= Get.put(RegisterController());

bool showLoading = false;

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
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
        child: GetBuilder<RegisterController>(
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
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 0.3),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: CustomTextField(
                                      textEditingController:
                                          registerPhoneNumberController,
                                      hint: "رقم الهاتف الجوال",
                                      prefixImage:
                                          "assets/images/auth/mobile_icon.png",
                                      textInputType: TextInputType.phone,
                                      color: true,
                                    ),
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
                                    child: Container(
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            // value: _value,
                                            items: location_items
                                                .map((String item) {
                                              return DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  style: blackText_14pt,
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                location = value;
                                              });
                                            },
                                            hint: Text(location),
                                            elevation: 8,
                                            style: blackText_14pt,
                                            icon: Icon(Icons.arrow_drop_down),
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
                                      authRequest.verifyPhoneNumber(registerPhoneNumberController.text);
                                      // register();
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

  Future<void> register() async {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.loading,
      // text: " رقم الهاتف  أو كلمة المرور غير صحيحة",
    );
    switch (type) {
      case "مستخدم":
        {
          if (!await authRequest.registerUserRequest(
              firstName: registerFirstNameController.text,
              secondName: registerLastNameController.text,
              mobile: registerPhoneNumberController.text,
              password: registerPasswordController.text,
              address: location)) {
            Navigator.pop(context);
            CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              text: "حدث خطأ ما يرجى التاكد من المعلومات المدخلة",
            );
          }
        }
        break;
      case "طبيب":
        {
          if (!await authRequest.registerDoctorRequest(
              firstName: registerFirstNameController.text,
              secondName: registerLastNameController.text,
              mobile: registerPhoneNumberController.text,
              password: registerPasswordController.text,
              address: location)) {
            Navigator.pop(context);
            CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              text: "حدث خطأ ما يرجى التاكد من المعلومات المدخلة",
            );
          }
        }
        break;
      case "اسطبل":
        {
          if (!await authRequest.registerStableRequest(
              stable_name: registerStableNameController.text,
              mobile: registerPhoneNumberController.text,
              password: registerPasswordController.text,
              address: location)) {
            Navigator.pop(context);
            CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              text: "حدث خطأ ما يرجى التاكد من المعلومات المدخلة",
            );
          }
        }
        break;
      case "متجر":
        {
          if (!await authRequest.registerStoreRequest(
              store_name: registerStoreNameController.text,
              mobile: registerPhoneNumberController.text,
              password: registerPasswordController.text,
              address: location)) {
            Navigator.pop(context);
            CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              text: "حدث خطأ ما يرجى التاكد من المعلومات المدخلة",
            );
          }
        }
        break;
    }
    UserModel user = await authRequest.loginRequest(
        mobile: registerPhoneNumberController.text,
        password: registerPasswordController.text);
    Navigator.pop(context);
    if (user.error == false)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    else {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "حدث خطأ ما يرجى تسجيل الدخول مرة اخرى",
      );
    }
  }
}

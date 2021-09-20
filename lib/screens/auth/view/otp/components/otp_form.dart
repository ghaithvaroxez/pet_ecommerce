import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pets/configuration/constants/colors.dart';
import 'package:pets/configuration/printer.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/view/components/auth_button.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';
import 'default_button.dart';
import '../translations/body.i18n.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;
  TextEditingController otpCodeController1 = new TextEditingController();
  TextEditingController otpCodeController2 = new TextEditingController();
  TextEditingController otpCodeController3 = new TextEditingController();
  TextEditingController otpCodeController4 = new TextEditingController();
  TextEditingController otpCodeController5 = new TextEditingController();
  TextEditingController otpCodeController6 = new TextEditingController();

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  final otpInputDecoration = InputDecoration(
    contentPadding:
        EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
    border: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    enabledBorder: outlineInputBorder(),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(100)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: otpCodeController1,
                  autofocus: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                    controller: otpCodeController2,
                    focusNode: pin2FocusNode,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (value) {
                      nextField(value, pin3FocusNode);
                    }),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                    controller: otpCodeController3,
                    focusNode: pin3FocusNode,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (value) {
                      nextField(value, pin4FocusNode);
                    } // maxLength: 1,

                    ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                    controller: otpCodeController4,
                    focusNode: pin4FocusNode,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (value) {
                      nextField(value, pin5FocusNode);
                    } // maxLength: 1,

                    ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                    controller: otpCodeController5,
                    focusNode: pin5FocusNode,
                    style: TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (value) {
                      nextField(value, pin6FocusNode);
                    } // maxLength: 1,

                    ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: otpCodeController6,
                  focusNode: pin6FocusNode,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                  ],
                  onChanged: (value) {
                    if (value.length == 1) {
                      otpCodeController.text = otpCodeController1.text +
                          otpCodeController2.text +
                          otpCodeController3.text +
                          otpCodeController4.text +
                          otpCodeController5.text +
                          otpCodeController6.text;
                      consolePrint(otpCodeController.text);
                      pin6FocusNode.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          AuthButton(
            color: true,
            title: "المتابعة".i18n,
            ontap: () {
              authRequest.signInWithPhoneAuthCredentialWithOtpCode(
                  otpCodeController.text);
            },
          ),
        ],
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: borderColor),
  );
}

import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/configuration/constants/text_style.dart';
import 'package:pets/configuration/size_config.dart';
import 'package:pets/screens/auth/view/register/register_screen.dart';

import 'otp_form.dart';
import '../translations/body.i18n.dart';
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    start_timer();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.2),
              Text(
                "التحقق من رقم الهاتف".i18n,
                style: h5_24pt,
              ),
              SizedBox(height: getProportionateScreenHeight(10),),

              AutoSizeText("لقد تم ارسال رمز التحق الى الرقم ".i18n+registerPhoneNumberController.text,style: body1_16pt_blue,maxLines: 1,),
              SizedBox(height: getProportionateScreenHeight(5),),
              buildTimer(),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  if(ctimer!=0){
                    return ;
                  }
                  // OTP code resend
                  authRequest.reVerifyPhoneNumber(registerPhoneNumberController.text);
                },
                child: Text(
                  "اعادة ارسال الرمز".i18n,
                  style:ctimer!=0?darkGrayText_14pt: whiteButton_14pt_underLined,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }

int ctimer=30;



Timer _timer;
  start_timer(){
    _timer=Timer.periodic(Duration(seconds: 1), (timer) {
ctimer-=1;
if(ctimer==0)
  {
    _cancelTimer();
    setState(() {

    });
  }
    });
  }
  _cancelTimer(){
    _timer.cancel();
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(minutes: 1),
          builder: (_, value, child)
          {
            return Text(
            "00:${value.toInt()}",
            // style: TextStyle(color: kPrimaryColor),
            style: body1_16pt,
          );
          }
        ),
        Text("سوف تنتهي صلاحية الكود بعد ".i18n,style: body2_14pt,),
      ],
    );
  }
}

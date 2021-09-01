import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';
import 'package:pets_ecommerce/screens/auth/view/register/register_screen.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
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
                "التحقق من رقم الهاتف",
                style: h5_24pt,
              ),
              SizedBox(height: getProportionateScreenHeight(10),),

              AutoSizeText("لقد تم ارسال رمز التحق الى الرقم ${registerPhoneNumberController.text} ",style: body1_16pt_blue,maxLines: 1,),
              SizedBox(height: getProportionateScreenHeight(5),),
              buildTimer(),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                  authRequest.reVerifyPhoneNumber(registerPhoneNumberController.text);
                },
                child: Text(
                  "اعادة ارسال الرمز",
                  style: body2_14pt_underlined,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        TweenAnimationBuilder(
          tween: Tween(begin: 59.0, end: 0.0),
          duration: Duration(minutes: 1),
          builder: (_, value, child) => Text(
            "00:${value.toInt()}",
            // style: TextStyle(color: kPrimaryColor),
            style: body1_16pt,
          ),
        ),
        Text("سوف تنتهي صلاحية الكود بعد ",style: body2_14pt,),
      ],
    );
  }
}

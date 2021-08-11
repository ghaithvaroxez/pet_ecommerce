import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';
import 'package:pets_ecommerce/configuration/size_config.dart';


class CustomTextField extends StatelessWidget {
  final String hint;
  final String prefixImage;
  final String suffixImage;
  final bool password;
  final TextInputType textInputType;
bool multiLine;
final bool color;
final TextEditingController textEditingController;
   CustomTextField({Key key, this.hint, this.prefixImage="", this.suffixImage="",this.multiLine=false, this.password=false, this.textInputType=TextInputType.name, this.color=false,@required this.textEditingController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   suffixImage!=""&&prefixImage!=""?TextFormField(
controller: textEditingController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText:hint,
        hintStyle: grayText_14pt,
          suffixIcon:Container(height: 20,width: 20,child: Image.asset(suffixImage,fit: BoxFit.contain,)) ,
        prefixIcon: Container(height: 20,width: 20,child: color?Image.asset(prefixImage,color:Color(0xFF348BA7).withOpacity(0.38),width: 20,height: 20,):Image.asset(prefixImage,width: 20,height: 20,)),
      ),
      obscureText: password,
      keyboardType: textInputType,

    ):prefixImage==""&&suffixImage!=""?Padding(
      padding:  EdgeInsets.only(right:getProportionateScreenWidth(12)),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText:hint,
          hintStyle: grayText_14pt,
          suffixIcon:Container(height: 20,width: 20,child: Image.asset(suffixImage,fit: BoxFit.contain,)) ,
          // prefixIcon: Container(height: 20,width: 20,child: color?Image.asset(prefixImage,color:Color(0xFF348BA7).withOpacity(0.38),width: 20,height: 20,):Image.asset(prefixImage,width: 20,height: 20,)),
        ),
        obscureText: password,
        keyboardType: textInputType,
      ),
    ):prefixImage!=""&&suffixImage==""?Padding(
      padding:  EdgeInsets.only(left:getProportionateScreenWidth(12)),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText:hint,
          hintStyle: grayText_14pt,
          // suffixIcon:Container(height: 20,width: 20,child: Image.asset(suffixImage,fit: BoxFit.contain,)) ,
          prefixIcon: Container(height: 20,width: 20,child: color?Image.asset(prefixImage,color:Color(0xFF348BA7).withOpacity(0.38),width: 20,height: 20,):Image.asset(prefixImage,width: 20,height: 20,)),
        ),
        obscureText: password,
        keyboardType: textInputType,
      ),
    ):Padding(
      padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(12)),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText:hint,
          hintStyle: grayText_14pt,
          // suffixIcon:Container(height: 20,width: 20,child: Image.asset(suffixImage,fit: BoxFit.contain,)) ,
          // prefixIcon: Container(height: 20,width: 20,child: color?Image.asset(prefixImage,color:Color(0xFF348BA7).withOpacity(0.38),width: 20,height: 20,):Image.asset(prefixImage,width: 20,height: 20,)),
        ),

        obscureText: password,
        keyboardType: textInputType,
      ),
    );
  }
}

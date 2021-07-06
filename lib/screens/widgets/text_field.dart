import 'package:flutter/material.dart';
import 'package:pets_ecommerce/configuration/constants/text_style.dart';


class CustomTextField extends StatelessWidget {
  final String hint;
  final String prefixImage;
  final String suffixImage;
  final bool password;
  final TextInputType textInputType;

final bool color;
final TextEditingController textEditingController;
  const CustomTextField({Key key, this.hint, this.prefixImage="", this.suffixImage="", this.password=false, this.textInputType=TextInputType.name, this.color=false,@required this.textEditingController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   TextFormField(
controller: textEditingController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText:hint,
        hintStyle: grayText_14pt,
          suffixIcon:Container(height: 20,width: 20,padding:EdgeInsets.all(12),child: Image.asset(suffixImage,fit: BoxFit.contain,)) ??(suffixImage==""),
        prefixIcon: Container(padding:EdgeInsets.all(12),child: color?Image.asset(prefixImage,color:Color(0xFF348BA7).withOpacity(0.38),width: 20,height: 20,):Image.asset(prefixImage,width: 20,height: 20,))??prefixImage=="",
      ),
      obscureText: password,
      keyboardType: textInputType,
    );
  }
}

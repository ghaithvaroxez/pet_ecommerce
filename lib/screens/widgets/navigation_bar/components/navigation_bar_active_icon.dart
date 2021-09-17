import 'package:flutter/material.dart';

class NavigationBarActiveIcon extends StatelessWidget {
  final String img;
  final String title;
  NavigationBarActiveIcon({this.img, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          Expanded(flex:2,child: Image.asset(img)),
          Expanded(flex:1,child: Text(title),),
        ],
      ),
    );
  }
}

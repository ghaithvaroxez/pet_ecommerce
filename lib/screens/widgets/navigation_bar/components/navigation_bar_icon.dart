import 'package:flutter/material.dart';


class NavigationBarIcon extends StatelessWidget {
  final String img;
  final String title;
  NavigationBarIcon({this.img, this.title});
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

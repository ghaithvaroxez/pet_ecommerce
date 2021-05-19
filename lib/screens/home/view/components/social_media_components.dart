import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 24,
          width: 98,
          // alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12)),
            color: Colors.white.withOpacity(0.6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/home/whatsapp.png"),
              SizedBox(
                width: 5,
              ),
              Image.asset("assets/images/home/facebook.png"),
              SizedBox(
                width: 5,
              ),
              Image.asset("assets/images/home/instagram.png"),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Temp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              color: Colors.white,
              elevation: 5,
              child: Center(
                child: IconButton(
                  icon: Icon(
                    CupertinoIcons.rectangle_grid_2x2,
                    color: Colors.teal,
                    size: 28,
                  ),
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.red,
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1496440737103-cd596325d314?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"),
            ),
          ],
        ),
      ],
    );
  }
}

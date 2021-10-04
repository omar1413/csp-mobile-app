import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  String str;
  Function onPressed;
  Color color;
  double size;
  TextDecoration td;

  CustomTextButton(
      {required this.str,
      required this.onPressed,
      required this.size,
      required this.color,
      required this.td});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      alignment: Alignment.topLeft,
      // padding: EdgeInsets.symmetric(horizontal:),
      child: TextButton(
          onPressed: () => onPressed(),
          child: Text(
            str,
            style: TextStyle(
                color: color,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.normal),
          )),
    );
  }
}

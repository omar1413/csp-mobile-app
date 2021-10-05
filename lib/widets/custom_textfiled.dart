import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/widets/CustomText.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String str;

  CustomTextField({required this.str});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMidHeight,
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        // textDirection:TextDirection.rtl ,
        textAlign: TextAlign.end,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey),
          //focusColor: Theme.of(context).primaryColor,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          labelText: str,
        ),
      ),
    );
  }
}

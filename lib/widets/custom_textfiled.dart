import 'package:csp_mobile_app/widets/CustomText.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String str;
  CustomTextField({required this.str});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 300,
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
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          labelText: str,
        ),
      ),
    );
  }
}

import 'package:csp_mobile_app/widets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTapIcon extends StatelessWidget {
  String title;
  Icon icon;
  CustomTapIcon({required this.title, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
            flex: 7,
            child: icon,
          ),
          Expanded(
              flex: 5,
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ))
        ]));
  }
}

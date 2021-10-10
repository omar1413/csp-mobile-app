// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  double size;
  Color color;
  CustomText({required this.color, required this.size, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Text(
        text,
        textAlign: TextAlign.end,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: size,
          color: color,
        ),
      ),
    );
  }
}

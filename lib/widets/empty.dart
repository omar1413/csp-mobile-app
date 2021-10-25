import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  String text;
  EmptyWidget({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(child: Text(text));
  }
}

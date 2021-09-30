import 'package:flutter/material.dart';

import 'CustomText.dart';

class InfoLabel extends StatelessWidget {
  final String text;
  InfoLabel(this.text);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(text),
        Container(
          margin: EdgeInsets.all(3),
          height: 4,
          width: 30,
          decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.circular(10)),
        ),
      ],
    );
  }
}

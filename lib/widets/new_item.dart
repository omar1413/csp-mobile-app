import 'package:csp_mobile_app/models/news_dara.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewItem extends StatelessWidget {
  New newItem;
  NewItem({required this.newItem});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: 120,
      width: width,
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

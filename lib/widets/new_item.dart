// ignore_for_file: unrelated_type_equality_checks

import 'package:csp_mobile_app/models/news_data.dart';
import 'package:csp_mobile_app/widets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  New newItem;
  NewItem({required this.newItem});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  Color color = Colors.yellow;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    color = getColor(widget.newItem.code!);

    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.8,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(offset: Offset(0, 2), blurRadius: 10, color: Colors.grey),
        ],
        gradient: LinearGradient(colors: [
          Colors.black,
          color,
        ], tileMode: TileMode.clamp),
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          alignment: Alignment.bottomLeft,
          scale: 1,
          image: AssetImage("assets/images/promotion.png"),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: CustomText(
              text: widget.newItem.newsType.toString() +
                  " على طريق " +
                  widget.newItem.road!.name.toString(),
              size: 16,
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              alignment: Alignment.topRight,
              child: FittedBox(
                child: Text(
                  widget.newItem.newsDescription.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

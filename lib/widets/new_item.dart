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
    //print(widget.newItem.code.toString());
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.8,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          color,
          Colors.black,
        ], tileMode: TileMode.clamp),
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          alignment: Alignment.bottomLeft,
          scale: 0.5,
          image: AssetImage("assets/images/promotion.png"),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomText(
              text: widget.newItem.newsType.toString() +
                  " على طريق " +
                  widget.newItem.road!.name.toString(),
              size: 18,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: FittedBox(
              child: Text(
                widget.newItem.newsDescription.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

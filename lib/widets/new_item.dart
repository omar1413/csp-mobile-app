// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';

import 'package:csp_mobile_app/constant.dart';
import 'package:csp_mobile_app/models/news_data.dart';
import 'package:csp_mobile_app/widets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  final List<New> news;
  NewItem({required this.news});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  Color color = Colors.yellow;
  int x = 0;

  Timer? t;
  @override
  void initState() {
    print("state : init");
    initTimer();
    super.initState();
  }

  initTimer() {
    t?.cancel();

    t = Timer.periodic(Duration(seconds: 5), (_) {
      setState(() {
        x++;
        if (x >= widget.news.length) {
          x = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    print("state : dispose");
    t?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.news.length > 0) {
      color = getColor(widget.news[x].code!);
    } else {
      return Container();
    }

    double width = MediaQuery.of(context).size.width;

    return AnimatedContainer(
      duration: Duration(seconds: 2),
      width: double.infinity,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(offset: Offset(0, 2), blurRadius: 10, color: Colors.grey),
        ],
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Colors.black54,
              color,
            ],
            tileMode: TileMode.clamp),
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          alignment: Alignment.bottomLeft,
          scale: 1,
          image: AssetImage("assets/images/promotion.png"),
        ),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: CustomText(
                text: widget.news[x].newsType.toString() +
                    " على طريق " +
                    widget.news[x].road!.name.toString(),
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
                    widget.news[x].newsDescription.toString(),
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
      ),
    );
  }
}

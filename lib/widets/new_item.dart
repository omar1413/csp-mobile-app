import 'package:csp_mobile_app/models/news_dara.dart';
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
  Color color = Colors.white;
  void newColor() {
    if (widget.newItem.code == NewColor.Red) {
      color = Colors.red;
    }
    if (widget.newItem.code == NewColor.blue) {
      color = Colors.blue;
    }
    if (widget.newItem.code == NewColor.yellow) {
      color = Colors.yellow;
    }
    if (widget.newItem.code == NewColor.green) {
      color = Colors.green;
    }

    return;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color, Colors.black]),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          CustomText(
            text: widget.newItem.newsType.toString(),
            size: 20,
            color: Colors.white,
          ),
          Container(
            // padding: const EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            child: Expanded(
              child: Text(
                widget.newItem.newsDescription.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 11),
              ),
            ),
          ),
          Image.asset("assets/images/promotion.png"),
        ],
      ),
    );
  }
}

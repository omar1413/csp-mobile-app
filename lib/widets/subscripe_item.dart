import 'package:csp_mobile_app/models/subscriptions_data.dart';
import 'package:csp_mobile_app/widets/CustomText.dart';
import 'package:csp_mobile_app/widets/custom_text_line.dart';
import 'package:flutter/material.dart';

class SubscripeItem extends StatefulWidget {
  SubscripeData item;
  SubscripeItem({required this.item});

  @override
  State<SubscripeItem> createState() => _SubscripeItemState();
}

class _SubscripeItemState extends State<SubscripeItem> {
  double days = 0;
  double daysLeft = 0;
  double percentage = 0;
  @override
  void initState() {
    days = widget.item.end.difference(widget.item.start).inDays * 1.0;
    daysLeft = widget.item.end.difference(DateTime.now()).inDays * 1.0;
    percentage = daysLeft / days;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.9),
              Colors.white,
            ],
            begin: Alignment.bottomLeft,
          ),
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(0, 2), blurRadius: 5)
          ]),
      child: Container(
        width: width,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                widget.item.title,
                style: TextStyle(
                    fontSize: 18, color: Theme.of(context).primaryColorDark),
              ),
              Container(
                width: width * 0.31,
                child: FlatButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  color: Theme.of(context).primaryColor,
                  height: 20,
                  child: Text(
                    "تجديد الاشتراك",
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                ),
              ),
            ]),
            Row(
              children: [
                Text(
                  daysLeft.toString(),
                  style: TextStyle(fontSize: 26, color: Colors.green),
                ),
                Text(
                  "  يوم متبقى على انتهاء الاشتراك  ",
                  style: TextStyle(fontSize: 16, color: Colors.green[900]),
                ),
              ],
            ),
            LinearProgressIndicator(
              color: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey[300],
              value: percentage,
            ),
          ],
        ),
      ),
    );
  }
}

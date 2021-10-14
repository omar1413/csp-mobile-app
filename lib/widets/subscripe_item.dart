import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/models/subscriptions_data.dart';
import 'package:csp_mobile_app/screens/subscription_data_screen.dart';
import 'package:csp_mobile_app/widets/CustomText.dart';
import 'package:csp_mobile_app/widets/custom_text_line.dart';
import 'package:flutter/material.dart';

class SubscripeItem extends StatefulWidget {
  Subscription item;
  final Function(Subscription) onTap;
  SubscripeItem({required this.item, required this.onTap});

  @override
  State<SubscripeItem> createState() => _SubscripeItemState();
}

class _SubscripeItemState extends State<SubscripeItem> {
  double days = 0;
  double daysLeft = 0;
  double percentage = 0;
  @override
  void initState() {
    print("Days :: ");
    print(widget.item.endDate);
    print("end Date " + widget.item.endDate.toString());
    print("start Date " + widget.item.startDate.toString());
    print("now " + DateTime.now().toString());
    print(widget.item.endDate!.difference(DateTime.now()).inDays * 1.0);
    days = widget.item.endDate!.difference(widget.item.startDate!).inDays * 1.0;
    daysLeft = widget.item.endDate!.difference(DateTime.now()).inDays * 1.0;
    //percentage = daysLeft / 10;
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
                widget.item.bundle!.name,
                style: TextStyle(
                    fontSize: 18, color: Theme.of(context).primaryColorDark),
              ),
              Container(
                width: width * 0.31,
                child: FlatButton(
                  onPressed: () {
                    print(widget.onTap);
                    widget.onTap(widget.item);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: FittedBox(
                    child: Text(
                      daysLeft.toStringAsFixed(0).toString(),
                      style: TextStyle(fontSize: 30, color: Colors.green),
                    ),
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Container(
                    padding: EdgeInsets.only(right: 50),
                    child: FittedBox(
                      child: Text(
                        "يوم متبقى على انتهاء الاشتراك من " +
                            days.toStringAsFixed(0).toString() +
                            " يوم",
                        style:
                            TextStyle(fontSize: 16, color: Colors.green[900]),
                      ),
                    ),
                  ),
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

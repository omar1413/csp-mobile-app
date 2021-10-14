import 'package:csp_mobile_app/models/subscription.dart';
import 'package:csp_mobile_app/screens/subscription_data_screen.dart';
import 'package:csp_mobile_app/widets/widget_size.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../constant.dart';

class SubscriptionListItem extends StatefulWidget {
  final Subscription subscription;

  SubscriptionListItem({Key? key, required this.subscription})
      : super(key: key) {
    print("subscription L:: ");
    print(subscription.toJson());
  }

  @override
  _SubscriptionListItemState createState() => _SubscriptionListItemState();
}

class _SubscriptionListItemState extends State<SubscriptionListItem> {
  Size size = Size(0, 0);
  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    String text = "فعال";
    Color textColor = kblack;
    bool isInActive =
        widget.subscription.endDate!.difference(DateTime.now()).isNegative;
    bool tooSoon =
        widget.subscription.endDate!.difference(DateTime.now()).inDays <= 10;

    bool isActive = true;
    if (isInActive) {
      color = Colors.red;
      textColor = kwhite;
      text = "منتهى";
    } else if (tooSoon) {
      color = Colors.orange;
      text = "قارب على الانتهاء";
      textColor = kwhite;
    } else {
      color = Colors.green;
      textColor = kwhite;
    }

    intl.DateFormat formatter = intl.DateFormat('yyyy/MM/dd');
    TextTheme textTheme = Theme.of(context).textTheme.apply(
          bodyColor: textColor,
          displayColor: textColor,
        );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            height: height + 30,
            width: width == 0 ? 0 : width - 20,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                text,
                style: TextStyle(color: textColor),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              child: Card(
                elevation: 8,
                margin: EdgeInsets.all(0),
                child: WidgetSize(
                  onChange: (size) {
                    setState(() {
                      if (size != null) {
                        height = size.height;
                        width = size.width;
                      }
                    });
                  },
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SubscriptionDataScreen.routeName,
                        arguments: widget.subscription,
                      );
                    },
                    title: Text(widget.subscription.bundle!.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Text("حروف اللوحه : " +
                                widget.subscription.vechile!.plateLetters!),
                            SizedBox(width: 10),
                            Text("ارقام اللوحه : " +
                                widget.subscription.vechile!.plateNumbers!),
                          ],
                        ),
                        SizedBox(width: 10),
                        Row(
                          children: [
                            Text(
                              "تاريخ بدايه الاشتراك : ",
                            ),
                            Expanded(
                              child: Text(
                                formatter
                                    .format(widget.subscription.startDate!),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "تاريخ نهايه الاشتراك : ",
                            ),
                            Expanded(
                              child: Text(
                                formatter.format(widget.subscription.endDate!),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/car.png"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

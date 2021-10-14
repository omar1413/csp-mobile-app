import 'package:csp_mobile_app/models/DummyHomeItem.dart';
import 'package:csp_mobile_app/models/news_data.dart';
import 'package:csp_mobile_app/models/road_data.dart';
import 'package:csp_mobile_app/widets/CustomText.dart';
import 'package:csp_mobile_app/widets/new_item.dart';
import 'package:csp_mobile_app/widets/square_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text_line.dart';

class RoadInfo extends StatelessWidget {
  Road road;
  List<New> newsOfRoad;
  RoadInfo({required this.road, required this.newsOfRoad});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomTextLine(text: "طريق  " + road.name.toString()),
        Container(
          margin: EdgeInsets.all(10),
          child: CustomText(
              text: "السرعة المقررة",
              size: 18,
              color: Theme.of(context).primaryColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Square_slider(
              item: DummySpeedItems[0],
              amount: (road.limitSpeed! - 50).toDouble(),
              scale: 3,
            ),
            Square_slider(
              item: DummySpeedItems[1],
              amount: (road.limitSpeed! + 50).toDouble(),
              scale: 3,
            ),
            Square_slider(
              item: DummySpeedItems[2],
              amount: road.limitSpeed!.toDouble(),
              scale: 3,
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.all(10),
            child: CustomText(
                text: "معلومات الطريق ",
                size: 18,
                color: Theme.of(context).primaryColor)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Square_slider(
              item: DummyRoadItems[0],
              amount: road.roadLength!.toDouble(),
              scale: 2,
            ),
            Square_slider(
              item: DummyRoadItems[1],
              amount: road.feesAmount!.toDouble(),
              scale: 0.6,
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          height: 120,
          child: NewItem(news: newsOfRoad),
        ),
      ]),
    );
  }
}

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
              text: "السرعة المقررة", size: 18, color: Colors.green[600]!),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Square_slider(
                item: DummySpeedItems[0],
                amount: (road.limitSpeed! - 50).toDouble()),
            Square_slider(
                item: DummySpeedItems[1],
                amount: (road.limitSpeed! + 50).toDouble()),
            Square_slider(
                item: DummySpeedItems[2], amount: road.limitSpeed!.toDouble()),
          ],
        ),
        Container(
            margin: EdgeInsets.all(10),
            child: CustomText(
                text: "معلومات الطريق ", size: 18, color: Colors.green[600]!)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Square_slider(
                item: DummyRoadItems[0], amount: road.roadLength!.toDouble()),
            Square_slider(
                item: DummyRoadItems[1], amount: road.feesAmount!.toDouble()),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: newsOfRoad.length,
            itemBuilder: (BuildContext context, int index) {
              return NewItem(newItem: newsOfRoad[index]);
            },
          ),
        )
      ]),
    );
  }
}

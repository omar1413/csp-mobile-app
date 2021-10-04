// ignore_for_file: file_names

import 'dart:ffi';

import 'package:csp_mobile_app/models/DummyHomeItem.dart';
import 'package:csp_mobile_app/widets/CustomText.dart';
import 'package:csp_mobile_app/widets/custom_text_line.dart';
import 'package:csp_mobile_app/widets/custom_textfiled.dart';
import 'package:csp_mobile_app/widets/square_item.dart';
import 'package:flutter/material.dart';

class RoadData extends StatefulWidget {
  const RoadData({Key? key}) : super(key: key);
  static const routeName = '/roudDataScreen';

  @override
  State<RoadData> createState() => _RoadDataState();
}

class _RoadDataState extends State<RoadData> {
  String dropdownValue = "طريق مصر السويس";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("بيانات الطرق "),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonHideUnderline(
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(20),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: [
                    "طريق مصر السويس",
                    "طريق صلاح سالم ",
                    "الطريق الزراعى "
                  ].map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            CustomTextLine(text: "طريق مصر السويس"),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 5, right: 30),
              child: Text(
                "السرعة المقررة ",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Square_slider(item: DummySpeedItems[0]),
                  Square_slider(item: DummySpeedItems[1]),
                  Square_slider(item: DummySpeedItems[2]),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 5, right: 30),
                  child: Text(
                    "معلومات عن الطريق",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Square_slider(item: DummyRoadItems[0]),
                    Square_slider(item: DummyRoadItems[1]),
                    Square_slider(item: DummyRoadItems[2]),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 120,
                  width: width * 0.95,
                  margin: EdgeInsets.only(right: 20, left: 15),
                  child: Stack(children: [
                    Container(
                      height: 120,
                      width: width,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.1,
                            blurRadius: 3,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "حادث على طريق صلاح سالم",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900]),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      child: Container(
                        height: 90,
                        width: width * 0.9,
                        padding: const EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        child: Expanded(
                          child: Text(
                            "لقى شخص مصرعه، فيما أصيب 7 أشخاص آخرين في حادث تصادم سيارة ملاكي بجرار زراعي بالطريق الدائري بمركز مغاغة شمال المنيا، وتم نقل المصابين والجثة إلى المستشفي تحت تصرف النيابة",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontSize: 11),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 13,
                      left: 10,
                      child: Container(
                          height: 95,
                          child: Image.asset("assets/images/promotion.png")),
                    )
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

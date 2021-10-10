// ignore_for_file: file_names

import 'dart:ffi';

import 'package:csp_mobile_app/api/road_api.dart';
import 'package:csp_mobile_app/models/DummyHomeItem.dart';
import 'package:csp_mobile_app/models/road_data.dart';
import 'package:csp_mobile_app/widets/CustomText.dart';
import 'package:csp_mobile_app/widets/custom_text_line.dart';
import 'package:csp_mobile_app/widets/custom_textfiled.dart';
import 'package:csp_mobile_app/widets/road_info.dart';
import 'package:csp_mobile_app/widets/square_item.dart';
import 'package:flutter/material.dart';

class RoadData extends StatefulWidget {
  const RoadData({Key? key}) : super(key: key);
  static const routeName = '/roudDataScreen';

  @override
  State<RoadData> createState() => _RoadDataState();
}

class _RoadDataState extends State<RoadData> {
  String? dropdownValue;
  Road? selectedRoad;
  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("بيانات الطرق "),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: FutureBuilder<List<Road>>(
            future: getAllRoads(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Road>> snapshot) {
              if (!snapshot.hasData || snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              List<Road> roads = snapshot.data!;
              items = [];
              for (int i = 0; i < roads.length; i++) {
                if (dropdownValue == null) {
                  dropdownValue = roads[i].name!;
                }
                items.add(roads[i].name!);
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonHideUnderline(
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(20),
                      decoration: const ShapeDecoration(
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
                            selectedRoad = roads
                                .firstWhere((road) => road.name == newValue);
                          });
                        },
                        items: items.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  _roadInfo(),
                ],
              );
            },
          )),
        ),
      ),
    );
  }

  Widget _roadInfo() {
    if (selectedRoad != null) {
      return RoadInfo(road: selectedRoad!);
    }
    return Container();
  }
}

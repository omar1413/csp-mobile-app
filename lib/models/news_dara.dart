import 'package:csp_mobile_app/models/road_data.dart';
import 'package:flutter/material.dart';

class New {
  int id;
  Road road;
  String newsType;
  String code;
  String newsDescription;

  New({
    required this.id,
    required this.road,
    required this.newsType,
    required this.code,
    required this.newsDescription,
  });

  New.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        road = json["road"],
        newsType = json["newsType"],
        code = json["code"],
        newsDescription = json["newsDescription"];
}

import 'package:csp_mobile_app/models/road_data.dart';
import 'package:flutter/material.dart';

class New {
  int? id;
  Road? road;
  String? newsType;
  String? code;
  String? newsDescription;

  New({
    required this.id,
    required this.road,
    required this.newsType,
    required this.code,
    required this.newsDescription,
  });

  New.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        road = Road.fromJson(json["road"]),
        newsType = json["newsType"],
        code = json["code"],
        newsDescription = json["newsDescription"];
}

List<New> news = [];
Color getColor(String code) {
  print("code $code");

  if (code == "ACC") return Color.fromRGBO(255, 69, 54, 1);
  if (code == "FIX") return Color.fromRGBO(70, 156, 255, 1);

  if (code == "CROW") return Color.fromRGBO(64, 145, 108, 1);

  if (code == "GEN") return Color.fromRGBO(255, 155, 70, 1);

  return Colors.white;
}

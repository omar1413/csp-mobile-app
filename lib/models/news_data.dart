// ignore_for_file: unrelated_type_equality_checks, curly_braces_in_flow_control_structures

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

Color getColor(String code) {
  print("code $code");

  if (code == "acc") return Colors.red;
  if (code == "fix") return Colors.blue;

  if (code == "crow") return Colors.yellow;

  if (code == "gen") return Colors.green;

  return Colors.white;
}

enum NewsColor {
  crow,
  fix,
  acc,
  gen,
}

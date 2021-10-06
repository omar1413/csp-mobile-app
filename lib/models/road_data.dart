import 'package:flutter/material.dart';

class Road {
  int? id;
  String name;
  int feesAmount;
  int roadLength;
  int limitSpeed;
  String weather;

  Road({
    required this.limitSpeed,
    required this.feesAmount,
    required this.name,
    required this.roadLength,
    required this.weather,
    required this.id,
  });

  Road.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        limitSpeed = json["limitSpeed"],
        roadLength = json["roadLength"],
        weather = json["weather"],
        feesAmount = json["feesAmount"];
}

import 'dart:convert';

import 'package:csp_mobile_app/models/subscription.dart';

class Vehicle {
  int id;
  VehicleType type;
  String plateLetters;
  String plateNumbers;
  String tagValue;

  Vehicle({
    required this.id,
    required this.type,
    required this.plateLetters,
    required this.plateNumbers,
    required this.tagValue,
  });

  Vehicle.fromJson(Map jsonMap)
      : this.id = jsonMap["id"],
        this.plateLetters = jsonMap["plateLetters"],
        this.plateNumbers = jsonMap["plateNumbers"],
        this.tagValue = jsonMap["tagValue"],
        this.type = VehicleType.fromJson(jsonMap["vehicleTypeLkp"]);
}

class VehicleType {
  int id;
  String code;
  String desc;

  VehicleType({
    required this.id,
    required this.code,
    required this.desc,
  });

  VehicleType.fromJson(Map jsonMap)
      : id = jsonMap["id"],
        code = jsonMap["code"],
        desc = jsonMap["desc"];
}

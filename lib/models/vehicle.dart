import 'dart:convert';

import 'package:csp_mobile_app/models/governorate_lkp.dart';
import 'package:csp_mobile_app/models/subscription.dart';

class Vehicle {
  int id;
  VehicleType? type;
  String? plateLetters;
  String? plateNumbers;
  String? tagValue;
  GovernorateLkp? governorateLkp;

  Vehicle({
    required this.id,
    this.type,
    this.plateLetters,
    this.plateNumbers,
    this.tagValue,
  });

  Vehicle.fromJson(Map jsonMap)
      : this.id = jsonMap["id"],
        this.plateLetters = jsonMap["plateLetters"],
        this.plateNumbers = jsonMap["plateNumbers"],
        this.tagValue = jsonMap["tagValue"],
        this.type = VehicleType.fromJson(jsonMap["vehicleTypeLkp"]),
        this.governorateLkp =
            GovernorateLkp.fromJson(jsonMap["governorateLkp"]) {
    if (plateLetters == null) {
      if (governorateLkp?.desc == null) {
        plateLetters = "";
      } else {
        plateLetters = governorateLkp?.desc;
      }
    }
  }

  Map toJson() {
    return {
      "id": id,
      "plateLetters": plateLetters,
      "plateNumbers": plateNumbers,
      "tagValue": tagValue,
      "vehicleTypeLkp": type?.toJson(),
      "governorateLkp": governorateLkp?.toJson(),
    };
  }
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

  Map toJson() {
    return {
      "id": id,
      "code": code,
      "desc": desc,
    };
  }
}

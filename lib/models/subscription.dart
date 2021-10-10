import 'dart:convert';

import 'package:csp_mobile_app/models/vehicle.dart';

import 'Bundle.dart';

class Subscription {
  int id = 0;
  Bundle bundle;
  DateTime startDate;
  DateTime endDate;
  Vehicle vechile;

  Subscription({
    this.id = 0,
    required this.bundle,
    required this.startDate,
    required this.endDate,
    required this.vechile,
  });
  Subscription.fromJson(Map jsonMap)
      : this.id = jsonMap["id"],
        this.startDate =
            DateTime.fromMillisecondsSinceEpoch(jsonMap["startDate"]),
        this.endDate = DateTime.fromMillisecondsSinceEpoch(jsonMap["endDate"]),
        this.bundle = Bundle.fromJson(jsonMap["bundle"]),
        this.vechile = Vehicle.fromJson(jsonMap["vehicle"]);
}

import 'dart:convert';

import 'package:csp_mobile_app/models/vehicle.dart';

import 'Bundle.dart';

class Subscription {
  int? id;
  Bundle? bundle;
  DateTime? startDate;
  DateTime? endDate;
  Vehicle? vechile;
  double? paidAmount;
  int? subscriptionPeriod;

  Subscription({
    this.id,
    this.bundle,
    this.startDate,
    this.endDate,
    this.vechile,
    this.paidAmount,
    this.subscriptionPeriod,
  });
  Subscription.fromJson(Map jsonMap)
      : this.id = jsonMap["id"],
        this.startDate =
            DateTime.fromMillisecondsSinceEpoch(jsonMap["startDate"]),
        this.endDate = DateTime.fromMillisecondsSinceEpoch(jsonMap["endDate"]),
        this.bundle = Bundle.fromJson(jsonMap["bundle"]),
        this.vechile = Vehicle.fromJson(jsonMap["vehicle"]),
        this.paidAmount = jsonMap["paidAmount"],
        this.subscriptionPeriod = jsonMap["subscriptionPeriod"];

  Map toJson() {
    return {
      "id": id,
      "startDate": startDate?.millisecondsSinceEpoch,
      "endDate": endDate?.millisecondsSinceEpoch,
      "bundle": bundle?.toJson(),
      "vehicle": vechile?.toJson(),
      "paidAmount": paidAmount,
      "subscriptionPeriod": subscriptionPeriod,
    };
  }
}

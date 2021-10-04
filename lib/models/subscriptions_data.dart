import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscripeData {
  String title;
  DateTime start;
  DateTime end;

  SubscripeData({
    required this.title,
    required this.start,
    required this.end,
  });
}

final DummySubscriptionItems = [
  SubscripeData(
    title: "اشتراك 1",
    start: DateTime.utc(2021, DateTime.april, 15),
    end: DateTime.utc(2021, DateTime.november, 23),
  ),
  SubscripeData(
    title: "اشتراك 2",
    start: DateTime.utc(2021, DateTime.february, 1),
    end: DateTime.utc(2021, DateTime.december, 19),
  ),
  SubscripeData(
    title: "اشتراك 3",
    start: DateTime.utc(2021, DateTime.march, 28),
    end: DateTime.utc(2022, DateTime.february, 8),
  ),
];

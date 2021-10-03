import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscripeData {
  String title;
  DateTime start;
  DateTime end;
  DateTime value;

  SubscripeData({
    required this.title,
    required this.start,
    required this.end,
    required this.value,
  });
}

final DummyHomeCircularItems = [
  SubscripeData(
    title: "رصيد المحفظة",
    start: DateTime.utc(2012, DateTime.april, 15),
    end: DateTime.utc(2012, DateTime.april, 15),
    value: DateTime.now(),
  ),
];

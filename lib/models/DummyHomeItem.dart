import 'package:csp_mobile_app/api/dashboard_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeItem {
  int? id;
  Future<int> Function()? future;
  String title;
  String subtitle;
  String type;
  int amount;
  double? max;
  Color color;
  String img;

  HomeItem({
    required this.title,
    this.id,
    required this.subtitle,
    required this.type,
    required this.amount,
    required this.color,
    required this.img,
    this.future,
    this.max,
  });
}

final DummyHomeSquareItems = [
  HomeItem(
    title: "السرعة الأن",
    subtitle: "",
    type: "ك/س",
    amount: 120,
    color: Colors.black,
    img: "assets/images/download-speed.png",
  ),
  HomeItem(
    title: "شيراتون",
    subtitle: "رصيدك الحالى",
    type: "مشمس",
    amount: 28,
    color: Colors.orange,
    img: "assets/images/weather-app.png",
  ),
];

final DummySpeedItems = [
  HomeItem(
    title: "نقل",
    subtitle: "",
    type: "ك/س",
    amount: 80,
    color: Colors.white,
    img: "assets/images/speed.png",
  ),
  HomeItem(
    title: "دراجة نارية",
    subtitle: "",
    type: "ك/س",
    amount: 100,
    color: Colors.white,
    img: "assets/images/speed.png",
  ),
  HomeItem(
      title: "ملاكى ",
      subtitle: "",
      type: "ك/س",
      amount: 120,
      color: const Color(0xFFE0E0E0),
      img: "assets/images/speed.png")
];

final DummyRoadItems = [
  HomeItem(
    title: "طول الطريق",
    subtitle: "",
    type: "كم",
    amount: 256,
    color: Colors.white,
    img: "assets/images/road.png",
  ),
  HomeItem(
    title: "الرسوم",
    subtitle: "",
    type: "ج.م",
    amount: 20,
    color: Colors.white,
    img: "assets/images/shadow-barcode.png",
  ),
  HomeItem(
      title: "مشمس ",
      subtitle: "",
      type: "س",
      amount: 28,
      color: const Color(0xFFE0E0E0),
      img: "assets/images/weather-dark.png")
];

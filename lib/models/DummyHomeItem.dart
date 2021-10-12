import 'package:csp_mobile_app/api/dashboard_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeItem {
  Future<Response> Function()? future;
  String title;
  String subtitle;
  String type;
  int amount;
  Color color;
  String img;

  HomeItem({
    required this.title,
    required this.subtitle,
    required this.type,
    required this.amount,
    required this.color,
    required this.img,
    this.future,
  });
}

final DummyHomeCircularItems = [
  HomeItem(
    title: "رصيد المحفظة",
    subtitle: "رصيدك الحالى",
    type: "ج.م",
    amount: 0,
    color: Color.fromRGBO(0x40, 0x91, 0x6C, 1.0),
    img: "",
    future: DashboardApi.getWalletAmount,
  ),
  HomeItem(
    title: " عدد الاشتراكات ",
    subtitle: " عدد الاشتراكات ",
    type: "اشتراك ",
    amount: 2,
    color: Colors.orange,
    img: "",
    future: DashboardApi.getSubscriptionCount,
  ),
  HomeItem(
    title: "عدد المركبات",
    subtitle: " عدد المركبات",
    type: "مركبات",
    amount: 2,
    color: Colors.red,
    img: "",
    future: DashboardApi.getVehicleCount,
  ),
];

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
    title: "مشمس",
    subtitle: "رصيدك الحالى",
    type: "س",
    amount: 28,
    color: Colors.orange,
    img: "assets/images/weather-app.png",
  ),
  HomeItem(
      title: "حادث على طريق صلاح سالم",
      subtitle:
          "لقى شخص مصرعه، فيما أصيب 7 أشخاص آخرين في حادث تصادم سيارة ملاكي بجرار زراعي بالطريق الدائري بمركز مغاغة شمال المنيا، وتم نقل المصابين والجثة إلى المستشفي تحت تصرف النيا",
      type: "ج.م",
      amount: 0,
      color: Colors.green,
      img: "assets/images/weather-app.png")
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

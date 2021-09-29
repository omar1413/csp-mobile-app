import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeItem {
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
   required this.img
  });
}

final  DummyHomeCircularItems =  [
  HomeItem(
      title: "رصيد المحفظة",
      subtitle: "رصيدك الحالى",
      type: "ج.م",
      amount:  163 ,
      color: Colors.indigo
      ,img: "",
      ),

  HomeItem(
      title: "رصيد المحفظة",
      subtitle: "رصيدك الحالى",
      type: "ج.م",
      amount: 35,
      color: Colors.indigo
      ,img: "",
      ),
  HomeItem(
      title: "رصيد المحفظة",
      subtitle: "رصيدك الحالى",
      type: "ج.م",
      amount: 7,
      color: Colors.indigo
      ,img: "",
      ),
];

final  DummyHomeSquareItems =  [
  HomeItem(
      title: "السرعة الأن",
      subtitle: "",
      type: "ك/س",
      amount:  120 ,
      color: Colors.black
      ,img: "",
      ),

  HomeItem(
      title: "مشمس",
      subtitle: "رصيدك الحالى",
      type: "س",
      amount:28,
      color: Colors.orange
      ,img: "assets/images/weather-app.png",
      ),
  HomeItem(
      title: "حادث على طريق صلاح سالم",
      subtitle: "لقى شخص مصرعه، فيما أصيب 7 أشخاص آخرين في حادث تصادم سيارة ملاكي بجرار زراعي بالطريق الدائري بمركز مغاغة شمال المنيا، وتم نقل المصابين والجثة إلى المستشفي تحت تصرف النيا",
      type: "ج.م",
      amount: 0 , 
      color: Colors.green,
      img: "")
];
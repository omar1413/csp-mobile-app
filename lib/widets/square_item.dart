import 'package:csp_mobile_app/constant.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../models/DummyHomeItem.dart';
import 'package:flutter/material.dart';

class Square_slider extends StatelessWidget {
  HomeItem item;
  double amount;
  Square_slider({required this.item, required this.amount});
  //final List<Colors> colors= [Colors.green[600]];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      //alignment: Alignment.topCenter,
      height: 80,
      width: 80,
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.bottomLeft,
          scale: 0.1,
          image: AssetImage(item.img),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(offset: Offset(0, 2), color: Colors.black, blurRadius: 5),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Text(
          item.title,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.green[900]),
        ),
        Text(
          amount.toStringAsFixed(0).toString(),
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Theme.of(context).primaryColor,
              fontSize: 18),
        ),
        Text(
          item.type,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              fontSize: 11),
        ),
      ]),
    );
  }
}

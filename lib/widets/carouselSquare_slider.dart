import 'package:carousel_slider/carousel_slider.dart';
import 'package:csp_mobile_app/widets/square_sliderItem%20-.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../models/DummyHomeItem.dart';
import 'cirular_sliderItem.dart';

class CarouselSquare extends StatefulWidget {
  CarouselSquare() : super();
  @override
  CarouselSquareState createState() => CarouselSquareState();
}

class CarouselSquareState extends State<CarouselSquare> {
  static String routName = 'HomeScreen';
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));}
      return result;
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(DummyHomeSquareItems, (index, url) {
                return Square_slider(item: DummyHomeSquareItems[index]);
              }),
            ),
          );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:csp_mobile_app/widets/CustomText.dart';
import 'square_item.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../models/DummyHomeItem.dart';
import 'cirular_slider_item.dart';

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
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget CustomSquarWidget(HomeItem item) {
    return Container(
      height: 100,
      width: 150,
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              spreadRadius: 3,
              blurRadius: 10)
        ],
        image: DecorationImage(
          alignment: Alignment.bottomLeft,
          scale: 0.5,
          image: AssetImage(item.img),
        ),
        gradient: LinearGradient(colors: [
          Colors.white.withOpacity(0.9),
          item.color,
        ], begin: Alignment.centerLeft, end: Alignment.centerLeft),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Expanded(
            child: FittedBox(
              child: Text(
                item.title,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: FittedBox(
              child: Text(
                item.amount.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: FittedBox(
              child: Text(
                item.type.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 11),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        // Expanded(
        //   child: CustomSquarWidget(DummyHomeSquareItems[0]),
        // ),
        Expanded(
          child: CustomSquarWidget(DummyHomeSquareItems[1]),
        )
      ],
    );
  }
}
